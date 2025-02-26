MATCH (n) DETACH DELETE n;

CREATE (org:Organization {name: "TechCorp"})
CREATE (team1:Team {name: "DevOps"})
CREATE (team2:Team {name: "QA"})
CREATE (service1:ServiceOrg {name: "Authentication"})
CREATE (service2:ServiceOrg {name: "Payment Gateway"})
CREATE (user1:User {name: "Alice"})
CREATE (user2:User {name: "Bob"})
CREATE (user3:User {name: "Charlie"})
CREATE (sla1:Sla {id: 1})
CREATE (sla2:Sla {id: 2})

// Relacionando Organización con Equipos
MERGE (org)-[:TEAMS]->(team1)
MERGE (org)-[:TEAMS]->(team2)

// Relacionando Equipos con Usuarios
MERGE (team1)-[:MEMBERS]->(user1)
MERGE (team1)-[:MEMBERS]->(user2)
MERGE (team2)-[:MEMBERS]->(user3)

// Relacionando Servicios con SLAs y Equipos
MERGE (sla1)-[:SLAS]->(service1)
MERGE (sla2)-[:SLAS]->(service2)
MERGE (sla1)-[:TEAMS]->(team1)
MERGE (sla2)-[:TEAMS]->(team2)

RETURN org, team1, team2, service1, service2, user1, user2, user3, sla1, sla2
