MATCH (n) DETACH DELETE n; 

// ChainFaceted
MERGE (chainfaceted0:ChainFaceted {id: "0", name: "Waelchi and Sons", version: "4.4", description: "Pariatur exercitationem eveniet nemo rerum.", ownershipType: "STATE_TEAM"})
MERGE (chainfaceted1:ChainFaceted {id: "1", name: "Hermann LLC", version: "2.69", description: "Aut dolorem magnam repellat officia.", ownershipType: "STATE_TEAM"})
MERGE (chainfaceted2:ChainFaceted {id: "2", name: "Ebert, Jones and McGlynn", version: "0.6.3", description: "Accusamus sint quibusdam repudiandae temporibus sequi.", ownershipType: "STATE_TEAM"})
MERGE (chainfaceted3:ChainFaceted {id: "3", name: "Windler Group", version: "0.8.0", description: "Enim et labore non ab ea vitae eos.", ownershipType: "STATE"})
MERGE (chainfaceted4:ChainFaceted {id: "4", name: "Mitchell, Olson and Brekke", version: "8.6", description: "Voluptates hic ad voluptates esse.", ownershipType: "STATE_TEAM"})
MERGE (chainfaceted5:ChainFaceted {id: "5", name: "Mitchell-Glover", version: "1.17", description: "Similique enim provident est ut.", ownershipType: "STATE"})
MERGE (chainfaceted6:ChainFaceted {id: "6", name: "Lebsack, McGlynn and Herzog", version: "0.40", description: "Ut nemo harum quisquam vero aliquam sit saepe.", ownershipType: "STATE_TEAM"})
MERGE (chainfaceted7:ChainFaceted {id: "7", name: "Gleason and Sons", version: "3.7", description: "Exercitationem qui ut perferendis.", ownershipType: "STATE"})
MERGE (chainfaceted8:ChainFaceted {id: "8", name: "Huel, O'Hara and Thiel", version: "3.0", description: "Praesentium harum id cupiditate sapiente in odit.", ownershipType: "STATE"})
MERGE (chainfaceted9:ChainFaceted {id: "9", name: "Tromp, Gerlach and Conroy", version: "1.6.6", description: "Consectetur molestias rerum magnam voluptas et temporibus.", ownershipType: "STATE"})

// ChainState
MERGE (chainstate0:ChainState {id: "0", name: "Quigley-D'Amore", version: "7.1", description: "Sit ut dignissimos voluptas laborum quo.", ownershipType: "STATE_TEAM"})
MERGE (chainstate1:ChainState {id: "1", name: "Will-Cartwright", version: "0.68", description: "Temporibus et voluptatem porro similique voluptas qui provident.", ownershipType: "STATE_TEAM"})
MERGE (chainstate2:ChainState {id: "2", name: "Auer LLC", version: "0.6.8", description: "Enim saepe similique et eveniet impedit et aut.", ownershipType: "STATE_TEAM"})
MERGE (chainstate3:ChainState {id: "3", name: "Wilderman and Sons", version: "6.6.7", description: "Tenetur voluptatum ex est ducimus aut.", ownershipType: "STATE_TEAM"})
MERGE (chainstate4:ChainState {id: "4", name: "Rosenbaum-Johnson", version: "8.8.3", description: "Et aut ut quibusdam aut quia doloremque quia.", ownershipType: "STATE_TEAM"})
MERGE (chainstate5:ChainState {id: "5", name: "Collier-Balistreri", version: "0.50", description: "Fugit qui totam velit ipsum.", ownershipType: "STATE"})
MERGE (chainstate6:ChainState {id: "6", name: "MacGyver Group", version: "7.8.8", description: "Et ipsam voluptatem dolore dolor.", ownershipType: "STATE_TEAM"})
MERGE (chainstate7:ChainState {id: "7", name: "Stoltenberg, Kerluke and Bruen", version: "5.5.4", description: "Dolorum autem eveniet tempora nesciunt.", ownershipType: "STATE"})
MERGE (chainstate8:ChainState {id: "8", name: "Koch LLC", version: "0.1.3", description: "Suscipit vitae qui.", ownershipType: "STATE_TEAM"})
MERGE (chainstate9:ChainState {id: "9", name: "Kling Group", version: "0.83", description: "Aperiam adipisci exercitationem est reiciendis sit nisi animi.", ownershipType: "STATE"})

