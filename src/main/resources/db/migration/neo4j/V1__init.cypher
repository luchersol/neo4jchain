MATCH (n)
DETACH DELETE n;

CREATE
(chain1:ChainState { version: 1.0, description: "Descripcion chain 1", ownershipType:"STATE" }),
(chain2:ChainFaceted { version: 2.0, description: "Descripcion chain 2", ownershipType:"STATE_TEAM" }),

(customer1:Customer),
(customer2:Customer),

(org1:Organization { name: "Org A", code: "A001", status: "ACTIVE" }),
(org2:Organization { name: "Org B", code: "B002", status: "INACTIVE" }),
(org3:Organization { name: "Org C", code: "C003", status: "ACTIVE" }),

(team1:Team { name: "Team Alpha", specialization: "Software Development" }),
(team2:Team { name: "Team Beta", specialization: "Marketing" }),

(serviceOrg1:ServiceOrg { type: 'IT', contact_info: 'contact@madridit.com', name: 'ServiceOrg1' }),
(serviceOrg2:ServiceOrg { type: 'HR', contact_info: 'contact@barcelonahr.com', name: 'ServiceOrg2' }),

(person1:Person { firstName: "Alice", lastName: "Smith", status: "ACTIVE", function: "Developer", email: "alice.smith@org.com", phone: "123-456-7890" }),
(person2:Person { firstName: "Bob", lastName: "Johnson", status: "ACTIVE", function: "Designer", email: "bob.johnson@org.com", phone: "234-567-8901" }),
(person3:Person { firstName: "Charlie", lastName: "Brown", status: "INACTIVE", function: "Marketer", email: "charlie.brown@org.com", phone: "345-678-9012" }),
(person4:Person { firstName: "David", lastName: "Williams", status: "ACTIVE", function: "Accountant", email: "david.williams@org.com", phone: "456-789-0123" }),

(sla1:SLA { name: "SLA 1", description: "Description sla 1" }),
(sla2:SLA { name: "SLA 2", description: "Description sla 2" }),

(slt1:SLT { name: "Tiempo de Respuesta", priority: "HIGH", requestType: "INCIDENT", metric: "TTO", value: 4.5, unit: "HOURS" }),
(slt2:SLT { name: "Disponibilidad", priority: "MEDIUM", requestType: "SERVICE_REQUEST", metric: "TTR", value: 30.0, unit: "MINUTES" }),

(chain)-[:INITIAL]->(status1),
(chain)-[:TERMINAL]->(status2),
(chain)-[:INITIAL_STATE]->(sla1),

(org1)-[:TEAM]->(team1),
(org1)-[:TEAM]->(team2),

(team1)-[:MEMBER]->(person1),
(team1)-[:MEMBER]->(person2),
(team2)-[:MEMBER]->(person3),

(serviceOrg1)-[:SLA_SERVICE]->(serviceOrg2),

(serviceOrg1)-[:SLA_ORGANIZATION]->(org1),
(serviceOrg2)-[:SLA_ORGANIZATION]->(org2),
