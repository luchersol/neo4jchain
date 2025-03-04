package com.cbd.neo4jchain.seeder;

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

import java.lang.reflect.Constructor;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.LongStream;

import org.springframework.data.neo4j.core.Neo4jTemplate;
import org.springframework.stereotype.Component;

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

@Component
public class NodeSeeder {

    Neo4jTemplate neo4jTemplate;
    Faker faker;

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

    private NodeSeeder(Neo4jTemplate neo4jTemplate) {
        this.neo4jTemplate = neo4jTemplate;
        this.faker = new Faker(new Random(1L));
    }

    public NodeSeeder loadNode() {
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

    public NodeSeeder saveNode() {
        this.chainFaceteds = neo4jTemplate.saveAll(this.chainFaceteds);
        this.chainStates = neo4jTemplate.saveAll(this.chainStates);
        this.customers = neo4jTemplate.saveAll(this.customers);
        this.issues = neo4jTemplate.saveAll(this.issues);
        this.objectives = neo4jTemplate.saveAll(this.objectives);
        this.organizations = neo4jTemplate.saveAll(this.organizations);
        this.persons = neo4jTemplate.saveAll(this.persons);
        this.privileges = neo4jTemplate.saveAll(this.privileges);
        this.providers = neo4jTemplate.saveAll(this.providers);
        this.requestTypes = neo4jTemplate.saveAll(this.requestTypes);
        this.roles = neo4jTemplate.saveAll(this.roles);
        this.scopes = neo4jTemplate.saveAll(this.scopes);
        this.serviceOrgs = neo4jTemplate.saveAll(this.serviceOrgs);
        this.slas = neo4jTemplate.saveAll(this.slas);
        this.status = neo4jTemplate.saveAll(this.status);
        this.teams = neo4jTemplate.saveAll(this.teams);
        return this;
    }

    public List<ChainState> seedChainState() {
        // String name, String version, String description, OwnershipType ownershipType
        return rangeCreate(10, ChainState.class,
                faker.company().name(),
                faker.app().version(),
                faker.lorem().sentence(),
                faker.options().option(OwnershipType.class));
    }

    public List<ChainFaceted> seedChainFaceted() {
        // String name, String version, String description, OwnershipType ownershipType
        return rangeCreate(10, ChainFaceted.class,
                faker.company().name(),
                faker.app().version(),
                faker.lorem().sentence(),
                faker.options().option(OwnershipType.class));
    }

    public List<Customer> seedCustomer() {
        return rangeCreate(NUM_CUSTOMER, Customer.class);
    }

    public List<Issue> seedIssue() {
        // String title, String description
        return rangeCreate(NUM_ISSUE, Issue.class,
                faker.lorem().sentence(),
                faker.lorem().paragraph());
    }

    public List<Objective> seedObjective() {
        // Metric metric, Double value, UnitTime unit
        return rangeCreate(NUM_OBJECTIVE, Objective.class,
                faker.options().option(Metric.class),
                faker.number().randomDouble(2, 1, 100),
                faker.options().option(UnitTime.class));
    }

    public List<Organization> seedOrganization() {
        // String name, String code
        return rangeCreate(NUM_ORGANIZATION, Organization.class,
                faker.company().name(),
                faker.code().isbn10());
    }

    public List<Person> seedPerson() {
        // String lastName, String firstName, String email, String phone
        return rangeCreate(NUM_PERSON, Person.class,
                faker.name().lastName(),
                faker.name().firstName(),
                faker.internet().emailAddress(),
                faker.phoneNumber().phoneNumber());
    }

    public List<Privilege> seedPrivilege() {
        // String name
        return rangeCreate(NUM_PRIVILEGE, Privilege.class,
                faker.lorem().word());
    }

    public List<Provider> seedProvider() {
        return rangeCreate(NUM_PROVIDER, Provider.class);
    }

    public List<RequestType> seedRequestType() {
        // String name
        return rangeCreate(NUM_REQUEST_TYPE, RequestType.class,
                faker.lorem().word());
    }

    public List<Role> seedRole() {
        // String name
        return rangeCreate(NUM_ROLE, Role.class,
                faker.job().title());
    }

    public List<Scope> seedScope() {
        // String name, Priority priority
        return rangeCreate(NUM_SCOPE, Scope.class,
                faker.lorem().word(),
                faker.options().option(Priority.class));
    }

    public List<ServiceOrg> seedServiceOrg() {
        // String name, String description
        return rangeCreate(NUM_SERVICE_ORG, ServiceOrg.class,
                faker.company().name(),
                faker.lorem().sentence());
    }

    public List<Sla> seedSla() {
        // String name
        return rangeCreate(NUM_SLA, Sla.class,
                faker.lorem().word());
    }

    public List<Status> seedStatus() {
        // String name
        return rangeCreate(NUM_STATUS, Status.class,
                faker.lorem().word());
    }

    public List<Team> seedTeam() {
        // String name, String specialization
        return rangeCreate(NUM_TEAM, Team.class,
                faker.company().name(),
                faker.lorem().word());
    }

    private static <T> List<T> rangeCreate(int num, Class<T> clazz, Object... params) {
        Class<?>[] typeParams = Arrays.stream(params)
                .map(Object::getClass)
                .toArray(Class[]::new);

        return IntStream.range(0, num)
                .boxed()
                .map(_ -> {
                    try {
                        var constructor = clazz.getConstructor(typeParams);
                        return (T) constructor.newInstance(params);
                    } catch (Exception e) {
                        e.printStackTrace();
                        return null;
                    }
                })
                .collect(Collectors.toList());
    }

    private static <T> List<T> rangeCreate(int num, Class<T> clazz) {
        return LongStream.range(0, num)
                .boxed()
                .map(i -> extracted(clazz, i))
                .collect(Collectors.toList());
    }

    private static <T> T extracted(Class<T> clazz, Long id) {
        try {
            Constructor<T> constructor = clazz.getDeclaredConstructor();
            constructor.setAccessible(true);
            T node = constructor.newInstance();
            if (node instanceof AbstractNode) {
                ((AbstractNode) node).setId(id);
            }
            return node;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