// Customer
MERGE (customer0:Customer {id: "0"})
MERGE (customer1:Customer {id: "1"})
MERGE (customer2:Customer {id: "2"})
MERGE (customer3:Customer {id: "3"})
MERGE (customer4:Customer {id: "4"})
MERGE (customer5:Customer {id: "5"})
MERGE (customer6:Customer {id: "6"})
MERGE (customer7:Customer {id: "7"})
MERGE (customer8:Customer {id: "8"})
MERGE (customer9:Customer {id: "9"})

// Issue
MERGE (issue0:Issue {id: "0", title: "Porro reiciendis explicabo sint sunt error ut.", description: "Sequi fuga voluptate ab numquam saepe pariatur impedit. Unde dicta consequatur animi ullam minus. Voluptates possimus ipsum."})
MERGE (issue1:Issue {id: "1", title: "Consectetur sequi quia qui et et laudantium sunt.", description: "Cumque illo quo nisi est aut animi aut. Et vero blanditiis omnis ipsum. Et architecto quod sapiente quis temporibus."})
MERGE (issue2:Issue {id: "2", title: "Aperiam officia nostrum minus sunt quo non repudiandae.", description: "In iure ullam nostrum. Asperiores sit nisi officiis ab. Magni aut ut consectetur est quidem est dolor. At odit beatae nobis vero."})
MERGE (issue3:Issue {id: "3", title: "Autem nesciunt sunt eos ut esse.", description: "Dolorem eveniet numquam. Placeat consequuntur ipsum doloribus sed magni iure. Aut quis atque. Porro rem nihil alias alias deleniti."})
MERGE (issue4:Issue {id: "4", title: "Alias rerum voluptatum est et ut voluptas omnis.", description: "Voluptatum praesentium libero quaerat magnam. Non vero repellat illo cum natus quidem corporis. Sit molestias sit nulla quibusdam consequatur porro deleniti."})
MERGE (issue5:Issue {id: "5", title: "Ea corporis vero veritatis dolor nesciunt aut omnis.", description: "Eveniet reprehenderit deserunt. Nihil nesciunt nihil voluptas omnis iure placeat voluptatem. Vel rerum quae aspernatur sed neque illo. Molestiae iusto quod corporis quia consequuntur."})
MERGE (issue6:Issue {id: "6", title: "Ipsum est omnis aperiam impedit consequuntur voluptas aperiam.", description: "Est nobis et debitis accusantium. Illum dolorum saepe ut qui deserunt. Autem veniam corporis est cupiditate. Asperiores qui optio facere ut quis perferendis quia."})
MERGE (issue7:Issue {id: "7", title: "Et reprehenderit consequatur iste voluptatum.", description: "Natus quidem rerum quasi consequatur vel quisquam. Vitae quidem facere praesentium quod tempora sit beatae. Provident ut rerum qui. Et nostrum debitis similique accusamus eligendi."})
MERGE (issue8:Issue {id: "8", title: "Est et laudantium porro perferendis.", description: "Sed quisquam non alias. Labore ducimus quam nisi expedita vel dolor dolore. Quam autem quo distinctio sunt dolore illum. Voluptatibus nemo voluptatem corrupti repellat iste esse dicta. Cumque laudantium sequi non nulla quo id voluptas."})
MERGE (issue9:Issue {id: "9", title: "Tempore delectus vero qui inventore corporis praesentium dolorem.", description: "Nesciunt aut perferendis. Unde praesentium ad in cumque id. Doloribus dolores voluptatem ut. Quia quam minus voluptatem qui."})

