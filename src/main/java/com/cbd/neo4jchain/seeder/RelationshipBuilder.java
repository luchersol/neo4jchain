package com.cbd.neo4jchain.seeder;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.ObjectInputFilter.Status;
import java.lang.Thread.State;

import com.cbd.neo4jchain.chain.ChainFaceted;
import com.cbd.neo4jchain.chain.ChainState;
import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.issue.Issue;
import com.cbd.neo4jchain.organization.Organization;
import com.cbd.neo4jchain.person.Person;
import com.cbd.neo4jchain.service_org.ServiceOrg;
import com.cbd.neo4jchain.sla.Sla;
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.util.RelationName.ChainStateRelation;
import com.cbd.neo4jchain.util.RelationName.CustomerRelation;
import com.cbd.neo4jchain.util.RelationName.IssueRelation;
import com.cbd.neo4jchain.util.RelationName.OrganizationRelation;

public class RelationshipBuilder {

    FileWriter file;
    String sourceClass;
    String targetClass;
    String relationship;

    static final boolean READ_FILE = true;
    static final String PATH_RELATION_FILE = "src/main/resources/relationship.csv";

    private RelationshipBuilder(FileWriter file) {
        this.file = file;
    }

    public static RelationshipBuilder builder(FileWriter file) {
        return new RelationshipBuilder(file);
    }

    public static void createRelationship(FileWriter file) throws Exception {
        if (READ_FILE) {
            String linea;
            FileWriter fileWriter = new FileWriter(NodeSeeder.PATH_CYPHER);
            try (BufferedReader br = new BufferedReader(new FileReader(PATH_RELATION_FILE))) {
                while ((linea = br.readLine()) != null) {
                    String[] args = linea.split(",");
                    edge(fileWriter,
                            args[0],
                            Integer.valueOf(args[1]),
                            args[2],
                            args[3],
                            Integer.valueOf(args[2]));
                }
            } catch (Exception e) {
                throw new IllegalAccessException("No se ha podido acceder al archivo de relaciones.");
            }
        } else {
            RelationshipBuilder relationshipBuilder = builder(file);
            relationshipBuilder.edgesChainState();
            relationshipBuilder.edgesCustomer();
            relationshipBuilder.edgesIssue();
            relationshipBuilder.edgesOrganization();
        }

    }

    public void edgesChainState() throws Exception {
        this.configNodes(ChainState.class, State.class)
                .configRelationship(ChainStateRelation.INITIAL_STATUS)
                .edge(0, 1)
                .configRelationship(ChainStateRelation.TERMINAL_STATUS)
                .edge(2, 3)
                .configTarget(Sla.class)
                .configRelationship(ChainStateRelation.SLA)
                .edge(4, 5);
    }

    public void edgesCustomer() throws Exception {
        this.configSource(Customer.class)
                .configTarget(Organization.class)
                .configRelationship(CustomerRelation.ORGANIZATION)
                .edge(0, 1)
                .configTarget(Sla.class)
                .configRelationship(CustomerRelation.SLA)
                .edge(2, 3);
    }

    public void edgesIssue() throws Exception {
        this.configSource(Issue.class)
                .configTarget(ServiceOrg.class)
                .configRelationship(IssueRelation.SERVICE_ORG)

                .configTarget(Status.class)
                .configRelationship(IssueRelation.STATUS)

                .configTarget(Team.class)
                .configRelationship(IssueRelation.TEAM)

                .configTarget(Person.class)
                .configRelationship(IssueRelation.ASSIGNED_PERSON)

                .configRelationship(IssueRelation.OWNER_PERSON);
    }

    public void edgesOrganization() throws Exception {
        this.configSource(Organization.class)
                .configTarget(Team.class)
                .configRelationship(OrganizationRelation.TEAMS)

                .configTarget(ServiceOrg.class)
                .configRelationship(IssueRelation.STATUS)

                .configRelationship(OrganizationRelation.CHAIN)
                .configTarget(ChainState.class)

                .configTarget(ChainFaceted.class)

        ;
    }

    public RelationshipBuilder configNodes(Class<?> sourceClass, Class<?> targetClass) {
        this.sourceClass = sourceClass.getSimpleName().toLowerCase();
        this.targetClass = targetClass.getSimpleName().toLowerCase();
        return this;
    }

    public RelationshipBuilder configSource(Class<?> sourceClass) {
        this.sourceClass = sourceClass.getSimpleName().toLowerCase();
        return this;
    }

    public RelationshipBuilder configTarget(Class<?> targetClass) {
        this.targetClass = targetClass.getSimpleName().toLowerCase();
        return this;
    }

    public RelationshipBuilder configRelationship(String relationship) {
        this.relationship = relationship;
        return this;
    }

    public RelationshipBuilder edge(int sourceId, int targetId) throws Exception {
        String query = new StringBuilder("MERGE (")
                .append(sourceClass)
                .append(sourceId)
                .append(")-[:")
                .append(relationship)
                .append("]->(")
                .append(targetClass)
                .append(targetId)
                .append(") \n").toString();
        file.write(query);
        file.flush();
        return this;
    }

    public static void edge(FileWriter file, String sourceClass, int sourceId, String relationship,
            String targetClass,
            int targetId) throws Exception {
        String query = new StringBuilder("MERGE (")
                .append(sourceClass)
                .append(sourceId)
                .append(")-[:")
                .append(relationship)
                .append("]->(")
                .append(targetClass)
                .append(targetId)
                .append(") \n").toString();
        file.write(query);
        file.flush();
    }
}
