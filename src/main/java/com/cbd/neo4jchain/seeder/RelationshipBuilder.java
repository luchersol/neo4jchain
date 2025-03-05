package com.cbd.neo4jchain.seeder;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputFilter.Status;
import java.lang.Thread.State;

import com.cbd.neo4jchain.chain.faceted.ChainFaceted;
import com.cbd.neo4jchain.chain.state.ChainState;
import com.cbd.neo4jchain.customer.Customer;
import com.cbd.neo4jchain.issue.Issue;
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
import com.cbd.neo4jchain.team.Team;
import com.cbd.neo4jchain.util.RelationName.ChainStateRelation;
import com.cbd.neo4jchain.util.RelationName.CustomerRelation;
import com.cbd.neo4jchain.util.RelationName.IssueRelation;
import com.cbd.neo4jchain.util.RelationName.OrganizationRelation;
import com.cbd.neo4jchain.util.RelationName.PersonRelation;
import com.cbd.neo4jchain.util.RelationName.ProviderRelation;
import com.cbd.neo4jchain.util.RelationName.RoleRelation;
import com.cbd.neo4jchain.util.RelationName.ScopeRelation;
import com.cbd.neo4jchain.util.RelationName.ServiceOrgRelation;
import com.cbd.neo4jchain.util.RelationName.SlaRelation;
import com.cbd.neo4jchain.util.RelationName.StatusRelation;
import com.cbd.neo4jchain.util.RelationName.TeamRelation;

public class RelationshipBuilder {

    FileWriter file;
    String sourceClass;
    String targetClass;
    String relationship;

    private RelationshipBuilder(FileWriter file) {
        this.file = file;
    }

    public static void createRelationship(FileWriter fileWriter, String relationPath) throws Exception {
        if (relationPath != null) {
            String linea;
            try (BufferedReader br = new BufferedReader(new FileReader(relationPath))) {
                br.readLine(); // Saltamos la primera línea
                while ((linea = br.readLine()) != null) {
                    String[] args = linea.split("\t");
                    edge(fileWriter,
                            args[0].toLowerCase(),
                            Integer.valueOf(args[1]),
                            args[2].toUpperCase(),
                            args[3].toLowerCase(),
                            Integer.valueOf(args[2]));
                }
            } catch (IOException e) {
                throw new IllegalAccessException("No se ha podido acceder al archivo de relaciones.");
            } catch (Exception e) {
                throw new IllegalArgumentException("Ha ocurrido algún error en la creación de relaciones");
            }

        } else {
            RelationshipBuilder relationshipBuilder = new RelationshipBuilder(fileWriter);
            relationshipBuilder.edgesChainState();
            relationshipBuilder.edgesCustomer();
            relationshipBuilder.edgesIssue();
            relationshipBuilder.edgesOrganization();
            relationshipBuilder.edgesPerson();
            relationshipBuilder.edgesProvider();
            relationshipBuilder.edgesRole();
            relationshipBuilder.edgesScope();
            relationshipBuilder.edgesServiceOrg();
            relationshipBuilder.edgesSla();
            relationshipBuilder.edgesStatus();
            relationshipBuilder.edgesTeam();
        }

    }

    public void edgesChainState() throws Exception {
        this.configNodes(ChainState.class, State.class)
                .configRelationship(ChainStateRelation.INITIAL_STATUS)

                .configRelationship(ChainStateRelation.TERMINAL_STATUS)

                .configTarget(Sla.class)
                .configRelationship(ChainStateRelation.SLA)

                .end();
    }

    public void edgesCustomer() throws Exception {
        this.configSource(Customer.class)
                .configTarget(Organization.class)
                .configRelationship(CustomerRelation.ORGANIZATION)

                .configTarget(Sla.class)
                .configRelationship(CustomerRelation.SLA)

                .end();
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

                .configRelationship(IssueRelation.OWNER_PERSON)

                .end();
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

                .end();
    }

    public void edgesPerson() throws Exception {
        this.configSource(Person.class)
                .configTarget(Role.class)
                .configRelationship(PersonRelation.ROLES)

                .end();
    }

    public void edgesProvider() throws Exception {
        this.configSource(Provider.class)
                .configTarget(Organization.class)
                .configRelationship(ProviderRelation.ORGANIZATION)

                .configTarget(ServiceOrg.class)
                .configRelationship(ProviderRelation.SERVICE_ORG)
                .configRelationship(ProviderRelation.SERVICE_ORGS)

                .configTarget(Sla.class)
                .configRelationship(ProviderRelation.SLA)

                .end();

    }

    public void edgesRole() throws Exception {
        this.configSource(Role.class)
                .configTarget(Privilege.class)
                .configRelationship(RoleRelation.PRIVILEGE)

                .end();
    }

    public void edgesScope() throws Exception {
        this.configSource(Scope.class)
                .configTarget(RequestType.class)
                .configRelationship(ScopeRelation.REQUEST_TYPE)

                .configTarget(Objective.class)
                .configRelationship(ScopeRelation.OBJECTIVES)

                .end();
    }

    public void edgesServiceOrg() throws Exception {
        this.configSource(ServiceOrg.class)
                .configTarget(Status.class)
                .configRelationship(ServiceOrgRelation.STATUS)

                .configTarget(RequestType.class)
                .configRelationship(ServiceOrgRelation.REQUEST_TYPES)

                .configTarget(Team.class)
                .configRelationship(ServiceOrgRelation.TEAMS)

                .configTarget(Customer.class)
                .configRelationship(ServiceOrgRelation.CUSTOMERS)

                .end();
    }

    public void edgesSla() throws Exception {
        this.configSource(Sla.class)
                .configTarget(Scope.class)
                .configRelationship(SlaRelation.SCOPES)

                .end();
    }

    public void edgesStatus() throws Exception {
        this.configSource(Status.class)
                .configTarget(Status.class)
                .configRelationship(StatusRelation.STATUSES)

                .end();
    }

    public void edgesTeam() throws Exception {
        this.configSource(Team.class)
                .configTarget(Person.class)
                .configRelationship(TeamRelation.PERSONS)

                .configTarget(Role.class)
                .configRelationship(TeamRelation.ROLES)

                .end();
    }

    public RelationshipBuilder configNodes(Class<?> sourceClass, Class<?> targetClass) {
        this.sourceClass = sourceClass.getSimpleName().toLowerCase();
        this.targetClass = targetClass.getSimpleName().toLowerCase();
        return this;
    }

    public RelationshipBuilder configSource(Class<?> sourceClass) throws Exception {
        this.sourceClass = sourceClass.getSimpleName().toLowerCase();
        this.file.write("// " + sourceClass.getSimpleName() + " Relations:\n");
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

    public void end() throws Exception {
        this.file.write("\n\n");
        this.file.flush();
    }

    public RelationshipBuilder edge(int sourceId, int... targetIds) throws Exception {
        for (int targetId : targetIds)
            edge(sourceId, targetId);
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
