MATCH(n) DETACH DELETE n;

DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:127, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:81, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", id:1, value:48.0}}, {_id:82, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", id:2, value:48.0}}, {_id:103, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:104, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:108, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:109, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:122, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:123, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:76, properties:{name:"Profesor", id:1}}, {_id:77, properties:{name:"Alumno", id:2}}, {_id:115, properties:{name:"Revisor"}}, {_id:129, properties:{name:"Fabricante"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:80, properties:{name:"Alcance General", id:1}}, {_id:107, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:110, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:124, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:125, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:70, properties:{name:"Grupo Profesores", specialization:"FunctionalUser", id:1}}, {_id:71, properties:{name:"Grupo 1", specialization:"ITUser", id:2}}, {_id:120, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:121, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:131, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:85, properties:{name:"Incident", id:1}}, {_id:86, properties:{name:"User Request", id:2}}, {_id:105, properties:{name:"Pieza de defensa"}}, {_id:106, properties:{name:"Pieza de Uso comercial"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:69, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", id:1, version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:72, properties:{lastName:"", firstName:"Julio", password:"1234", phone:"", name:"julio", id:1, email:"julio@us.es"}}, {_id:73, properties:{lastName:"", firstName:"Pedro", password:"1234", phone:"", name:"pedro", id:2, email:"pedro@alum.us.es"}}, {_id:74, properties:{lastName:"", firstName:"Juan", password:"1234", phone:"", name:"juan", id:3, email:"juan@alum.us.es"}}, {_id:75, properties:{lastName:"", firstName:"Paula", password:"1234", phone:"", name:"paula", id:4, email:"paula@alum.us.es"}}, {_id:117, properties:{lastName:"López", firstName:"Rocío", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:118, properties:{lastName:"Romero", firstName:"Raquel", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:119, properties:{lastName:"Gómez", firstName:"Rubén", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:130, properties:{lastName:"Suárez", firstName:"Fran", phone:"654654654", name:"franito", email:"franito@gmail.com"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:112, properties:{name:"Revisar pieza"}}, {_id:113, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:67, properties:{code:"PROF", name:"Profesores", id:1}}, {_id:68, properties:{code:"ALUM", name:"Alumnos", id:2}}, {_id:132, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:135, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:136, properties:{code:"RDP", name:"Revisora de piezas S.A"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:87, properties:{createdAt:localdatetime('2025-04-16T10:20:00'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:1, title:"Plataforma caída", TTO:90094.0}}, {_id:88, properties:{createdAt:localdatetime('2025-04-15T15:45:00'), TTR:0.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:2, title:"Error en notas", TTO:145034.0}}, {_id:89, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:3, title:"Error subida tarea", TTO:620534.0}}, {_id:90, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:4, title:"Acceso bloqueado", TTO:1376334.0}}, {_id:91, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:5, title:"Fallo matrícula", TTO:2407134.0}}, {_id:92, properties:{createdAt:localdatetime('2025-04-12T14:10:00'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:6, title:"Acceso aula virtual", TTO:415734.0}}, {_id:93, properties:{createdAt:localdatetime('2025-04-08T19:30:00'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:7, title:"Correo caído", TTO:710034.0}}, {_id:94, properties:{createdAt:localdatetime('2025-04-05T08:50:00'), TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:8, title:"Fallo en notificaciones", TTO:1009734.0}}, {_id:95, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:9, title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:96, properties:{createdAt:localdatetime('2025-03-15T10:00:00'), TTR:0.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:10, title:"Sincronización fallida", TTO:2594334.0}}, {_id:97, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:11, title:"Error de login", TTO:3455934.0}}, {_id:98, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:12, title:"Error documentos", TTO:4311534.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:84, properties:{name:"New", id:1}}, {_id:99, properties:{name:"Pendiente de revisión"}}, {_id:100, properties:{name:"Revisión en curso"}}, {_id:101, properties:{name:"Revisión exitosa"}}, {_id:102, properties:{name:"Revisión fallida"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:83, properties:{name:"AlumnosServiceCustomer_1", id:1}}, {_id:133, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:138, properties:{name:"ServicioDeRevisiónCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:79, properties:{name:"ServicioAlumnosSla", id:1}}, {_id:111, properties:{name:"SLA control de calidad"}}, {_id:126, properties:{name:"SLA análisis"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:78, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2", id:1}}, {_id:134, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:137, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:79}, end: {_id:80}, properties:{}}, {start: {_id:111}, end: {_id:107}, properties:{}}, {start: {_id:111}, end: {_id:110}, properties:{}}, {start: {_id:126}, end: {_id:124}, properties:{}}, {start: {_id:126}, end: {_id:125}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:134}, end: {_id:105}, properties:{}}, {start: {_id:134}, end: {_id:106}, properties:{}}, {start: {_id:137}, end: {_id:105}, properties:{}}, {start: {_id:137}, end: {_id:106}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:78}, end: {_id:83}, properties:{}}, {start: {_id:134}, end: {_id:133}, properties:{}}, {start: {_id:137}, end: {_id:138}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:87}, end: {_id:85}, properties:{}}, {start: {_id:88}, end: {_id:86}, properties:{}}, {start: {_id:89}, end: {_id:85}, properties:{}}, {start: {_id:90}, end: {_id:86}, properties:{}}, {start: {_id:91}, end: {_id:85}, properties:{}}, {start: {_id:92}, end: {_id:86}, properties:{}}, {start: {_id:93}, end: {_id:85}, properties:{}}, {start: {_id:94}, end: {_id:85}, properties:{}}, {start: {_id:95}, end: {_id:86}, properties:{}}, {start: {_id:96}, end: {_id:85}, properties:{}}, {start: {_id:97}, end: {_id:86}, properties:{}}, {start: {_id:98}, end: {_id:85}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:120}, end: {_id:115}, properties:{}}, {start: {_id:121}, end: {_id:115}, properties:{}}, {start: {_id:131}, end: {_id:129}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:87}, end: {_id:84}, properties:{}}, {start: {_id:88}, end: {_id:84}, properties:{}}, {start: {_id:89}, end: {_id:84}, properties:{}}, {start: {_id:90}, end: {_id:84}, properties:{}}, {start: {_id:91}, end: {_id:84}, properties:{}}, {start: {_id:92}, end: {_id:84}, properties:{}}, {start: {_id:93}, end: {_id:84}, properties:{}}, {start: {_id:94}, end: {_id:84}, properties:{}}, {start: {_id:95}, end: {_id:84}, properties:{}}, {start: {_id:96}, end: {_id:84}, properties:{}}, {start: {_id:97}, end: {_id:84}, properties:{}}, {start: {_id:98}, end: {_id:84}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:84}, end: {_id:99}, properties:{}}, {start: {_id:99}, end: {_id:100}, properties:{}}, {start: {_id:100}, end: {_id:101}, properties:{}}, {start: {_id:100}, end: {_id:102}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:83}, end: {_id:79}, properties:{}}, {start: {_id:133}, end: {_id:126}, properties:{}}, {start: {_id:138}, end: {_id:111}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:78}, end: {_id:71}, properties:{}}, {start: {_id:134}, end: {_id:121}, properties:{}}, {start: {_id:137}, end: {_id:120}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:132}, end: {_id:127}, properties:{}}, {start: {_id:135}, end: {_id:127}, properties:{}}, {start: {_id:136}, end: {_id:127}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:120}, end: {_id:117}, properties:{}}, {start: {_id:120}, end: {_id:118}, properties:{}}, {start: {_id:121}, end: {_id:119}, properties:{}}, {start: {_id:131}, end: {_id:130}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:134}, end: {_id:99}, properties:{}}, {start: {_id:137}, end: {_id:100}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:127}, end: {_id:99}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:87}, end: {_id:72}, properties:{}}, {start: {_id:88}, end: {_id:72}, properties:{}}, {start: {_id:89}, end: {_id:72}, properties:{}}, {start: {_id:90}, end: {_id:72}, properties:{}}, {start: {_id:91}, end: {_id:72}, properties:{}}, {start: {_id:92}, end: {_id:72}, properties:{}}, {start: {_id:93}, end: {_id:72}, properties:{}}, {start: {_id:94}, end: {_id:72}, properties:{}}, {start: {_id:95}, end: {_id:72}, properties:{}}, {start: {_id:96}, end: {_id:72}, properties:{}}, {start: {_id:97}, end: {_id:72}, properties:{}}, {start: {_id:98}, end: {_id:72}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:68}, end: {_id:78}, properties:{}}, {start: {_id:135}, end: {_id:134}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:117}, end: {_id:115}, properties:{}}, {start: {_id:118}, end: {_id:115}, properties:{}}, {start: {_id:119}, end: {_id:115}, properties:{}}, {start: {_id:130}, end: {_id:129}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:87}, end: {_id:78}, properties:{}}, {start: {_id:88}, end: {_id:78}, properties:{}}, {start: {_id:89}, end: {_id:78}, properties:{}}, {start: {_id:90}, end: {_id:78}, properties:{}}, {start: {_id:91}, end: {_id:78}, properties:{}}, {start: {_id:92}, end: {_id:78}, properties:{}}, {start: {_id:93}, end: {_id:78}, properties:{}}, {start: {_id:94}, end: {_id:78}, properties:{}}, {start: {_id:95}, end: {_id:78}, properties:{}}, {start: {_id:96}, end: {_id:78}, properties:{}}, {start: {_id:97}, end: {_id:78}, properties:{}}, {start: {_id:98}, end: {_id:78}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:67}, end: {_id:70}, properties:{}}, {start: {_id:68}, end: {_id:71}, properties:{}}, {start: {_id:132}, end: {_id:131}, properties:{}}, {start: {_id:135}, end: {_id:121}, properties:{}}, {start: {_id:136}, end: {_id:120}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:80}, end: {_id:81}, properties:{}}, {start: {_id:80}, end: {_id:82}, properties:{}}, {start: {_id:107}, end: {_id:103}, properties:{}}, {start: {_id:107}, end: {_id:104}, properties:{}}, {start: {_id:110}, end: {_id:108}, properties:{}}, {start: {_id:110}, end: {_id:109}, properties:{}}, {start: {_id:124}, end: {_id:122}, properties:{}}, {start: {_id:124}, end: {_id:123}, properties:{}}, {start: {_id:125}, end: {_id:122}, properties:{}}, {start: {_id:125}, end: {_id:123}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:67}, end: {_id:69}, properties:{}}, {start: {_id:68}, end: {_id:69}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:127}, end: {_id:126}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:83}, end: {_id:67}, properties:{}}, {start: {_id:133}, end: {_id:132}, properties:{}}, {start: {_id:138}, end: {_id:135}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:127}, end: {_id:101}, properties:{}}, {start: {_id:127}, end: {_id:102}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:72}, end: {_id:70}, properties:{}}, {start: {_id:73}, end: {_id:71}, properties:{}}, {start: {_id:74}, end: {_id:71}, properties:{}}, {start: {_id:75}, end: {_id:71}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:72}, end: {_id:76}, properties:{}}, {start: {_id:73}, end: {_id:77}, properties:{}}, {start: {_id:74}, end: {_id:77}, properties:{}}, {start: {_id:75}, end: {_id:77}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:115}, end: {_id:112}, properties:{}}, {start: {_id:115}, end: {_id:113}, properties:{}}, {start: {_id:129}, end: {_id:113}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:107}, end: {_id:105}, properties:{}}, {start: {_id:110}, end: {_id:106}, properties:{}}, {start: {_id:124}, end: {_id:105}, properties:{}}, {start: {_id:125}, end: {_id:106}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;

