MATCH (n) DETACH DELETE n;

CREATE (org:Organization {name: "TechCorp"})
CREATE (team1:Team {name: "DevOps"})
CREATE (team2:Team {name: "QA"})
CREATE (service1:ServiceOrg {name: "Authentication"})
CREATE (service2:ServiceOrg {name: "Payment Gateway"})
CREATE (user1:User {name: "Alice"})
CREATE (user2:User {name: "Bob"})
CREATE (user3:User {name: "Charlie"})

// Relacionando Organización con Equipos
MERGE (org)-[:TEAMS]->(team1)
MERGE (org)-[:TEAMS]->(team2)

// Relacionando Equipos con Usuarios
MERGE (team1)-[:MEMBERS]->(user1)
MERGE (team1)-[:MEMBERS]->(user2)
MERGE (team2)-[:MEMBERS]->(user3)

// Relacionando Servicios con SLAs y Equipos
MERGE (service1)-[:SLAS {id: 1}]->(service2)
MERGE (service1)-[:SLAS {id: 2}]->(team2)
