MATCH (n)
DETACH DELETE n;

// ChainFaceted
MERGE (chainfaceted0:ChainFaceted { id: "0", name: "Waelchi and Sons", version: "4.4", description: "Descripcion chainfaceted 0", ownershipType: "STATE" })

// ChainState
MERGE (chainstate0:ChainState { id: "0", name: "Balistreri-McLaughlin", version: "3.7.3", description: "Descripcion chainstate 0", ownershipType: "STATE_TEAM" })

// Customer
MERGE (customer0:Customer { id: "0" })
MERGE (customer1:Customer { id: "1" })
MERGE (customer2:Customer { id: "2" })

// Issue
MERGE (issue0:Issue { id: "0", title: "bifurcated array", description: "synthesize firewall" })
MERGE (issue1:Issue { id: "1", title: "Networked array", description: "connect capacitor" })
MERGE (issue2:Issue { id: "2", title: "architecture bandwidth", description: "parse system" })
MERGE (issue3:Issue { id: "3", title: "exuding circuit", description: "connect hard drive" })
MERGE (issue4:Issue { id: "4", title: "tangible driver", description: "compress sensor" })
MERGE (issue5:Issue { id: "5", title: "Profound interface", description: "navigate panel" })
MERGE (issue6:Issue { id: "6", title: "superstructure card", description: "transmit hard drive" })
MERGE (issue7:Issue { id: "7", title: "analyzing circuit", description: "synthesize firewall" })
MERGE (issue8:Issue { id: "8", title: "moderator microchip", description: "copy microchip" })
MERGE (issue9:Issue { id: "9", title: "adapter bus", description: "override driver" })

// Objective
MERGE (objective0:Objective { id: "0", metric: "TTR", value: 12.99, unit: "MINUTES" })
MERGE (objective1:Objective { id: "1", metric: "TTO", value: 60.81, unit: "HOUR" })
MERGE (objective2:Objective { id: "2", metric: "TTO", value: 36.23, unit: "MINUTES" })
MERGE (objective3:Objective { id: "3", metric: "TTO", value: 44.72, unit: "HOUR" })
MERGE (objective4:Objective { id: "4", metric: "TTO", value: 43.12, unit: "MINUTES" })

// Organization
MERGE (organization0:Organization { id: "0", name: "Gerlach, Paucek and Lebsack", code: "098540146X" })
MERGE (organization1:Organization { id: "1", name: "Pfannerstill and Sons", code: "1984330357" })
MERGE (organization2:Organization { id: "2", name: "Ward LLC", code: "1942777965" })
MERGE (organization3:Organization { id: "3", name: "Tromp, Gerlach and Conroy", code: "1961692724" })

// Person
MERGE (person0:Person { id: "0", lastName: "Gottlieb", firstName: "Hyacinth", email: "heriberto.muller@hotmail.com", phone: "(574) 779-6793" })
MERGE (person1:Person { id: "1", lastName: "Cartwright", firstName: "Alfonso", email: "pasquale.mitchell@yahoo.com", phone: "1-560-095-8005" })
MERGE (person2:Person { id: "2", lastName: "Donnelly", firstName: "Karl", email: "hertha.quitzon@gmail.com", phone: "083.521.5966 x738" })
MERGE (person3:Person { id: "3", lastName: "Feil", firstName: "Gertrude", email: "queenie.torphy@yahoo.com", phone: "698.833.4049 x920" })
MERGE (person4:Person { id: "4", lastName: "Cronin", firstName: "Jc", email: "kyung.kertzmann@hotmail.com", phone: "1-069-984-6198 x978" })
MERGE (person5:Person { id: "5", lastName: "Littel", firstName: "Millard", email: "luciano.wisoky@hotmail.com", phone: "1-841-295-5460 x15876" })
MERGE (person6:Person { id: "6", lastName: "Lockman", firstName: "Billye", email: "ivy.schuster@gmail.com", phone: "(329) 638-1835" })
MERGE (person7:Person { id: "7", lastName: "Bartoletti", firstName: "Myung", email: "joaquin.blanda@yahoo.com", phone: "169-314-0547 x51043" })
MERGE (person8:Person { id: "8", lastName: "Simonis", firstName: "Jose", email: "denny.marks@gmail.com", phone: "1-366-881-3399" })
MERGE (person9:Person { id: "9", lastName: "Labadie", firstName: "Ambrose", email: "lajuana.hyatt@gmail.com", phone: "(620) 457-3809 x648" })

// Privilege
MERGE (privilege0:Privilege { id: "0", name: "Privilegio 0" })
MERGE (privilege1:Privilege { id: "1", name: "Privilegio 1" })
MERGE (privilege2:Privilege { id: "2", name: "Privilegio 2" })
MERGE (privilege3:Privilege { id: "3", name: "Privilegio 3" })
MERGE (privilege4:Privilege { id: "4", name: "Privilegio 4" })

// Provider
MERGE (provider0:Provider { id: "0" })
MERGE (provider1:Provider { id: "1" })
MERGE (provider2:Provider { id: "2" })
MERGE (provider3:Provider { id: "3" })

// RequestType
MERGE (requesttype0:RequestType { id: "0", name: "Request Type 0" })
MERGE (requesttype1:RequestType { id: "1", name: "Request Type 1" })
MERGE (requesttype2:RequestType { id: "2", name: "Request Type 2" })
MERGE (requesttype3:RequestType { id: "3", name: "Request Type 3" })
MERGE (requesttype4:RequestType { id: "4", name: "Request Type 4" })
MERGE (requesttype5:RequestType { id: "5", name: "Request Type 5" })
MERGE (requesttype6:RequestType { id: "6", name: "Request Type 6" })

// Role
MERGE (role0:Role { id: "0", name: "engineer" })
MERGE (role1:Role { id: "1", name: "mechanic" })
MERGE (role2:Role { id: "2", name: "interpreter" })
MERGE (role3:Role { id: "3", name: "doctor" })
MERGE (role4:Role { id: "4", name: "teacher" })

// Scope
MERGE (scope0:Scope { id: "0", name: "Scope name 0", priority: "ALL" })
MERGE (scope1:Scope { id: "1", name: "Scope name 1", priority: "ALL" })
MERGE (scope2:Scope { id: "2", name: "Scope name 2", priority: "CRITICAL" })
MERGE (scope3:Scope { id: "3", name: "Scope name 3", priority: "MEDIUM" })
MERGE (scope4:Scope { id: "4", name: "Scope name 4", priority: "ALL" })
MERGE (scope5:Scope { id: "5", name: "Scope name 5", priority: "ALL" })
MERGE (scope6:Scope { id: "6", name: "Scope name 6", priority: "CRITICAL" })
MERGE (scope7:Scope { id: "7", name: "Scope name 7", priority: "LOW" })
MERGE (scope8:Scope { id: "8", name: "Scope name 8", priority: "MEDIUM" })
MERGE (scope9:Scope { id: "9", name: "Scope name 9", priority: "HARD" })

// ServiceOrg
MERGE (serviceorg0:ServiceOrg { id: "0", name: "Hilll-Upton", description: "support" })
MERGE (serviceorg1:ServiceOrg { id: "1", name: "Ankunding, Gutkowski and Jacobson", description: "Multi-lateral" })
MERGE (serviceorg2:ServiceOrg { id: "2", name: "Rau-Crona", description: "foreground" })
MERGE (serviceorg3:ServiceOrg { id: "3", name: "Thompson and Sons", description: "Expanded" })
MERGE (serviceorg4:ServiceOrg { id: "4", name: "Grant-Jast", description: "Optimized" })
MERGE (serviceorg5:ServiceOrg { id: "5", name: "Murphy, Klein and Shanahan", description: "object-oriented" })
MERGE (serviceorg6:ServiceOrg { id: "6", name: "Schultz-Runolfsson", description: "Graphic Interface" })
MERGE (serviceorg7:ServiceOrg { id: "7", name: "Olson Inc", description: "benchmark" })
MERGE (serviceorg8:ServiceOrg { id: "8", name: "Moore, Ondricka and Hamill", description: "exuding" })
MERGE (serviceorg9:ServiceOrg { id: "9", name: "Waters-Carroll", description: "Expanded" })

// Sla
MERGE (sla0:Sla { id: "0", name: "Sla name 0" })
MERGE (sla1:Sla { id: "1", name: "Sla name 1" })
MERGE (sla2:Sla { id: "2", name: "Sla name 2" })
MERGE (sla3:Sla { id: "3", name: "Sla name 3" })
MERGE (sla4:Sla { id: "4", name: "Sla name 4" })

// Status
MERGE (status0:Status { id: "0", name: "Status name 0" })
MERGE (status1:Status { id: "1", name: "Status name 1" })
MERGE (status2:Status { id: "2", name: "Status name 2" })
MERGE (status3:Status { id: "3", name: "Status name 3" })
MERGE (status4:Status { id: "4", name: "Status name 4" })
MERGE (status5:Status { id: "5", name: "Status name 5" })
MERGE (status6:Status { id: "6", name: "Status name 6" })
MERGE (status7:Status { id: "7", name: "Status name 7" })
MERGE (status8:Status { id: "8", name: "Status name 8" })
MERGE (status9:Status { id: "9", name: "Status name 9" })

// Team
MERGE (team0:Team { id: "0", name: "Brown-Beatty", specialization: "UX/UI Designer" })
MERGE (team1:Team { id: "1", name: "Fritsch, Bartell and Miller", specialization: "Desarrollador Backend" })
MERGE (team2:Team { id: "2", name: "Dietrich LLC", specialization: "Analista de Datos" })