// Objective
MERGE (objective0:Objective {id: "0", metric: "TTO", value: "64.48", unit: "HOUR"})
MERGE (objective1:Objective {id: "1", metric: "TTO", value: "75.41", unit: "MINUTES"})
MERGE (objective2:Objective {id: "2", metric: "TTR", value: "26.17", unit: "MINUTES"})
MERGE (objective3:Objective {id: "3", metric: "TTO", value: "23.35", unit: "MINUTES"})
MERGE (objective4:Objective {id: "4", metric: "TTO", value: "89.45", unit: "HOUR"})
MERGE (objective5:Objective {id: "5", metric: "TTR", value: "53.64", unit: "HOUR"})
MERGE (objective6:Objective {id: "6", metric: "TTR", value: "84.17", unit: "MINUTES"})
MERGE (objective7:Objective {id: "7", metric: "TTR", value: "27.19", unit: "MINUTES"})
MERGE (objective8:Objective {id: "8", metric: "TTO", value: "27.3", unit: "HOUR"})
MERGE (objective9:Objective {id: "9", metric: "TTO", value: "36.34", unit: "MINUTES"})

// Organization
MERGE (organization0:Organization {id: "0", name: "Rutherford and Sons", code: "0879542144"})
MERGE (organization1:Organization {id: "1", name: "Wuckert-Gottlieb", code: "1953321925"})
MERGE (organization2:Organization {id: "2", name: "Considine, Gutmann and Bartoletti", code: "0896567516"})
MERGE (organization3:Organization {id: "3", name: "Sanford LLC", code: "1936588773"})
MERGE (organization4:Organization {id: "4", name: "Rowe, O'Keefe and Kub", code: "0034277706"})
MERGE (organization5:Organization {id: "5", name: "Schimmel-Hartmann", code: "1882189965"})
MERGE (organization6:Organization {id: "6", name: "Denesik, Wintheiser and Schowalter", code: "1000415333"})
MERGE (organization7:Organization {id: "7", name: "Mertz Inc", code: "0748897437"})
MERGE (organization8:Organization {id: "8", name: "Botsford-Cole", code: "1807493849"})
MERGE (organization9:Organization {id: "9", name: "Greenfelder-Baumbach", code: "1867213125"})

// Person
MERGE (person0:Person {id: "0", lastName: "Brakus", firstName: "Rose", email: "christene.ratke@yahoo.com", phone: "(725) 441-7996 x4054"})
MERGE (person1:Person {id: "1", lastName: "Crist", firstName: "Ramiro", email: "michel.bartoletti@hotmail.com", phone: "1-699-240-5321"})
MERGE (person2:Person {id: "2", lastName: "Schneider", firstName: "Berry", email: "florence.schulist@hotmail.com", phone: "1-452-126-4488 x927"})
MERGE (person3:Person {id: "3", lastName: "Nienow", firstName: "Jarvis", email: "selene.lebsack@hotmail.com", phone: "376.499.2562 x6718"})
MERGE (person4:Person {id: "4", lastName: "Fisher", firstName: "Brittny", email: "marshall.kemmer@yahoo.com", phone: "(708) 330-8477"})
MERGE (person5:Person {id: "5", lastName: "Tromp", firstName: "Londa", email: "lettie.kunze@hotmail.com", phone: "939.245.0647 x918"})
MERGE (person6:Person {id: "6", lastName: "Olson", firstName: "Robt", email: "cortney.watsica@gmail.com", phone: "158.328.3770 x294"})
MERGE (person7:Person {id: "7", lastName: "Harris", firstName: "Parker", email: "antone.wisoky@yahoo.com", phone: "492-549-4240 x528"})
MERGE (person8:Person {id: "8", lastName: "Schmitt", firstName: "Todd", email: "mae.berge@yahoo.com", phone: "(020) 154-0326 x78970"})
MERGE (person9:Person {id: "9", lastName: "Wiza", firstName: "Isobel", email: "carrol.weimann@gmail.com", phone: "416-045-4968 x466"})

