MATCH (n) DETACH DELETE n;

CREATE (org1:Organization {name: "Org A", code: "A001", status: "ACTIVE"}),
       (org2:Organization {name: "Org B", code: "B002", status: "INACTIVE"}),
       (org3:Organization {name: "Org C", code: "C003", status: "ACTIVE"})

CREATE (team1:Team {name: "Team Alpha", specialization: "Software Development"}),
       (team2:Team {name: "Team Beta", specialization: "Marketing"}),
       (team3:Team {name: "Team Gamma", specialization: "Finance"}),
       (team4:Team {name: "Team Delta", specialization: "HR"})

CREATE (serviceOrg1:ServiceOrg {type: 'IT', contact_info: 'contact@madridit.com', name: 'ServiceOrg1'}),
       (serviceOrg2:ServiceOrg {type: 'HR', contact_info: 'contact@barcelonahr.com', name: 'ServiceOrg2'})

CREATE (person1:Person {firstName: "Alice", lastName: "Smith", status: "ACTIVE", function: "Developer", email: "alice.smith@org.com", phone: "123-456-7890"}), 
       (person2:Person {firstName: "Bob", lastName: "Johnson", status: "ACTIVE", function: "Designer", email: "bob.johnson@org.com", phone: "234-567-8901"}), 
       (person3:Person {firstName: "Charlie", lastName: "Brown", status: "INACTIVE", function: "Marketer", email: "charlie.brown@org.com", phone: "345-678-9012"}), 
       (person4:Person {firstName: "David", lastName: "Williams", status: "ACTIVE", function: "Accountant", email: "david.williams@org.com", phone: "456-789-0123"})

CREATE (org2)-[:PARENT]->(org1),
       (org3)-[:PARENT]->(org1)

CREATE (org1)-[:TEAM]->(team1),
       (org1)-[:TEAM]->(team2)

CREATE (team1)-[:MEMBER]->(person1),
       (team1)-[:MEMBER]->(person2),
       (team2)-[:MEMBER]->(person3)

CREATE (serviceOrg1)-[:SERVICE]->(serviceOrg2)

CREATE (serviceOrg1)-[:TEAM]->(team1),
       (serviceOrg2)-[:TEAM]->(team2)