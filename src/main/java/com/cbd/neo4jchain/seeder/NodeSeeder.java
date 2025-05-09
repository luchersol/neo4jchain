package com.cbd.neo4jchain.seeder;

import static com.cbd.neo4jchain.seeder.SeederConfig.*;

import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.LongStream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.cbd.neo4jchain.Neo4jChainApplication;
import com.cbd.neo4jchain.chain.faceted.ChainFaceted;
import com.cbd.neo4jchain.chain.state.ChainState;
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
import com.cbd.neo4jchain.request_type.RequestType;
import com.cbd.neo4jchain.role.Role;
import com.cbd.neo4jchain.scope.Scope;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.status.Status;
import com.cbd.neo4jchain.team.Team;
import com.github.javafaker.Faker;

public class NodeSeeder {

        private static final Logger logger = LoggerFactory.getLogger(Neo4jChainApplication.class);

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

        boolean deleteData;
        String pathCypher;
        String relationPath;

        public NodeSeeder(Boolean deleteData, String pathCypher, String relationPath) throws IOException {
                this.deleteData = deleteData;
                this.pathCypher = pathCypher;
                this.relationPath = relationPath;
                this.faker = new Faker(new Random(1L));
                this.file = new FileWriter(pathCypher, false);
        }

        public void generateCypher() throws Exception {
                if (this.deleteData)
                        file.write("MATCH (n) DETACH DELETE n; \n\n");
                createNodes();
                // Se produce una excepción en medio de la creación de relaciones
                // createRelationship(file, this.relationPath);
        }

        private static String[] specializations = {
                        "Desarrollador Backend",
                        "Desarrollador Frontend",
                        "Ingeniero DevOps",
                        "Analista de Datos",
                        "Arquitecto de Software",
                        "Especialista en Ciberseguridad",
                        "Ingeniero QA",
                        "Product Manager",
                        "UX/UI Designer",
                        "Scrum Master"
        };

        public void createNodes() throws Exception {
                doQuery(chainFaceteds, "id", "name", "version", "description", "ownershipType");
                doQuery(chainStates, "id", "name", "version", "description", "ownershipType");
                doQuery(customers, "id", "name");
                doQuery(issues, "id", "name", "title", "description");
                doQuery(objectives, "id", "name", "metric", "value", "unit");
                doQuery(organizations, "id", "name", "code");
                doQuery(persons, "id", "name", "lastName", "firstName", "email", "phone", "password");
                doQuery(privileges, "id", "name");
                doQuery(providers, "id", "name");
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
                String message = String.format("Create nodes %s (%d)", list.getFirst().getClass().getSimpleName(),
                                list.size());
                logger.info(message);
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
                                                "Descripcion chainstate " + id,
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
                                                "Descripcion chainfaceted " + id,
                                                faker.options().option(OwnershipType.class)))
                                .collect(Collectors.toList());
        }

        public List<Customer> seedCustomer() {
                return LongStream.range(0, NUM_CUSTOMER)
                                .boxed()
                                .map(id -> new Customer(id,
                                                faker.name().name()))
                                .collect(Collectors.toList());
        }

        public List<Issue> seedIssue() {
                // String title, String description
                return LongStream.range(0, NUM_ISSUE)
                                .boxed()
                                .map(id -> new Issue(id,
                                                faker.name().name(),
                                                faker.company().buzzword() + " " + faker.hacker().noun(),
                                                faker.hacker().verb() + " " + faker.hacker().noun()))
                                .collect(Collectors.toList());
        }

        public List<Objective> seedObjective() {
                // Metric metric, Double value, UnitTime unit
                return LongStream.range(0, NUM_OBJECTIVE)
                                .boxed()
                                .map(id -> new Objective(id,
                                                faker.name().name(),
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
                                                faker.name().username(),
                                                faker.name().lastName(),
                                                faker.name().firstName(),
                                                faker.internet().emailAddress(),
                                                faker.phoneNumber().phoneNumber(),
                                                faker.internet().password()))
                                .collect(Collectors.toList());
        }

        public List<Privilege> seedPrivilege() {
                // String name
                return LongStream.range(0, NUM_PRIVILEGE)
                                .boxed()
                                .map(id -> new Privilege(id,
                                                "Privilegio " + id))
                                .collect(Collectors.toList());
        }

        public List<Provider> seedProvider() {
                return LongStream.range(0, NUM_PROVIDER)
                                .boxed()
                                .map(id -> new Provider(id,
                                                "Provider " + id))
                                .collect(Collectors.toList());
        }

        public List<RequestType> seedRequestType() {
                // String name
                return LongStream.range(0, NUM_REQUEST_TYPE)
                                .boxed()
                                .map(id -> new RequestType(id,
                                                "Request Type " + id))
                                .collect(Collectors.toList());
        }

        public List<Role> seedRole() {
                // String name
                return LongStream.range(0, NUM_ROLE)
                                .boxed()
                                .map(id -> new Role(id,
                                                faker.company().profession()))
                                .collect(Collectors.toList());
        }

        public List<Scope> seedScope() {
                // String name, Priority priority
                return LongStream.range(0, NUM_SCOPE)
                                .boxed()
                                .map(id -> new Scope(id,
                                                "Scope name " + id,
                                                faker.options().option(Priority.class)))
                                .collect(Collectors.toList());
        }

        public List<ServiceOrg> seedServiceOrg() {
                // String name, String description
                return LongStream.range(0, NUM_SERVICE_ORG)
                                .boxed()
                                .map(id -> new ServiceOrg(id,
                                                faker.company().name(),
                                                faker.company().buzzword()))
                                .collect(Collectors.toList());
        }

        public List<Sla> seedSla() {
                // String name
                return LongStream.range(0, NUM_SLA)
                                .boxed()
                                .map(id -> new Sla(id,
                                                "Sla name " + id))
                                .collect(Collectors.toList());
        }

        public List<Status> seedStatus() {
                // String name
                return LongStream.range(0, NUM_STATUS)
                                .boxed()
                                .map(id -> new Status(id,
                                                "Status name " + id))
                                .collect(Collectors.toList());
        }

        public List<Team> seedTeam() {
                // String name, String specialization
                return LongStream.range(0, NUM_TEAM)
                                .boxed()
                                .map(id -> new Team(id,
                                                faker.company().name(),
                                                faker.options().option(specializations)))
                                .collect(Collectors.toList());
        }

}