// Privilege
MERGE (privilege0:Privilege {id: "0", name: "et"})
MERGE (privilege1:Privilege {id: "1", name: "veritatis"})
MERGE (privilege2:Privilege {id: "2", name: "distinctio"})
MERGE (privilege3:Privilege {id: "3", name: "qui"})
MERGE (privilege4:Privilege {id: "4", name: "ea"})
MERGE (privilege5:Privilege {id: "5", name: "iusto"})
MERGE (privilege6:Privilege {id: "6", name: "harum"})
MERGE (privilege7:Privilege {id: "7", name: "et"})
MERGE (privilege8:Privilege {id: "8", name: "tempore"})
MERGE (privilege9:Privilege {id: "9", name: "dolorum"})

// Provider
MERGE (provider0:Provider {id: "0"})
MERGE (provider1:Provider {id: "1"})
MERGE (provider2:Provider {id: "2"})
MERGE (provider3:Provider {id: "3"})
MERGE (provider4:Provider {id: "4"})
MERGE (provider5:Provider {id: "5"})
MERGE (provider6:Provider {id: "6"})
MERGE (provider7:Provider {id: "7"})
MERGE (provider8:Provider {id: "8"})
MERGE (provider9:Provider {id: "9"})

// RequestType
MERGE (requesttype0:RequestType {id: "0", name: "voluptatem"})
MERGE (requesttype1:RequestType {id: "1", name: "dolor"})
MERGE (requesttype2:RequestType {id: "2", name: "esse"})
MERGE (requesttype3:RequestType {id: "3", name: "et"})
MERGE (requesttype4:RequestType {id: "4", name: "quaerat"})
MERGE (requesttype5:RequestType {id: "5", name: "est"})
MERGE (requesttype6:RequestType {id: "6", name: "fugiat"})
MERGE (requesttype7:RequestType {id: "7", name: "explicabo"})
MERGE (requesttype8:RequestType {id: "8", name: "aut"})
MERGE (requesttype9:RequestType {id: "9", name: "voluptas"})

// Role
MERGE (role0:Role {id: "0", name: "web developer"})
MERGE (role1:Role {id: "1", name: "factory worker"})
MERGE (role2:Role {id: "2", name: "electrician"})
MERGE (role3:Role {id: "3", name: "optician"})
MERGE (role4:Role {id: "4", name: "economist"})
MERGE (role5:Role {id: "5", name: "web developer"})
MERGE (role6:Role {id: "6", name: "air traffic controller"})
MERGE (role7:Role {id: "7", name: "agriculturist"})
MERGE (role8:Role {id: "8", name: "writer"})
MERGE (role9:Role {id: "9", name: "shop assistant"})

// Scope
MERGE (scope0:Scope {id: "0", name: "facilis", priority: "CRITICAL"})
MERGE (scope1:Scope {id: "1", name: "est", priority: "LOW"})
MERGE (scope2:Scope {id: "2", name: "et", priority: "CRITICAL"})
MERGE (scope3:Scope {id: "3", name: "rem", priority: "LOW"})
MERGE (scope4:Scope {id: "4", name: "et", priority: "CRITICAL"})
MERGE (scope5:Scope {id: "5", name: "et", priority: "MEDIUM"})
MERGE (scope6:Scope {id: "6", name: "dicta", priority: "ALL"})
MERGE (scope7:Scope {id: "7", name: "nam", priority: "MEDIUM"})
MERGE (scope8:Scope {id: "8", name: "mollitia", priority: "ALL"})
MERGE (scope9:Scope {id: "9", name: "repellendus", priority: "MEDIUM"})

