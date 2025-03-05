package com.cbd.neo4jchain.seeder;

import static com.cbd.neo4jchain.seeder.RelationshipBuilder.createRelationship;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_CHAIN_FACETED;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_CHAIN_STATE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_CUSTOMER;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_ISSUE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_OBJECTIVE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_ORGANIZATION;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_PERSON;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_PRIVILEGE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_PROVIDER;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_REQUEST_TYPE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_ROLE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_SCOPE;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_SERVICE_ORG;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_SLA;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_STATUS;
import static com.cbd.neo4jchain.seeder.SeederConfig.NUM_TEAM;

import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

import com.cbd.neo4jchain.chain.ChainFaceted;
import com.cbd.neo4jchain.chain.ChainState;
import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.enums.Metric;
import com.cbd.neo4jchain.enums.OwnershipType;
import com.cbd.neo4jchain.enums.Priority;
import com.cbd.neo4jchain.enums.UnitTime;
import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.model.AbstractNode;
import com.cbd.neo4jchain.objective.Objective;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.privilege.Privilege;
import com.cbd.neo4jchain.provider.Provider;
import com.cbd.neo4jchain.requestType.RequestType;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.scope.Scope;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.team.Team;
import com.github.javafaker.Faker;

public class NodeSeeder {

    List<ChainFaceted> chainFaceteds;
    List<ChainState> chainStates;
    List<Customer> customers;
    List<Issue> issues;
    List<Objective> objectives;
    List<Organization> organizations;
    List<Person> persons;
    List<Privilege> privileges;
    List<Provider> providers;
    List<RequestType> requestTypes;
    List<Role> roles;
    List<Scope> scopes;
    List<ServiceOrg> serviceOrgs;
    List<Sla> slas;
    List<Status> status;
    List<Team> teams;

    Faker faker;
    FileWriter file;

    static final String PATH_CYPHER = "src/main/resources/db/migration/neo4j/V1_create_node.cypher";

    private NodeSeeder() throws IOException {
        this.faker = new Faker(new Random(1L));
        this.file = new FileWriter(PATH_CYPHER, false);
    }

    public static void main(String[] args) throws Exception {
        NodeSeeder nodeSeeder = new NodeSeeder();
        nodeSeeder.loadTestData();
        nodeSeeder.generateCypher();
    }

    public void generateCypher() throws Exception {
        file.write("MATCH (n) DETACH DELETE n; \n\n");
        createNodes();
        createRelationship(file);
    }

    public void createNodes() throws Exception {
        doQuery(chainFaceteds, "id", "name", "version", "description", "ownershipType");
        doQuery(chainStates, "id", "name", "version", "description", "ownershipType");
        doQuery(customers, "id");
        doQuery(issues, "id", "title", "description");
        doQuery(objectives, "id", "metric", "value", "unit");
        doQuery(organizations, "id", "name", "code");
        doQuery(persons, "id", "lastName", "firstName", "email", "phone");
        doQuery(privileges, "id", "name");
        doQuery(providers, "id");
        doQuery(requestTypes, "id", "name");
        doQuery(roles, "id", "name");
        doQuery(scopes, "id", "name", "priority");
        doQuery(serviceOrgs, "id", "name", "description");
        doQuery(slas, "id", "name");
        doQuery(status, "id", "name");
        doQuery(teams, "id", "name", "specialization");
    }

    public <T extends AbstractNode> void doQuery(List<T> list, String... properties) throws Exception {

        if (list == null || list.isEmpty()) {
            throw new IllegalArgumentException("La lista no puede estar vacía.");
        }

        Class<?> clazz = list.get(0).getClass();
        file.write("// " + clazz.getSimpleName() + "\n");
        try {
            for (T t : list) {
                String clazzName = t.getClass().getSimpleName();
                StringBuilder query = new StringBuilder("MERGE (")
                        .append(clazzName.toLowerCase())
                        .append(t.getId())
                        .append(":")
                        .append(clazzName)
                        .append(" {");

                for (int i = 0; i < properties.length; i++) {
                    Field field = getField(clazz, properties[i]);
                    Object value = field.get(t);
                    if (value != null) {
                        query.append(field.getName()).append(": \"").append(value).append("\"");
                        if (i < properties.length - 1)
                            query.append(", ");
                    }
                }

                query.append("})\n");
                this.file.write(query.toString());
                this.file.flush();
            }
        } catch (IOException e) {
            throw new RuntimeException("Error al escribir en el archivo.", e);
        }
        file.write("\n");
    }

    public static Field getField(Class<?> clazz, String fieldName) {
        while (clazz != null && clazz != Object.class) {
            try {
                Field field = clazz.getDeclaredField(fieldName);
                field.setAccessible(true); // Hacer accesible si es privado
                return field;
            } catch (NoSuchFieldException e) {
                clazz = clazz.getSuperclass(); // Subir en la jerarquía de clases
            }
        }
        return null;
    }

