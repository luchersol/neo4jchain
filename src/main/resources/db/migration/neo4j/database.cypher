MATCH(n) DETACH DELETE n;
DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:1125, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:1126, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:1127, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:1128, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:1129, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:1130, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:1131, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}, {_id:1132, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", value:48.0}}, {_id:1133, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", value:48.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:1134, properties:{name:"Revisor"}}, {_id:1135, properties:{name:"Fabricante"}}, {_id:1136, properties:{name:"Profesor"}}, {_id:1137, properties:{name:"Alumno"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:1138, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:1139, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:1140, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:1141, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}, {_id:1142, properties:{name:"Alcance General User request", priority:"LOW"}}, {_id:1197, properties:{name:"Alcance general Incident", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:1143, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:1144, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:1145, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}, {_id:1146, properties:{name:"Grupo Profesores", specialization:"FunctionalUser"}}, {_id:1147, properties:{name:"Grupo 1", specialization:"ITUser"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:1148, properties:{name:"Pieza de defensa"}}, {_id:1149, properties:{name:"Pieza de Uso comercial"}}, {_id:1150, properties:{name:"Incident"}}, {_id:1151, properties:{name:"User Request"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:1152, properties:{lastName:"López", firstName:"Rocío", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:1153, properties:{lastName:"Romero", firstName:"Raquel", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:1154, properties:{lastName:"Gómez", firstName:"Rubén", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:1155, properties:{lastName:"Suárez", firstName:"Fran", phone:"654654654", name:"franito", email:"franito@gmail.com"}}, {_id:1156, properties:{lastName:"", firstName:"Julio", password:"1234", phone:"", name:"julio", email:"julio@us.es"}}, {_id:1157, properties:{lastName:"", firstName:"Pedro", password:"1234", phone:"", name:"pedro", email:"pedro@alum.us.es"}}, {_id:1158, properties:{lastName:"", firstName:"Juan", password:"1234", phone:"", name:"juan", email:"juan@alum.us.es"}}, {_id:1159, properties:{lastName:"", firstName:"Paula", password:"1234", phone:"", name:"paula", email:"paula@alum.us.es"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1160, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:1161, properties:{name:"Revisar pieza"}}, {_id:1162, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:1163, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:1164, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:1165, properties:{code:"RDP", name:"Revisora de piezas S.A"}}, {_id:1166, properties:{code:"PROF", name:"Profesores"}}, {_id:1167, properties:{code:"ALUM", name:"Alumnos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:1168, properties:{createdAt:localdatetime('2025-04-16T10:20:00'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Plataforma caída", TTO:90094.0}}, {_id:1169, properties:{createdAt:localdatetime('2025-04-15T15:45:00'), TTR:0.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error en notas", TTO:145034.0}}, {_id:1170, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error subida tarea", TTO:620534.0}}, {_id:1171, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso bloqueado", TTO:1376334.0}}, {_id:1172, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo matrícula", TTO:2407134.0}}, {_id:1173, properties:{createdAt:localdatetime('2025-04-12T14:10:00'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso aula virtual", TTO:415734.0}}, {_id:1174, properties:{createdAt:localdatetime('2025-04-08T19:30:00'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Correo caído", TTO:710034.0}}, {_id:1175, properties:{createdAt:localdatetime('2025-04-05T08:50:00'), TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo en notificaciones", TTO:1009734.0}}, {_id:1176, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:1177, properties:{createdAt:localdatetime('2025-03-15T10:00:00'), TTR:0.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Sincronización fallida", TTO:2594334.0}}, {_id:1178, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error de login", TTO:3455934.0}}, {_id:1179, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error documentos", TTO:4311534.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:1180, properties:{name:"Nueva petición", id:1}}, {_id:1181, properties:{name:"Pendiente de revisión"}}, {_id:1182, properties:{name:"Revisión en curso"}}, {_id:1183, properties:{name:"Revisión exitosa"}}, {_id:1184, properties:{name:"Revisión fallida"}}, {_id:1185, properties:{name:"New"}}, {_id:1186, properties:{name:"Gestionándose"}}, {_id:1187, properties:{name:"Cerrada"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:1188, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:1189, properties:{name:"ServicioDeRevisiónCustomer_1"}}, {_id:1190, properties:{name:"AlumnosServiceCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:1191, properties:{name:"SLA control de calidad"}}, {_id:1192, properties:{name:"SLA análisis"}}, {_id:1193, properties:{name:"ServicioAlumnosSla"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:1194, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:1195, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}, {_id:1196, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:1191}, end: {_id:1138}, properties:{}}, {start: {_id:1191}, end: {_id:1139}, properties:{}}, {start: {_id:1192}, end: {_id:1140}, properties:{}}, {start: {_id:1192}, end: {_id:1141}, properties:{}}, {start: {_id:1193}, end: {_id:1142}, properties:{}}, {start: {_id:1193}, end: {_id:1197}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1194}, end: {_id:1148}, properties:{}}, {start: {_id:1194}, end: {_id:1149}, properties:{}}, {start: {_id:1195}, end: {_id:1148}, properties:{}}, {start: {_id:1195}, end: {_id:1149}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1168}, end: {_id:1150}, properties:{}}, {start: {_id:1169}, end: {_id:1151}, properties:{}}, {start: {_id:1170}, end: {_id:1150}, properties:{}}, {start: {_id:1171}, end: {_id:1151}, properties:{}}, {start: {_id:1172}, end: {_id:1150}, properties:{}}, {start: {_id:1173}, end: {_id:1151}, properties:{}}, {start: {_id:1174}, end: {_id:1150}, properties:{}}, {start: {_id:1175}, end: {_id:1150}, properties:{}}, {start: {_id:1176}, end: {_id:1151}, properties:{}}, {start: {_id:1177}, end: {_id:1150}, properties:{}}, {start: {_id:1178}, end: {_id:1151}, properties:{}}, {start: {_id:1179}, end: {_id:1150}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1194}, end: {_id:1188}, properties:{}}, {start: {_id:1195}, end: {_id:1189}, properties:{}}, {start: {_id:1196}, end: {_id:1190}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:1143}, end: {_id:1134}, properties:{}}, {start: {_id:1144}, end: {_id:1134}, properties:{}}, {start: {_id:1145}, end: {_id:1135}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1168}, end: {_id:1185}, properties:{}}, {start: {_id:1169}, end: {_id:1185}, properties:{}}, {start: {_id:1170}, end: {_id:1185}, properties:{}}, {start: {_id:1171}, end: {_id:1185}, properties:{}}, {start: {_id:1172}, end: {_id:1185}, properties:{}}, {start: {_id:1173}, end: {_id:1185}, properties:{}}, {start: {_id:1174}, end: {_id:1185}, properties:{}}, {start: {_id:1175}, end: {_id:1185}, properties:{}}, {start: {_id:1176}, end: {_id:1185}, properties:{}}, {start: {_id:1177}, end: {_id:1185}, properties:{}}, {start: {_id:1178}, end: {_id:1185}, properties:{}}, {start: {_id:1179}, end: {_id:1185}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1180}, end: {_id:1181}, properties:{}}, {start: {_id:1181}, end: {_id:1182}, properties:{}}, {start: {_id:1182}, end: {_id:1183}, properties:{}}, {start: {_id:1182}, end: {_id:1184}, properties:{}}, {start: {_id:1185}, end: {_id:1186}, properties:{}}, {start: {_id:1186}, end: {_id:1187}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1188}, end: {_id:1192}, properties:{}}, {start: {_id:1189}, end: {_id:1191}, properties:{}}, {start: {_id:1190}, end: {_id:1193}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:1194}, end: {_id:1144}, properties:{}}, {start: {_id:1195}, end: {_id:1143}, properties:{}}, {start: {_id:1196}, end: {_id:1147}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:1163}, end: {_id:1125}, properties:{}}, {start: {_id:1164}, end: {_id:1125}, properties:{}}, {start: {_id:1165}, end: {_id:1125}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1143}, end: {_id:1152}, properties:{}}, {start: {_id:1143}, end: {_id:1153}, properties:{}}, {start: {_id:1144}, end: {_id:1154}, properties:{}}, {start: {_id:1145}, end: {_id:1155}, properties:{}}, {start: {_id:1146}, end: {_id:1156}, properties:{}}, {start: {_id:1147}, end: {_id:1157}, properties:{}}, {start: {_id:1147}, end: {_id:1158}, properties:{}}, {start: {_id:1147}, end: {_id:1159}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:1194}, end: {_id:1181}, properties:{}}, {start: {_id:1195}, end: {_id:1182}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1125}, end: {_id:1181}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:1168}, end: {_id:1156}, properties:{}}, {start: {_id:1169}, end: {_id:1156}, properties:{}}, {start: {_id:1170}, end: {_id:1156}, properties:{}}, {start: {_id:1171}, end: {_id:1156}, properties:{}}, {start: {_id:1172}, end: {_id:1156}, properties:{}}, {start: {_id:1173}, end: {_id:1156}, properties:{}}, {start: {_id:1174}, end: {_id:1156}, properties:{}}, {start: {_id:1175}, end: {_id:1156}, properties:{}}, {start: {_id:1176}, end: {_id:1156}, properties:{}}, {start: {_id:1177}, end: {_id:1156}, properties:{}}, {start: {_id:1178}, end: {_id:1156}, properties:{}}, {start: {_id:1179}, end: {_id:1156}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:1164}, end: {_id:1194}, properties:{}}, {start: {_id:1167}, end: {_id:1196}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1152}, end: {_id:1134}, properties:{}}, {start: {_id:1153}, end: {_id:1134}, properties:{}}, {start: {_id:1154}, end: {_id:1134}, properties:{}}, {start: {_id:1155}, end: {_id:1135}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:1168}, end: {_id:1196}, properties:{}}, {start: {_id:1169}, end: {_id:1196}, properties:{}}, {start: {_id:1170}, end: {_id:1196}, properties:{}}, {start: {_id:1171}, end: {_id:1196}, properties:{}}, {start: {_id:1172}, end: {_id:1196}, properties:{}}, {start: {_id:1173}, end: {_id:1196}, properties:{}}, {start: {_id:1174}, end: {_id:1196}, properties:{}}, {start: {_id:1175}, end: {_id:1196}, properties:{}}, {start: {_id:1176}, end: {_id:1196}, properties:{}}, {start: {_id:1177}, end: {_id:1196}, properties:{}}, {start: {_id:1178}, end: {_id:1196}, properties:{}}, {start: {_id:1179}, end: {_id:1196}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1163}, end: {_id:1145}, properties:{}}, {start: {_id:1164}, end: {_id:1144}, properties:{}}, {start: {_id:1165}, end: {_id:1143}, properties:{}}, {start: {_id:1166}, end: {_id:1146}, properties:{}}, {start: {_id:1167}, end: {_id:1147}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:1138}, end: {_id:1126}, properties:{}}, {start: {_id:1138}, end: {_id:1127}, properties:{}}, {start: {_id:1139}, end: {_id:1128}, properties:{}}, {start: {_id:1139}, end: {_id:1129}, properties:{}}, {start: {_id:1140}, end: {_id:1130}, properties:{}}, {start: {_id:1140}, end: {_id:1131}, properties:{}}, {start: {_id:1141}, end: {_id:1130}, properties:{}}, {start: {_id:1141}, end: {_id:1131}, properties:{}}, {start: {_id:1142}, end: {_id:1132}, properties:{}}, {start: {_id:1142}, end: {_id:1133}, properties:{}}, {start: {_id:1197}, end: {_id:1132}, properties:{}}, {start: {_id:1197}, end: {_id:1133}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1166}, end: {_id:1160}, properties:{}}, {start: {_id:1167}, end: {_id:1160}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1125}, end: {_id:1192}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:1188}, end: {_id:1163}, properties:{}}, {start: {_id:1189}, end: {_id:1164}, properties:{}}, {start: {_id:1190}, end: {_id:1166}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:1125}, end: {_id:1183}, properties:{}}, {start: {_id:1125}, end: {_id:1184}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:1134}, end: {_id:1161}, properties:{}}, {start: {_id:1134}, end: {_id:1162}, properties:{}}, {start: {_id:1135}, end: {_id:1162}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1156}, end: {_id:1136}, properties:{}}, {start: {_id:1157}, end: {_id:1137}, properties:{}}, {start: {_id:1158}, end: {_id:1137}, properties:{}}, {start: {_id:1159}, end: {_id:1137}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1138}, end: {_id:1148}, properties:{}}, {start: {_id:1139}, end: {_id:1149}, properties:{}}, {start: {_id:1140}, end: {_id:1148}, properties:{}}, {start: {_id:1141}, end: {_id:1149}, properties:{}}, {start: {_id:1142}, end: {_id:1151}, properties:{}}, {start: {_id:1197}, end: {_id:1150}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;