// ServiceOrg
MERGE (serviceorg0:ServiceOrg {id: "0", name: "Hoppe Group", description: "Voluptatibus incidunt reiciendis."})
MERGE (serviceorg1:ServiceOrg {id: "1", name: "Padberg LLC", description: "Provident vel debitis."})
MERGE (serviceorg2:ServiceOrg {id: "2", name: "Ernser-Stiedemann", description: "Adipisci non voluptatibus eligendi est quibusdam rem."})
MERGE (serviceorg3:ServiceOrg {id: "3", name: "McLaughlin Inc", description: "Totam dolores laboriosam consectetur tempora."})
MERGE (serviceorg4:ServiceOrg {id: "4", name: "Bradtke, Maggio and Keeling", description: "Id placeat sed a."})
MERGE (serviceorg5:ServiceOrg {id: "5", name: "Halvorson Inc", description: "Ipsa ipsum adipisci qui."})
MERGE (serviceorg6:ServiceOrg {id: "6", name: "Smith-Wehner", description: "Praesentium et qui voluptate."})
MERGE (serviceorg7:ServiceOrg {id: "7", name: "Treutel-Sauer", description: "Quaerat omnis similique asperiores veritatis consectetur natus."})
MERGE (serviceorg8:ServiceOrg {id: "8", name: "Ward Group", description: "Eum temporibus libero distinctio dolores iure error."})
MERGE (serviceorg9:ServiceOrg {id: "9", name: "Rutherford, Hermann and Stamm", description: "Vel consectetur dolorum possimus et."})

// Sla
MERGE (sla0:Sla {id: "0", name: "quia"})
MERGE (sla1:Sla {id: "1", name: "culpa"})
MERGE (sla2:Sla {id: "2", name: "accusamus"})
MERGE (sla3:Sla {id: "3", name: "autem"})
MERGE (sla4:Sla {id: "4", name: "commodi"})
MERGE (sla5:Sla {id: "5", name: "ullam"})
MERGE (sla6:Sla {id: "6", name: "eum"})
MERGE (sla7:Sla {id: "7", name: "quia"})
MERGE (sla8:Sla {id: "8", name: "a"})
MERGE (sla9:Sla {id: "9", name: "laudantium"})

// Status
MERGE (status0:Status {id: "0", name: "voluptate"})
MERGE (status1:Status {id: "1", name: "rerum"})
MERGE (status2:Status {id: "2", name: "dolores"})
MERGE (status3:Status {id: "3", name: "at"})
MERGE (status4:Status {id: "4", name: "dolor"})
MERGE (status5:Status {id: "5", name: "quibusdam"})
MERGE (status6:Status {id: "6", name: "autem"})
MERGE (status7:Status {id: "7", name: "atque"})
MERGE (status8:Status {id: "8", name: "voluptates"})
MERGE (status9:Status {id: "9", name: "ipsa"})

// Team
MERGE (team0:Team {id: "0", name: "Roberts LLC", specialization: "molestiae"})
MERGE (team1:Team {id: "1", name: "Haag-Grimes", specialization: "officiis"})
MERGE (team2:Team {id: "2", name: "Hilpert Inc", specialization: "est"})
MERGE (team3:Team {id: "3", name: "Trantow-Osinski", specialization: "expedita"})
MERGE (team4:Team {id: "4", name: "Gibson LLC", specialization: "natus"})
MERGE (team5:Team {id: "5", name: "Spencer-Kuhn", specialization: "nisi"})
MERGE (team6:Team {id: "6", name: "Heaney Group", specialization: "reprehenderit"})
MERGE (team7:Team {id: "7", name: "Kovacek Inc", specialization: "sit"})
MERGE (team8:Team {id: "8", name: "Rowe Inc", specialization: "nobis"})
MERGE (team9:Team {id: "9", name: "Witting, Rutherford and Hilpert", specialization: "commodi"})

MERGE (chainstate0)-[:INITIAL]->(state1) 
MERGE (chainstate2)-[:TERMINAL]->(state3) 
MERGE (chainstate4)-[:INITIAL_SLA]->(sla5) 


// Customer Relations:
MERGE (customer0)-[:ORGANIZATION]->(organization1) 
MERGE (customer2)-[:SLA]->(sla3) 


// Issue Relations:


// Organization Relations:


// Person Relations:


// Provider Relations:


// Role Relations:


// Scope Relations:


// ServiceOrg Relations:


// Sla Relations:


// Status Relations:


// Team Relations:


