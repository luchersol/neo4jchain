MATCH(n) DETACH DELETE n;
DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:151, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:1, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:2, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:3, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:4, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:5, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:6, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}, {_id:7, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", value:48.0}}, {_id:8, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", value:48.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:9, properties:{name:"Revisor"}}, {_id:10, properties:{name:"Fabricante"}}, {_id:11, properties:{name:"Profesor"}}, {_id:12, properties:{name:"Alumno"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:13, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:14, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:15, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:16, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}, {_id:17, properties:{name:"Alcance General User request", priority:"LOW"}}, {_id:18, properties:{name:"Alcance general Incident", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:19, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:20, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:21, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}, {_id:22, properties:{name:"Grupo Profesores", specialization:"FunctionalUser"}}, {_id:23, properties:{name:"Grupo 1", specialization:"ITUser"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:24, properties:{name:"Pieza de defensa"}}, {_id:25, properties:{name:"Pieza de Uso comercial"}}, {_id:26, properties:{name:"Incident"}}, {_id:27, properties:{name:"User Request"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:28, properties:{firstName:"Rocío", lastName:"López", password:"1234", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:29, properties:{firstName:"Raquel", lastName:"Romero", password:"1234", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:30, properties:{firstName:"Rubén", lastName:"Gómez", password:"1234", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:31, properties:{firstName:"Fran", lastName:"Suárez", password:"1234", phone:"654654654", name:"franito", email:"franito@gmail.com"}}, {_id:76, properties:{firstName:"Julio", lastName:"", password:"1234", phone:"", name:"julio", email:"julio@us.es"}}, {_id:77, properties:{firstName:"Pedro", lastName:"", password:"1234", phone:"", name:"pedro", email:"pedro@alum.us.es"}}, {_id:78, properties:{firstName:"Juan", lastName:"", password:"1234", phone:"", name:"juan", email:"juan@alum.us.es"}}, {_id:79, properties:{firstName:"Paula", lastName:"", password:"1234", phone:"", name:"paula", email:"paula@alum.us.es"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:80, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:81, properties:{name:"Revisar pieza"}}, {_id:82, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:83, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:84, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:85, properties:{code:"RDP", name:"Revisora de piezas S.A"}}, {_id:86, properties:{code:"PROF", name:"Profesores"}}, {_id:87, properties:{code:"ALUM", name:"Alumnos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:88, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:49:45.1042723'), createdAt:localdatetime('2025-04-16T10:20:00'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-21T11:49:45.1042723'), closedAt:localdatetime('2025-04-21T11:49:45.1042723'), title:"Plataforma caída", TTO:478278.0}}, {_id:89, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:55:04.9371147'), createdAt:localdatetime('2025-04-15T15:45:00'), TTR:50.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-21T11:55:04.9371147'), closedAt:localdatetime('2025-04-21T11:55:04.9371147'), title:"Error en notas", TTO:533537.0}}, {_id:90, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error subida tarea", TTO:620534.0}}, {_id:91, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso bloqueado", TTO:1376334.0}}, {_id:92, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo matrícula", TTO:2407134.0}}, {_id:93, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:06.1645076'), createdAt:localdatetime('2025-04-12T14:10:00'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-21T11:58:06.1645076'), title:"Acceso aula virtual", TTO:804420.0}}, {_id:94, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:30.3118271'), createdAt:localdatetime('2025-04-08T19:30:00'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-21T11:58:30.3118271'), title:"Correo caído", TTO:1098744.0}}, {_id:95, properties:{createdAt:localdatetime('2025-04-05T08:50:00'), TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-21T12:03:39.5893836'), title:"Fallo en notificaciones", TTO:1398753.0}}, {_id:96, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:97, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:04:21.6649559'), createdAt:localdatetime('2025-03-15T10:00:00'), TTR:21.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-21T12:04:21.6649559'), closedAt:localdatetime('2025-04-21T12:04:21.6649559'), title:"Sincronización fallida", TTO:2983394.0}}, {_id:98, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error de login", TTO:3455934.0}}, {_id:99, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error documentos", TTO:4311534.0}}, {_id:100, properties:{createdAt:localdatetime('2025-04-21T12:09:57.6391491'), TTR:0.0, name:"Revisión de ala derecha the EuroFighter", description:"Necesitamos revisar el ala derecha del Eurofighter 450-XDSW", title:"Revisión de ala derecha the EuroFighter", TTO:0.0}}, {_id:101, properties:{createdAt:localdatetime('2025-04-21T12:11:54.8513009'), TTR:0.0, name:"Asientos de pasajero Boeing 737", description:"Necesitamos que revisen estos asientos: F12, F36, F18 y F29 ", lastAssignedAt:localdatetime('2025-04-21T12:14:52.8513009'), title:"Revisión de los asientos del Boeing 737 AZWWED-424", TTO:178.0}}, {_id:102, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:19:38.8621162'), createdAt:localdatetime('2025-04-21T12:17:27.8621162'), TTR:27.0, name:"Tren de aterrizaje", description:"Deberían revisar el tren de aterrizaje ", lastAssignedAt:localdatetime('2025-04-21T12:19:38.8621162'), closedAt:localdatetime('2025-04-21T12:19:38.8621162'), title:"Revisión del tren de aterrizaje para el avión B-2463-XEFDW", TTO:104.0}}, {_id:152, properties:{lastStateChangedAt:localdatetime('2025-04-22T20:12:26.1761455'), createdAt:localdatetime('2025-04-22T20:11:03.7109943'), TTR:35.0, name:"Corrección de trabajos", description:"Aquí envío los trabajos corregidos. En breves debería recibirlos firmado de vuelta.", lastAssignedAt:localdatetime('2025-04-22T20:12:26.1761455'), closedAt:localdatetime('2025-04-22T20:12:26.1761455'), title:"Corrección de trabajos", TTO:81.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:103, properties:{name:"Nueva petición", id:1}}, {_id:104, properties:{name:"Pendiente de revisión"}}, {_id:105, properties:{name:"Revisión en curso"}}, {_id:106, properties:{name:"Revisión exitosa"}}, {_id:107, properties:{name:"Revisión fallida"}}, {_id:108, properties:{name:"New"}}, {_id:109, properties:{name:"Gestionándose"}}, {_id:110, properties:{name:"Cerrada"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:111, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:112, properties:{name:"ServicioDeRevisiónCustomer_1"}}, {_id:113, properties:{name:"AlumnosServiceCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:114, properties:{name:"SLA control de calidad"}}, {_id:115, properties:{name:"SLA análisis"}}, {_id:116, properties:{name:"ServicioAlumnosSla"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:117, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:118, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}, {_id:119, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:114}, end: {_id:13}, properties:{}}, {start: {_id:114}, end: {_id:14}, properties:{}}, {start: {_id:115}, end: {_id:15}, properties:{}}, {start: {_id:115}, end: {_id:16}, properties:{}}, {start: {_id:116}, end: {_id:17}, properties:{}}, {start: {_id:116}, end: {_id:18}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:117}, end: {_id:24}, properties:{}}, {start: {_id:117}, end: {_id:25}, properties:{}}, {start: {_id:118}, end: {_id:24}, properties:{}}, {start: {_id:118}, end: {_id:25}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:88}, end: {_id:26}, properties:{}}, {start: {_id:89}, end: {_id:27}, properties:{}}, {start: {_id:90}, end: {_id:26}, properties:{}}, {start: {_id:91}, end: {_id:27}, properties:{}}, {start: {_id:92}, end: {_id:26}, properties:{}}, {start: {_id:93}, end: {_id:27}, properties:{}}, {start: {_id:94}, end: {_id:26}, properties:{}}, {start: {_id:95}, end: {_id:26}, properties:{}}, {start: {_id:96}, end: {_id:27}, properties:{}}, {start: {_id:97}, end: {_id:26}, properties:{}}, {start: {_id:98}, end: {_id:27}, properties:{}}, {start: {_id:99}, end: {_id:26}, properties:{}}, {start: {_id:100}, end: {_id:24}, properties:{}}, {start: {_id:101}, end: {_id:25}, properties:{}}, {start: {_id:102}, end: {_id:24}, properties:{}}, {start: {_id:152}, end: {_id:26}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:117}, end: {_id:111}, properties:{}}, {start: {_id:118}, end: {_id:112}, properties:{}}, {start: {_id:119}, end: {_id:113}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:19}, end: {_id:9}, properties:{}}, {start: {_id:20}, end: {_id:9}, properties:{}}, {start: {_id:21}, end: {_id:10}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:88}, end: {_id:110}, properties:{}}, {start: {_id:89}, end: {_id:110}, properties:{}}, {start: {_id:90}, end: {_id:108}, properties:{}}, {start: {_id:91}, end: {_id:108}, properties:{}}, {start: {_id:92}, end: {_id:108}, properties:{}}, {start: {_id:93}, end: {_id:109}, properties:{}}, {start: {_id:94}, end: {_id:109}, properties:{}}, {start: {_id:95}, end: {_id:108}, properties:{}}, {start: {_id:96}, end: {_id:108}, properties:{}}, {start: {_id:97}, end: {_id:110}, properties:{}}, {start: {_id:98}, end: {_id:108}, properties:{}}, {start: {_id:99}, end: {_id:108}, properties:{}}, {start: {_id:100}, end: {_id:104}, properties:{}}, {start: {_id:101}, end: {_id:104}, properties:{}}, {start: {_id:102}, end: {_id:106}, properties:{}}, {start: {_id:152}, end: {_id:110}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:103}, end: {_id:104}, properties:{}}, {start: {_id:104}, end: {_id:105}, properties:{}}, {start: {_id:105}, end: {_id:106}, properties:{}}, {start: {_id:105}, end: {_id:107}, properties:{}}, {start: {_id:108}, end: {_id:109}, properties:{}}, {start: {_id:109}, end: {_id:110}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:111}, end: {_id:115}, properties:{}}, {start: {_id:112}, end: {_id:114}, properties:{}}, {start: {_id:113}, end: {_id:116}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:117}, end: {_id:20}, properties:{}}, {start: {_id:118}, end: {_id:19}, properties:{}}, {start: {_id:119}, end: {_id:23}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:83}, end: {_id:151}, properties:{}}, {start: {_id:84}, end: {_id:151}, properties:{}}, {start: {_id:85}, end: {_id:151}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:88}, end: {_id:23}, properties:{}}, {start: {_id:89}, end: {_id:23}, properties:{}}, {start: {_id:93}, end: {_id:23}, properties:{}}, {start: {_id:95}, end: {_id:23}, properties:{}}, {start: {_id:97}, end: {_id:23}, properties:{}}, {start: {_id:101}, end: {_id:20}, properties:{}}, {start: {_id:102}, end: {_id:19}, properties:{}}, {start: {_id:152}, end: {_id:23}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:19}, end: {_id:28}, properties:{}}, {start: {_id:19}, end: {_id:29}, properties:{}}, {start: {_id:20}, end: {_id:30}, properties:{}}, {start: {_id:21}, end: {_id:31}, properties:{}}, {start: {_id:22}, end: {_id:76}, properties:{}}, {start: {_id:23}, end: {_id:77}, properties:{}}, {start: {_id:23}, end: {_id:78}, properties:{}}, {start: {_id:23}, end: {_id:79}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:117}, end: {_id:104}, properties:{}}, {start: {_id:118}, end: {_id:105}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:151}, end: {_id:104}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:88}, end: {_id:76}, properties:{}}, {start: {_id:89}, end: {_id:76}, properties:{}}, {start: {_id:90}, end: {_id:76}, properties:{}}, {start: {_id:91}, end: {_id:76}, properties:{}}, {start: {_id:92}, end: {_id:76}, properties:{}}, {start: {_id:93}, end: {_id:76}, properties:{}}, {start: {_id:94}, end: {_id:76}, properties:{}}, {start: {_id:95}, end: {_id:76}, properties:{}}, {start: {_id:96}, end: {_id:76}, properties:{}}, {start: {_id:97}, end: {_id:76}, properties:{}}, {start: {_id:98}, end: {_id:76}, properties:{}}, {start: {_id:99}, end: {_id:76}, properties:{}}, {start: {_id:100}, end: {_id:31}, properties:{}}, {start: {_id:101}, end: {_id:31}, properties:{}}, {start: {_id:102}, end: {_id:31}, properties:{}}, {start: {_id:152}, end: {_id:76}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:84}, end: {_id:117}, properties:{}}, {start: {_id:87}, end: {_id:119}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:88}, end: {_id:78}, properties:{}}, {start: {_id:89}, end: {_id:78}, properties:{}}, {start: {_id:93}, end: {_id:77}, properties:{}}, {start: {_id:95}, end: {_id:79}, properties:{}}, {start: {_id:97}, end: {_id:79}, properties:{}}, {start: {_id:101}, end: {_id:30}, properties:{}}, {start: {_id:102}, end: {_id:29}, properties:{}}, {start: {_id:152}, end: {_id:79}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASSIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:28}, end: {_id:9}, properties:{}}, {start: {_id:29}, end: {_id:9}, properties:{}}, {start: {_id:30}, end: {_id:9}, properties:{}}, {start: {_id:31}, end: {_id:10}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:88}, end: {_id:119}, properties:{}}, {start: {_id:89}, end: {_id:119}, properties:{}}, {start: {_id:90}, end: {_id:119}, properties:{}}, {start: {_id:91}, end: {_id:119}, properties:{}}, {start: {_id:92}, end: {_id:119}, properties:{}}, {start: {_id:93}, end: {_id:119}, properties:{}}, {start: {_id:94}, end: {_id:119}, properties:{}}, {start: {_id:95}, end: {_id:119}, properties:{}}, {start: {_id:96}, end: {_id:119}, properties:{}}, {start: {_id:97}, end: {_id:119}, properties:{}}, {start: {_id:98}, end: {_id:119}, properties:{}}, {start: {_id:99}, end: {_id:119}, properties:{}}, {start: {_id:100}, end: {_id:117}, properties:{}}, {start: {_id:101}, end: {_id:117}, properties:{}}, {start: {_id:102}, end: {_id:117}, properties:{}}, {start: {_id:152}, end: {_id:119}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:83}, end: {_id:21}, properties:{}}, {start: {_id:84}, end: {_id:20}, properties:{}}, {start: {_id:85}, end: {_id:19}, properties:{}}, {start: {_id:86}, end: {_id:22}, properties:{}}, {start: {_id:87}, end: {_id:23}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:13}, end: {_id:1}, properties:{}}, {start: {_id:13}, end: {_id:2}, properties:{}}, {start: {_id:14}, end: {_id:3}, properties:{}}, {start: {_id:14}, end: {_id:4}, properties:{}}, {start: {_id:15}, end: {_id:5}, properties:{}}, {start: {_id:15}, end: {_id:6}, properties:{}}, {start: {_id:16}, end: {_id:5}, properties:{}}, {start: {_id:16}, end: {_id:6}, properties:{}}, {start: {_id:17}, end: {_id:7}, properties:{}}, {start: {_id:17}, end: {_id:8}, properties:{}}, {start: {_id:18}, end: {_id:7}, properties:{}}, {start: {_id:18}, end: {_id:8}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:86}, end: {_id:80}, properties:{}}, {start: {_id:87}, end: {_id:80}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:151}, end: {_id:115}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:111}, end: {_id:83}, properties:{}}, {start: {_id:112}, end: {_id:84}, properties:{}}, {start: {_id:113}, end: {_id:86}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:151}, end: {_id:106}, properties:{}}, {start: {_id:151}, end: {_id:107}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:9}, end: {_id:81}, properties:{}}, {start: {_id:9}, end: {_id:82}, properties:{}}, {start: {_id:10}, end: {_id:82}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:76}, end: {_id:11}, properties:{}}, {start: {_id:77}, end: {_id:12}, properties:{}}, {start: {_id:78}, end: {_id:12}, properties:{}}, {start: {_id:79}, end: {_id:12}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:13}, end: {_id:24}, properties:{}}, {start: {_id:14}, end: {_id:25}, properties:{}}, {start: {_id:15}, end: {_id:24}, properties:{}}, {start: {_id:16}, end: {_id:25}, properties:{}}, {start: {_id:17}, end: {_id:27}, properties:{}}, {start: {_id:18}, end: {_id:26}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;