    public NodeSeeder loadTestData() {
        this.chainFaceteds = seedChainFaceted();
        this.chainStates = seedChainState();
        this.customers = seedCustomer();
        this.issues = seedIssue();
        this.objectives = seedObjective();
        this.organizations = seedOrganization();
        this.persons = seedPerson();
        this.privileges = seedPrivilege();
        this.providers = seedProvider();
        this.requestTypes = seedRequestType();
        this.roles = seedRole();
        this.scopes = seedScope();
        this.serviceOrgs = seedServiceOrg();
        this.slas = seedSla();
        this.status = seedStatus();
        this.teams = seedTeam();
        return this;
    }

    public List<ChainState> seedChainState() {
        // String name, String version, String description, OwnershipType ownershipType
        return LongStream.range(0, NUM_CHAIN_STATE)
                .boxed()
                .map(id -> new ChainState(id,
                        faker.company().name(),
                        faker.app().version(),
                        faker.lorem().sentence(),
                        faker.options().option(OwnershipType.class)))
                .collect(Collectors.toList());
    }

    public List<ChainFaceted> seedChainFaceted() {
        // String name, String version, String description, OwnershipType ownershipType
        return LongStream.range(0, NUM_CHAIN_FACETED)
                .boxed()
                .map(id -> new ChainFaceted(id,
                        faker.company().name(),
                        faker.app().version(),
                        faker.lorem().sentence(),
                        faker.options().option(OwnershipType.class)))
                .collect(Collectors.toList());
    }

    public List<Customer> seedCustomer() {
        return LongStream.range(0, NUM_CUSTOMER)
                .boxed()
                .map(id -> new Customer(id))
                .collect(Collectors.toList());
    }

    public List<Issue> seedIssue() {
        // String title, String description
        return LongStream.range(0, NUM_ISSUE)
                .boxed()
                .map(id -> new Issue(id,
                        faker.lorem().sentence(),
                        faker.lorem().paragraph()))
                .collect(Collectors.toList());
    }

    public List<Objective> seedObjective() {
        // Metric metric, Double value, UnitTime unit
        return LongStream.range(0, NUM_OBJECTIVE)
                .boxed()
                .map(id -> new Objective(id,
                        faker.options().option(Metric.class),
                        faker.number().randomDouble(2, 1, 100),
                        faker.options().option(UnitTime.class)))
                .collect(Collectors.toList());
    }

    public List<Organization> seedOrganization() {
        // String name, String code
        return LongStream.range(0, NUM_ORGANIZATION)
                .boxed()
                .map(id -> new Organization(id,
                        faker.company().name(),
                        faker.code().isbn10()))
                .collect(Collectors.toList());
    }

    public List<Person> seedPerson() {
        // String lastName, String firstName, String email, String phone
        return LongStream.range(0, NUM_PERSON)
                .boxed()
                .map(id -> new Person(id,
                        faker.name().lastName(),
                        faker.name().firstName(),
                        faker.internet().emailAddress(),
                        faker.phoneNumber().phoneNumber()))
                .collect(Collectors.toList());
    }

    public List<Privilege> seedPrivilege() {
        // String name
        return LongStream.range(0, NUM_PRIVILEGE)
                .boxed()
                .map(id -> new Privilege(id,
                        faker.lorem().word()))
                .collect(Collectors.toList());
    }

    public List<Provider> seedProvider() {
        return LongStream.range(0, NUM_PROVIDER)
                .boxed()
                .map(id -> new Provider(id))
                .collect(Collectors.toList());
    }

    public List<RequestType> seedRequestType() {
        // String name
        return LongStream.range(0, NUM_REQUEST_TYPE)
                .boxed()
                .map(id -> new RequestType(id,
                        faker.lorem().word()))
                .collect(Collectors.toList());
    }

    public List<Role> seedRole() {
        // String name
        return LongStream.range(0, NUM_ROLE)
                .boxed()
                .map(id -> new Role(id,
                        faker.job().title()))
                .collect(Collectors.toList());
    }

    public List<Scope> seedScope() {
        // String name, Priority priority
        return LongStream.range(0, NUM_SCOPE)
                .boxed()
                .map(id -> new Scope(id,
                        faker.lorem().word(),
                        faker.options().option(Priority.class)))
                .collect(Collectors.toList());
    }

    public List<ServiceOrg> seedServiceOrg() {
        // String name, String description
        return LongStream.range(0, NUM_SERVICE_ORG)
                .boxed()
                .map(id -> new ServiceOrg(id,
                        faker.company().name(),
                        faker.lorem().sentence()))
                .collect(Collectors.toList());
    }

    public List<Sla> seedSla() {
        // String name
        return LongStream.range(0, NUM_SLA)
                .boxed()
                .map(id -> new Sla(id,
                        faker.lorem().word()))
                .collect(Collectors.toList());
    }

    public List<Status> seedStatus() {
        // String name
        return LongStream.range(0, NUM_STATUS)
                .boxed()
                .map(id -> new Status(id,
                        faker.lorem().word()))
                .collect(Collectors.toList());
    }

    public List<Team> seedTeam() {
        // String name, String specialization
        return LongStream.range(0, NUM_TEAM)
                .boxed()
                .map(id -> new Team(id,
                        faker.company().name(),
                        faker.lorem().word()))
                .collect(Collectors.toList());
    }

}
