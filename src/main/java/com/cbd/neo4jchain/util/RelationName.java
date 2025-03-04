package com.cbd.neo4jchain.util;

public class RelationName {
    public static class ChainStateRelation {
        public static final String INITIAL_STATUS = "INITIAL",
                TERMINAL_STATUS = "TERMINAL",
                SLA = "INITIAL_SLA";
    }

    public static class CustomerRelation {
        public static final String ORGANIZATION = "ORGANIZATION",
                SLA = "SLA";
    }

    public static class IssueRelation {
        public static final String SERVICE_ORG = "SERVICE",
                STATUS = "STATUS",
                TEAM = "ASIGNED_TO",
                ASSIGNED_PERSON = "ASSIGNED_TO",
                OWNER_PERSON = "CREATED_BY";
    }

    public static class OrganizationRelation {
        public static final String ORGANIZATION = "PARENT",
                TEAMS = "TEAM",
                SERVICE_ORGS = "SERVICE",
                CHAIN = "BELONGS_TO";
    }

    public static class PersonRelation {
        public static final String ROLES = "ROLE";
    }

    public static class ProviderRelation {
        public static final String ORGANIZATION = "ORGANIZATION",
                SERVICE_ORG = "SERVICE",
                SERVICE_ORGS = "IS_PROVIDER_OF",
                SLA = "SLA";
    }

    public static class RoleRelation {
        public static final String PRIVILEGE = "PRIVILEGE";
    }

    public static class ScopeRelation {
        public static final String REQUEST_TYPE = "REQUEST_TYPE",
                OBJECTIVES = "OBJETIVE";
    }

    public static class ServiceOrgRelation {
        public static final String STATUS = "STATUS",
                REQUEST_TYPES = "REQUEST_TYPE",
                TEAMS = "TEAM",
                CUSTOMERS = "CUSTOMER";
    }

    public static class SlaRelation {
        public static final String SCOPES = "GUARANTEE";
    }

    public static class StatusRelation {
        public static final String STATUSES = "NEXT_STATUS";
    }

    public static class TeamRelation {
        public static final String PERSONS = "MEMBER",
                ROLES = "ROLE";
    }
}
