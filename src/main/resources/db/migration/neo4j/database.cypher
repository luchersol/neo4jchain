MATCH(n) DETACH DELETE n;

DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:120, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:121, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", id:1, value:48.0}}, {_id:122, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", id:2, value:48.0}}, {_id:123, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:124, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:125, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:126, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:127, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:129, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:130, properties:{name:"Profesor", id:1}}, {_id:131, properties:{name:"Alumno", id:2}}, {_id:132, properties:{name:"Revisor"}}, {_id:133, properties:{name:"Fabricante"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:134, properties:{name:"Alcance General", id:1}}, {_id:135, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:136, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:137, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:138, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:207, properties:{name:"Grupo Profesores", specialization:"FunctionalUser", id:1}}, {_id:208, properties:{name:"Grupo 1", specialization:"ITUser", id:2}}, {_id:209, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:210, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:211, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:212, properties:{name:"Incident", id:1}}, {_id:213, properties:{name:"User Request", id:2}}, {_id:214, properties:{name:"Pieza de defensa"}}, {_id:215, properties:{name:"Pieza de Uso comercial"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:216, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", id:1, version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:217, properties:{lastName:"", firstName:"Julio", password:"1234", phone:"", name:"julio", id:1, email:"julio@us.es"}}, {_id:218, properties:{lastName:"", firstName:"Pedro", password:"1234", phone:"", name:"pedro", id:2, email:"pedro@alum.us.es"}}, {_id:219, properties:{lastName:"", firstName:"Juan", password:"1234", phone:"", name:"juan", id:3, email:"juan@alum.us.es"}}, {_id:220, properties:{lastName:"", firstName:"Paula", password:"1234", phone:"", name:"paula", id:4, email:"paula@alum.us.es"}}, {_id:221, properties:{lastName:"López", firstName:"Rocío", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:222, properties:{lastName:"Romero", firstName:"Raquel", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:223, properties:{lastName:"Gómez", firstName:"Rubén", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:224, properties:{lastName:"Suárez", firstName:"Fran", phone:"654654654", name:"franito", email:"franito@gmail.com"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:225, properties:{name:"Revisar pieza"}}, {_id:226, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:227, properties:{code:"PROF", name:"Profesores", id:1}}, {_id:228, properties:{code:"ALUM", name:"Alumnos", id:2}}, {_id:229, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:230, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:231, properties:{code:"RDP", name:"Revisora de piezas S.A"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:232, properties:{createdAt:localdatetime('2025-04-16T10:20:00'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:1, title:"Plataforma caída", TTO:90094.0}}, {_id:233, properties:{createdAt:localdatetime('2025-04-15T15:45:00'), TTR:0.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:2, title:"Error en notas", TTO:145034.0}}, {_id:234, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:3, title:"Error subida tarea", TTO:620534.0}}, {_id:235, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:4, title:"Acceso bloqueado", TTO:1376334.0}}, {_id:236, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:5, title:"Fallo matrícula", TTO:2407134.0}}, {_id:237, properties:{createdAt:localdatetime('2025-04-12T14:10:00'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:6, title:"Acceso aula virtual", TTO:415734.0}}, {_id:238, properties:{createdAt:localdatetime('2025-04-08T19:30:00'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:7, title:"Correo caído", TTO:710034.0}}, {_id:239, properties:{createdAt:localdatetime('2025-04-05T08:50:00'), TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:8, title:"Fallo en notificaciones", TTO:1009734.0}}, {_id:240, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:9, title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:241, properties:{createdAt:localdatetime('2025-03-15T10:00:00'), TTR:0.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:10, title:"Sincronización fallida", TTO:2594334.0}}, {_id:242, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:11, title:"Error de login", TTO:3455934.0}}, {_id:243, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), id:12, title:"Error documentos", TTO:4311534.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:244, properties:{name:"New", id:1}}, {_id:245, properties:{name:"Pendiente de revisión"}}, {_id:246, properties:{name:"Revisión en curso"}}, {_id:247, properties:{name:"Revisión exitosa"}}, {_id:248, properties:{name:"Revisión fallida"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:249, properties:{name:"AlumnosServiceCustomer_1", id:1}}, {_id:250, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:251, properties:{name:"ServicioDeRevisiónCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:252, properties:{name:"ServicioAlumnosSla", id:1}}, {_id:253, properties:{name:"SLA control de calidad"}}, {_id:254, properties:{name:"SLA análisis"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:255, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2", id:1}}, {_id:256, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:257, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:252}, end: {_id:134}, properties:{}}, {start: {_id:253}, end: {_id:135}, properties:{}}, {start: {_id:253}, end: {_id:136}, properties:{}}, {start: {_id:254}, end: {_id:137}, properties:{}}, {start: {_id:254}, end: {_id:138}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:256}, end: {_id:214}, properties:{}}, {start: {_id:256}, end: {_id:215}, properties:{}}, {start: {_id:257}, end: {_id:214}, properties:{}}, {start: {_id:257}, end: {_id:215}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:232}, end: {_id:212}, properties:{}}, {start: {_id:233}, end: {_id:213}, properties:{}}, {start: {_id:234}, end: {_id:212}, properties:{}}, {start: {_id:235}, end: {_id:213}, properties:{}}, {start: {_id:236}, end: {_id:212}, properties:{}}, {start: {_id:237}, end: {_id:213}, properties:{}}, {start: {_id:238}, end: {_id:212}, properties:{}}, {start: {_id:239}, end: {_id:212}, properties:{}}, {start: {_id:240}, end: {_id:213}, properties:{}}, {start: {_id:241}, end: {_id:212}, properties:{}}, {start: {_id:242}, end: {_id:213}, properties:{}}, {start: {_id:243}, end: {_id:212}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:255}, end: {_id:249}, properties:{}}, {start: {_id:256}, end: {_id:250}, properties:{}}, {start: {_id:257}, end: {_id:251}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:209}, end: {_id:132}, properties:{}}, {start: {_id:210}, end: {_id:132}, properties:{}}, {start: {_id:211}, end: {_id:133}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:232}, end: {_id:244}, properties:{}}, {start: {_id:233}, end: {_id:244}, properties:{}}, {start: {_id:234}, end: {_id:244}, properties:{}}, {start: {_id:235}, end: {_id:244}, properties:{}}, {start: {_id:236}, end: {_id:244}, properties:{}}, {start: {_id:237}, end: {_id:244}, properties:{}}, {start: {_id:238}, end: {_id:244}, properties:{}}, {start: {_id:239}, end: {_id:244}, properties:{}}, {start: {_id:240}, end: {_id:244}, properties:{}}, {start: {_id:241}, end: {_id:244}, properties:{}}, {start: {_id:242}, end: {_id:244}, properties:{}}, {start: {_id:243}, end: {_id:244}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:244}, end: {_id:245}, properties:{}}, {start: {_id:245}, end: {_id:246}, properties:{}}, {start: {_id:246}, end: {_id:247}, properties:{}}, {start: {_id:246}, end: {_id:248}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:249}, end: {_id:252}, properties:{}}, {start: {_id:250}, end: {_id:254}, properties:{}}, {start: {_id:251}, end: {_id:253}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:255}, end: {_id:208}, properties:{}}, {start: {_id:256}, end: {_id:210}, properties:{}}, {start: {_id:257}, end: {_id:209}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:229}, end: {_id:120}, properties:{}}, {start: {_id:230}, end: {_id:120}, properties:{}}, {start: {_id:231}, end: {_id:120}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:207}, end: {_id:217}, properties:{}}, {start: {_id:208}, end: {_id:218}, properties:{}}, {start: {_id:208}, end: {_id:219}, properties:{}}, {start: {_id:208}, end: {_id:220}, properties:{}}, {start: {_id:209}, end: {_id:221}, properties:{}}, {start: {_id:209}, end: {_id:222}, properties:{}}, {start: {_id:210}, end: {_id:223}, properties:{}}, {start: {_id:211}, end: {_id:224}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:256}, end: {_id:245}, properties:{}}, {start: {_id:257}, end: {_id:246}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:120}, end: {_id:245}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:232}, end: {_id:217}, properties:{}}, {start: {_id:233}, end: {_id:217}, properties:{}}, {start: {_id:234}, end: {_id:217}, properties:{}}, {start: {_id:235}, end: {_id:217}, properties:{}}, {start: {_id:236}, end: {_id:217}, properties:{}}, {start: {_id:237}, end: {_id:217}, properties:{}}, {start: {_id:238}, end: {_id:217}, properties:{}}, {start: {_id:239}, end: {_id:217}, properties:{}}, {start: {_id:240}, end: {_id:217}, properties:{}}, {start: {_id:241}, end: {_id:217}, properties:{}}, {start: {_id:242}, end: {_id:217}, properties:{}}, {start: {_id:243}, end: {_id:217}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:228}, end: {_id:255}, properties:{}}, {start: {_id:230}, end: {_id:256}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:221}, end: {_id:132}, properties:{}}, {start: {_id:222}, end: {_id:132}, properties:{}}, {start: {_id:223}, end: {_id:132}, properties:{}}, {start: {_id:224}, end: {_id:133}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:232}, end: {_id:255}, properties:{}}, {start: {_id:233}, end: {_id:255}, properties:{}}, {start: {_id:234}, end: {_id:255}, properties:{}}, {start: {_id:235}, end: {_id:255}, properties:{}}, {start: {_id:236}, end: {_id:255}, properties:{}}, {start: {_id:237}, end: {_id:255}, properties:{}}, {start: {_id:238}, end: {_id:255}, properties:{}}, {start: {_id:239}, end: {_id:255}, properties:{}}, {start: {_id:240}, end: {_id:255}, properties:{}}, {start: {_id:241}, end: {_id:255}, properties:{}}, {start: {_id:242}, end: {_id:255}, properties:{}}, {start: {_id:243}, end: {_id:255}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:227}, end: {_id:207}, properties:{}}, {start: {_id:228}, end: {_id:208}, properties:{}}, {start: {_id:229}, end: {_id:211}, properties:{}}, {start: {_id:230}, end: {_id:210}, properties:{}}, {start: {_id:231}, end: {_id:209}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:134}, end: {_id:121}, properties:{}}, {start: {_id:134}, end: {_id:122}, properties:{}}, {start: {_id:135}, end: {_id:123}, properties:{}}, {start: {_id:135}, end: {_id:124}, properties:{}}, {start: {_id:136}, end: {_id:125}, properties:{}}, {start: {_id:136}, end: {_id:126}, properties:{}}, {start: {_id:137}, end: {_id:127}, properties:{}}, {start: {_id:137}, end: {_id:129}, properties:{}}, {start: {_id:138}, end: {_id:127}, properties:{}}, {start: {_id:138}, end: {_id:129}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:227}, end: {_id:216}, properties:{}}, {start: {_id:228}, end: {_id:216}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:120}, end: {_id:254}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:249}, end: {_id:227}, properties:{}}, {start: {_id:250}, end: {_id:229}, properties:{}}, {start: {_id:251}, end: {_id:230}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:120}, end: {_id:247}, properties:{}}, {start: {_id:120}, end: {_id:248}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:132}, end: {_id:225}, properties:{}}, {start: {_id:132}, end: {_id:226}, properties:{}}, {start: {_id:133}, end: {_id:226}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:217}, end: {_id:130}, properties:{}}, {start: {_id:218}, end: {_id:131}, properties:{}}, {start: {_id:219}, end: {_id:131}, properties:{}}, {start: {_id:220}, end: {_id:131}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:135}, end: {_id:214}, properties:{}}, {start: {_id:136}, end: {_id:215}, properties:{}}, {start: {_id:137}, end: {_id:214}, properties:{}}, {start: {_id:138}, end: {_id:215}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;