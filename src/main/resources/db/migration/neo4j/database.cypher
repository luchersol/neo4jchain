MATCH(n) DETACH DELETE n;
DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:0, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:1, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:32, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:33, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:34, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:35, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:36, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}, {_id:37, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", value:48.0}}, {_id:38, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", value:48.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:39, properties:{name:"Revisor"}}, {_id:40, properties:{name:"Fabricante"}}, {_id:41, properties:{name:"Profesor"}}, {_id:42, properties:{name:"Alumno"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:43, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:44, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:45, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:46, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}, {_id:47, properties:{name:"Alcance General User request", priority:"LOW"}}, {_id:48, properties:{name:"Alcance general Incident", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:49, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:50, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:51, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}, {_id:52, properties:{name:"Grupo Profesores", specialization:"FunctionalUser"}}, {_id:53, properties:{name:"Grupo 1", specialization:"ITUser"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:54, properties:{name:"Pieza de defensa"}}, {_id:55, properties:{name:"Pieza de Uso comercial"}}, {_id:56, properties:{name:"Incident"}}, {_id:57, properties:{name:"User Request"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:58, properties:{firstName:"Rocío", lastName:"López", password:"1234", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:59, properties:{firstName:"Raquel", lastName:"Romero", password:"1234", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:60, properties:{firstName:"Rubén", lastName:"Gómez", password:"1234", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:61, properties:{firstName:"Fran", lastName:"Suárez", password:"1234", phone:"654654654", name:"franito", email:"franito@gmail.com"}}, {_id:62, properties:{firstName:"Julio", lastName:"", password:"1234", phone:"", name:"julio", email:"julio@us.es"}}, {_id:63, properties:{firstName:"Pedro", lastName:"", password:"1234", phone:"", name:"pedro", email:"pedro@alum.us.es"}}, {_id:64, properties:{firstName:"Juan", lastName:"", password:"1234", phone:"", name:"juan", email:"juan@alum.us.es"}}, {_id:65, properties:{firstName:"Paula", lastName:"", password:"1234", phone:"", name:"paula", email:"paula@alum.us.es"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:66, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:67, properties:{name:"Revisar pieza"}}, {_id:68, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:69, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:70, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:71, properties:{code:"RDP", name:"Revisora de piezas S.A"}}, {_id:72, properties:{code:"PROF", name:"Profesores"}}, {_id:73, properties:{code:"ALUM", name:"Alumnos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:74, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:49:45.1042723'), createdAt:localdatetime('2025-04-16T10:20:00'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-21T11:49:45.1042723'), closedAt:localdatetime('2025-04-21T11:49:45.1042723'), title:"Plataforma caída", TTO:478278.0}}, {_id:75, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:55:04.9371147'), createdAt:localdatetime('2025-04-15T15:45:00'), TTR:50.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-21T11:55:04.9371147'), closedAt:localdatetime('2025-04-21T11:55:04.9371147'), title:"Error en notas", TTO:533537.0}}, {_id:120, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error subida tarea", TTO:620534.0}}, {_id:121, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso bloqueado", TTO:1376334.0}}, {_id:122, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo matrícula", TTO:2407134.0}}, {_id:123, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:06.1645076'), createdAt:localdatetime('2025-04-12T14:10:00'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-21T11:58:06.1645076'), title:"Acceso aula virtual", TTO:804420.0}}, {_id:124, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:30.3118271'), createdAt:localdatetime('2025-04-08T19:30:00'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-21T11:58:30.3118271'), title:"Correo caído", TTO:1098744.0}}, {_id:125, properties:{createdAt:localdatetime('2025-04-05T08:50:00'), TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-21T12:03:39.5893836'), title:"Fallo en notificaciones", TTO:1398753.0}}, {_id:126, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:127, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:04:21.6649559'), createdAt:localdatetime('2025-03-15T10:00:00'), TTR:21.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-21T12:04:21.6649559'), closedAt:localdatetime('2025-04-21T12:04:21.6649559'), title:"Sincronización fallida", TTO:2983394.0}}, {_id:128, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error de login", TTO:3455934.0}}, {_id:129, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error documentos", TTO:4311534.0}}, {_id:130, properties:{createdAt:localdatetime('2025-04-21T12:09:57.6391491'), TTR:0.0, name:"Revisión de ala derecha the EuroFighter", description:"Necesitamos revisar el ala derecha del Eurofighter 450-XDSW", title:"Revisión de ala derecha the EuroFighter", TTO:0.0}}, {_id:131, properties:{createdAt:localdatetime('2025-04-21T12:11:54.8513009'), TTR:0.0, name:"Asientos de pasajero Boeing 737", description:"Necesitamos que revisen estos asientos: F12, F36, F18 y F29 ", lastAssignedAt:localdatetime('2025-04-21T12:14:52.8513009'), title:"Revisión de los asientos del Boeing 737 AZWWED-424", TTO:178.0}}, {_id:132, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:19:38.8621162'), createdAt:localdatetime('2025-04-21T12:17:27.8621162'), TTR:27.0, name:"Tren de aterrizaje", description:"Deberían revisar el tren de aterrizaje ", lastAssignedAt:localdatetime('2025-04-21T12:19:38.8621162'), closedAt:localdatetime('2025-04-21T12:19:38.8621162'), title:"Revisión del tren de aterrizaje para el avión B-2463-XEFDW", TTO:104.0}}, {_id:133, properties:{lastStateChangedAt:localdatetime('2025-04-22T20:12:26.1761455'), createdAt:localdatetime('2025-04-22T20:11:03.7109943'), TTR:35.0, name:"Corrección de trabajos", description:"Aquí envío los trabajos corregidos. En breves debería recibirlos firmado de vuelta.", lastAssignedAt:localdatetime('2025-04-22T20:12:26.1761455'), closedAt:localdatetime('2025-04-22T20:12:26.1761455'), title:"Corrección de trabajos", TTO:81.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:134, properties:{name:"Nueva petición", id:1}}, {_id:135, properties:{name:"Pendiente de revisión"}}, {_id:136, properties:{name:"Revisión en curso"}}, {_id:137, properties:{name:"Revisión exitosa"}}, {_id:138, properties:{name:"Revisión fallida"}}, {_id:139, properties:{name:"New"}}, {_id:140, properties:{name:"Gestionándose"}}, {_id:141, properties:{name:"Cerrada"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:142, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:143, properties:{name:"ServicioDeRevisiónCustomer_1"}}, {_id:144, properties:{name:"AlumnosServiceCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:145, properties:{name:"SLA control de calidad"}}, {_id:146, properties:{name:"SLA análisis"}}, {_id:147, properties:{name:"ServicioAlumnosSla"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:148, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:149, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}, {_id:150, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:145}, end: {_id:43}, properties:{}}, {start: {_id:145}, end: {_id:44}, properties:{}}, {start: {_id:146}, end: {_id:45}, properties:{}}, {start: {_id:146}, end: {_id:46}, properties:{}}, {start: {_id:147}, end: {_id:47}, properties:{}}, {start: {_id:147}, end: {_id:48}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:148}, end: {_id:54}, properties:{}}, {start: {_id:148}, end: {_id:55}, properties:{}}, {start: {_id:149}, end: {_id:54}, properties:{}}, {start: {_id:149}, end: {_id:55}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:74}, end: {_id:56}, properties:{}}, {start: {_id:75}, end: {_id:57}, properties:{}}, {start: {_id:120}, end: {_id:56}, properties:{}}, {start: {_id:121}, end: {_id:57}, properties:{}}, {start: {_id:122}, end: {_id:56}, properties:{}}, {start: {_id:123}, end: {_id:57}, properties:{}}, {start: {_id:124}, end: {_id:56}, properties:{}}, {start: {_id:125}, end: {_id:56}, properties:{}}, {start: {_id:126}, end: {_id:57}, properties:{}}, {start: {_id:127}, end: {_id:56}, properties:{}}, {start: {_id:128}, end: {_id:57}, properties:{}}, {start: {_id:129}, end: {_id:56}, properties:{}}, {start: {_id:130}, end: {_id:54}, properties:{}}, {start: {_id:131}, end: {_id:55}, properties:{}}, {start: {_id:132}, end: {_id:54}, properties:{}}, {start: {_id:133}, end: {_id:56}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:148}, end: {_id:142}, properties:{}}, {start: {_id:149}, end: {_id:143}, properties:{}}, {start: {_id:150}, end: {_id:144}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:49}, end: {_id:39}, properties:{}}, {start: {_id:50}, end: {_id:39}, properties:{}}, {start: {_id:51}, end: {_id:40}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:74}, end: {_id:141}, properties:{}}, {start: {_id:75}, end: {_id:141}, properties:{}}, {start: {_id:120}, end: {_id:139}, properties:{}}, {start: {_id:121}, end: {_id:139}, properties:{}}, {start: {_id:122}, end: {_id:139}, properties:{}}, {start: {_id:123}, end: {_id:140}, properties:{}}, {start: {_id:124}, end: {_id:140}, properties:{}}, {start: {_id:125}, end: {_id:139}, properties:{}}, {start: {_id:126}, end: {_id:139}, properties:{}}, {start: {_id:127}, end: {_id:141}, properties:{}}, {start: {_id:128}, end: {_id:139}, properties:{}}, {start: {_id:129}, end: {_id:139}, properties:{}}, {start: {_id:130}, end: {_id:135}, properties:{}}, {start: {_id:131}, end: {_id:135}, properties:{}}, {start: {_id:132}, end: {_id:137}, properties:{}}, {start: {_id:133}, end: {_id:141}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:134}, end: {_id:135}, properties:{}}, {start: {_id:135}, end: {_id:136}, properties:{}}, {start: {_id:136}, end: {_id:137}, properties:{}}, {start: {_id:136}, end: {_id:138}, properties:{}}, {start: {_id:139}, end: {_id:140}, properties:{}}, {start: {_id:140}, end: {_id:141}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:142}, end: {_id:146}, properties:{}}, {start: {_id:143}, end: {_id:145}, properties:{}}, {start: {_id:144}, end: {_id:147}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:148}, end: {_id:50}, properties:{}}, {start: {_id:149}, end: {_id:49}, properties:{}}, {start: {_id:150}, end: {_id:53}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:69}, end: {_id:0}, properties:{}}, {start: {_id:70}, end: {_id:0}, properties:{}}, {start: {_id:71}, end: {_id:0}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:74}, end: {_id:53}, properties:{}}, {start: {_id:75}, end: {_id:53}, properties:{}}, {start: {_id:123}, end: {_id:53}, properties:{}}, {start: {_id:125}, end: {_id:53}, properties:{}}, {start: {_id:127}, end: {_id:53}, properties:{}}, {start: {_id:131}, end: {_id:50}, properties:{}}, {start: {_id:132}, end: {_id:49}, properties:{}}, {start: {_id:133}, end: {_id:53}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:49}, end: {_id:58}, properties:{}}, {start: {_id:49}, end: {_id:59}, properties:{}}, {start: {_id:50}, end: {_id:60}, properties:{}}, {start: {_id:51}, end: {_id:61}, properties:{}}, {start: {_id:52}, end: {_id:62}, properties:{}}, {start: {_id:53}, end: {_id:63}, properties:{}}, {start: {_id:53}, end: {_id:64}, properties:{}}, {start: {_id:53}, end: {_id:65}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:148}, end: {_id:135}, properties:{}}, {start: {_id:149}, end: {_id:136}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:0}, end: {_id:135}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:74}, end: {_id:62}, properties:{}}, {start: {_id:75}, end: {_id:62}, properties:{}}, {start: {_id:120}, end: {_id:62}, properties:{}}, {start: {_id:121}, end: {_id:62}, properties:{}}, {start: {_id:122}, end: {_id:62}, properties:{}}, {start: {_id:123}, end: {_id:62}, properties:{}}, {start: {_id:124}, end: {_id:62}, properties:{}}, {start: {_id:125}, end: {_id:62}, properties:{}}, {start: {_id:126}, end: {_id:62}, properties:{}}, {start: {_id:127}, end: {_id:62}, properties:{}}, {start: {_id:128}, end: {_id:62}, properties:{}}, {start: {_id:129}, end: {_id:62}, properties:{}}, {start: {_id:130}, end: {_id:61}, properties:{}}, {start: {_id:131}, end: {_id:61}, properties:{}}, {start: {_id:132}, end: {_id:61}, properties:{}}, {start: {_id:133}, end: {_id:62}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:70}, end: {_id:148}, properties:{}}, {start: {_id:71}, end: {_id:149}, properties:{}}, {start: {_id:73}, end: {_id:150}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:74}, end: {_id:64}, properties:{}}, {start: {_id:75}, end: {_id:64}, properties:{}}, {start: {_id:123}, end: {_id:63}, properties:{}}, {start: {_id:125}, end: {_id:65}, properties:{}}, {start: {_id:127}, end: {_id:65}, properties:{}}, {start: {_id:131}, end: {_id:60}, properties:{}}, {start: {_id:132}, end: {_id:59}, properties:{}}, {start: {_id:133}, end: {_id:65}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASSIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:58}, end: {_id:39}, properties:{}}, {start: {_id:59}, end: {_id:39}, properties:{}}, {start: {_id:60}, end: {_id:39}, properties:{}}, {start: {_id:61}, end: {_id:40}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:74}, end: {_id:150}, properties:{}}, {start: {_id:75}, end: {_id:150}, properties:{}}, {start: {_id:120}, end: {_id:150}, properties:{}}, {start: {_id:121}, end: {_id:150}, properties:{}}, {start: {_id:122}, end: {_id:150}, properties:{}}, {start: {_id:123}, end: {_id:150}, properties:{}}, {start: {_id:124}, end: {_id:150}, properties:{}}, {start: {_id:125}, end: {_id:150}, properties:{}}, {start: {_id:126}, end: {_id:150}, properties:{}}, {start: {_id:127}, end: {_id:150}, properties:{}}, {start: {_id:128}, end: {_id:150}, properties:{}}, {start: {_id:129}, end: {_id:150}, properties:{}}, {start: {_id:130}, end: {_id:148}, properties:{}}, {start: {_id:131}, end: {_id:148}, properties:{}}, {start: {_id:132}, end: {_id:148}, properties:{}}, {start: {_id:133}, end: {_id:150}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:69}, end: {_id:51}, properties:{}}, {start: {_id:70}, end: {_id:50}, properties:{}}, {start: {_id:71}, end: {_id:49}, properties:{}}, {start: {_id:72}, end: {_id:52}, properties:{}}, {start: {_id:73}, end: {_id:53}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:43}, end: {_id:1}, properties:{}}, {start: {_id:43}, end: {_id:32}, properties:{}}, {start: {_id:44}, end: {_id:33}, properties:{}}, {start: {_id:44}, end: {_id:34}, properties:{}}, {start: {_id:45}, end: {_id:35}, properties:{}}, {start: {_id:45}, end: {_id:36}, properties:{}}, {start: {_id:46}, end: {_id:35}, properties:{}}, {start: {_id:46}, end: {_id:36}, properties:{}}, {start: {_id:47}, end: {_id:37}, properties:{}}, {start: {_id:47}, end: {_id:38}, properties:{}}, {start: {_id:48}, end: {_id:37}, properties:{}}, {start: {_id:48}, end: {_id:38}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:72}, end: {_id:66}, properties:{}}, {start: {_id:73}, end: {_id:66}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:0}, end: {_id:146}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:142}, end: {_id:69}, properties:{}}, {start: {_id:143}, end: {_id:70}, properties:{}}, {start: {_id:144}, end: {_id:72}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:0}, end: {_id:137}, properties:{}}, {start: {_id:0}, end: {_id:138}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:39}, end: {_id:67}, properties:{}}, {start: {_id:39}, end: {_id:68}, properties:{}}, {start: {_id:40}, end: {_id:68}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:62}, end: {_id:41}, properties:{}}, {start: {_id:63}, end: {_id:42}, properties:{}}, {start: {_id:64}, end: {_id:42}, properties:{}}, {start: {_id:65}, end: {_id:42}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:43}, end: {_id:54}, properties:{}}, {start: {_id:44}, end: {_id:55}, properties:{}}, {start: {_id:45}, end: {_id:54}, properties:{}}, {start: {_id:46}, end: {_id:55}, properties:{}}, {start: {_id:47}, end: {_id:57}, properties:{}}, {start: {_id:48}, end: {_id:56}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;