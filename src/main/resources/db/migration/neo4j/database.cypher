MATCH(n) DETACH DELETE n;
DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:981, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:982, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:983, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:984, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:985, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:986, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:987, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}, {_id:988, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", value:48.0}}, {_id:989, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", value:48.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:990, properties:{name:"Revisor"}}, {_id:991, properties:{name:"Fabricante"}}, {_id:992, properties:{name:"Profesor"}}, {_id:993, properties:{name:"Alumno"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:994, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:995, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:996, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:997, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}, {_id:998, properties:{name:"Alcance General"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:999, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:1000, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:1001, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}, {_id:1002, properties:{name:"Grupo Profesores", specialization:"FunctionalUser"}}, {_id:1003, properties:{name:"Grupo 1", specialization:"ITUser"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:1004, properties:{name:"Pieza de defensa"}}, {_id:1005, properties:{name:"Pieza de Uso comercial"}}, {_id:1006, properties:{name:"Incident"}}, {_id:1007, properties:{name:"User Request"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:1008, properties:{lastName:"López", firstName:"Rocío", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:1009, properties:{lastName:"Romero", firstName:"Raquel", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:1010, properties:{lastName:"Gómez", firstName:"Rubén", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:1011, properties:{lastName:"Suárez", firstName:"Fran", phone:"654654654", name:"franito", email:"franito@gmail.com"}}, {_id:1012, properties:{lastName:"", firstName:"Julio", password:"1234", phone:"", name:"julio", email:"julio@us.es"}}, {_id:1013, properties:{lastName:"", firstName:"Pedro", password:"1234", phone:"", name:"pedro", email:"pedro@alum.us.es"}}, {_id:1014, properties:{lastName:"", firstName:"Juan", password:"1234", phone:"", name:"juan", email:"juan@alum.us.es"}}, {_id:1015, properties:{lastName:"", firstName:"Paula", password:"1234", phone:"", name:"paula", email:"paula@alum.us.es"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1016, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:1017, properties:{name:"Revisar pieza"}}, {_id:1018, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:1019, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:1020, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:1021, properties:{code:"RDP", name:"Revisora de piezas S.A"}}, {_id:1022, properties:{code:"PROF", name:"Profesores"}}, {_id:1023, properties:{code:"ALUM", name:"Alumnos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:1024, properties:{createdAt:localdatetime('2025-04-16T10:20:00'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Plataforma caída", TTO:90094.0}}, {_id:1025, properties:{createdAt:localdatetime('2025-04-15T15:45:00'), TTR:0.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error en notas", TTO:145034.0}}, {_id:1026, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error subida tarea", TTO:620534.0}}, {_id:1027, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso bloqueado", TTO:1376334.0}}, {_id:1028, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo matrícula", TTO:2407134.0}}, {_id:1029, properties:{createdAt:localdatetime('2025-04-12T14:10:00'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso aula virtual", TTO:415734.0}}, {_id:1030, properties:{createdAt:localdatetime('2025-04-08T19:30:00'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Correo caído", TTO:710034.0}}, {_id:1031, properties:{createdAt:localdatetime('2025-04-05T08:50:00'), TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo en notificaciones", TTO:1009734.0}}, {_id:1032, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:1033, properties:{createdAt:localdatetime('2025-03-15T10:00:00'), TTR:0.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Sincronización fallida", TTO:2594334.0}}, {_id:1034, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error de login", TTO:3455934.0}}, {_id:1035, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error documentos", TTO:4311534.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:1036, properties:{name:"Nueva petición", id:1}}, {_id:1037, properties:{name:"Pendiente de revisión"}}, {_id:1038, properties:{name:"Revisión en curso"}}, {_id:1039, properties:{name:"Revisión exitosa"}}, {_id:1040, properties:{name:"Revisión fallida"}}, {_id:1041, properties:{name:"New"}}, {_id:1042, properties:{name:"Gestionándose"}}, {_id:1043, properties:{name:"Cerrada"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:1044, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:1045, properties:{name:"ServicioDeRevisiónCustomer_1"}}, {_id:1046, properties:{name:"AlumnosServiceCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:1047, properties:{name:"SLA control de calidad"}}, {_id:1048, properties:{name:"SLA análisis"}}, {_id:1049, properties:{name:"ServicioAlumnosSla"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:1050, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:1051, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}, {_id:1052, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:1047}, end: {_id:994}, properties:{}}, {start: {_id:1047}, end: {_id:995}, properties:{}}, {start: {_id:1048}, end: {_id:996}, properties:{}}, {start: {_id:1048}, end: {_id:997}, properties:{}}, {start: {_id:1049}, end: {_id:998}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1050}, end: {_id:1004}, properties:{}}, {start: {_id:1050}, end: {_id:1005}, properties:{}}, {start: {_id:1051}, end: {_id:1004}, properties:{}}, {start: {_id:1051}, end: {_id:1005}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1024}, end: {_id:1006}, properties:{}}, {start: {_id:1025}, end: {_id:1007}, properties:{}}, {start: {_id:1026}, end: {_id:1006}, properties:{}}, {start: {_id:1027}, end: {_id:1007}, properties:{}}, {start: {_id:1028}, end: {_id:1006}, properties:{}}, {start: {_id:1029}, end: {_id:1007}, properties:{}}, {start: {_id:1030}, end: {_id:1006}, properties:{}}, {start: {_id:1031}, end: {_id:1006}, properties:{}}, {start: {_id:1032}, end: {_id:1007}, properties:{}}, {start: {_id:1033}, end: {_id:1006}, properties:{}}, {start: {_id:1034}, end: {_id:1007}, properties:{}}, {start: {_id:1035}, end: {_id:1006}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1050}, end: {_id:1044}, properties:{}}, {start: {_id:1051}, end: {_id:1045}, properties:{}}, {start: {_id:1052}, end: {_id:1046}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:999}, end: {_id:990}, properties:{}}, {start: {_id:1000}, end: {_id:990}, properties:{}}, {start: {_id:1001}, end: {_id:991}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1024}, end: {_id:1041}, properties:{}}, {start: {_id:1025}, end: {_id:1041}, properties:{}}, {start: {_id:1026}, end: {_id:1041}, properties:{}}, {start: {_id:1027}, end: {_id:1041}, properties:{}}, {start: {_id:1028}, end: {_id:1041}, properties:{}}, {start: {_id:1029}, end: {_id:1041}, properties:{}}, {start: {_id:1030}, end: {_id:1041}, properties:{}}, {start: {_id:1031}, end: {_id:1041}, properties:{}}, {start: {_id:1032}, end: {_id:1041}, properties:{}}, {start: {_id:1033}, end: {_id:1041}, properties:{}}, {start: {_id:1034}, end: {_id:1041}, properties:{}}, {start: {_id:1035}, end: {_id:1041}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1036}, end: {_id:1037}, properties:{}}, {start: {_id:1037}, end: {_id:1038}, properties:{}}, {start: {_id:1038}, end: {_id:1039}, properties:{}}, {start: {_id:1038}, end: {_id:1040}, properties:{}}, {start: {_id:1041}, end: {_id:1042}, properties:{}}, {start: {_id:1042}, end: {_id:1043}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1044}, end: {_id:1048}, properties:{}}, {start: {_id:1045}, end: {_id:1047}, properties:{}}, {start: {_id:1046}, end: {_id:1049}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:1050}, end: {_id:1000}, properties:{}}, {start: {_id:1051}, end: {_id:999}, properties:{}}, {start: {_id:1052}, end: {_id:1003}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:1019}, end: {_id:981}, properties:{}}, {start: {_id:1020}, end: {_id:981}, properties:{}}, {start: {_id:1021}, end: {_id:981}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:999}, end: {_id:1008}, properties:{}}, {start: {_id:999}, end: {_id:1009}, properties:{}}, {start: {_id:1000}, end: {_id:1010}, properties:{}}, {start: {_id:1001}, end: {_id:1011}, properties:{}}, {start: {_id:1002}, end: {_id:1012}, properties:{}}, {start: {_id:1003}, end: {_id:1013}, properties:{}}, {start: {_id:1003}, end: {_id:1014}, properties:{}}, {start: {_id:1003}, end: {_id:1015}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:1050}, end: {_id:1037}, properties:{}}, {start: {_id:1051}, end: {_id:1038}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:981}, end: {_id:1037}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:1024}, end: {_id:1012}, properties:{}}, {start: {_id:1025}, end: {_id:1012}, properties:{}}, {start: {_id:1026}, end: {_id:1012}, properties:{}}, {start: {_id:1027}, end: {_id:1012}, properties:{}}, {start: {_id:1028}, end: {_id:1012}, properties:{}}, {start: {_id:1029}, end: {_id:1012}, properties:{}}, {start: {_id:1030}, end: {_id:1012}, properties:{}}, {start: {_id:1031}, end: {_id:1012}, properties:{}}, {start: {_id:1032}, end: {_id:1012}, properties:{}}, {start: {_id:1033}, end: {_id:1012}, properties:{}}, {start: {_id:1034}, end: {_id:1012}, properties:{}}, {start: {_id:1035}, end: {_id:1012}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:1020}, end: {_id:1050}, properties:{}}, {start: {_id:1023}, end: {_id:1052}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1008}, end: {_id:990}, properties:{}}, {start: {_id:1009}, end: {_id:990}, properties:{}}, {start: {_id:1010}, end: {_id:990}, properties:{}}, {start: {_id:1011}, end: {_id:991}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:1024}, end: {_id:1052}, properties:{}}, {start: {_id:1025}, end: {_id:1052}, properties:{}}, {start: {_id:1026}, end: {_id:1052}, properties:{}}, {start: {_id:1027}, end: {_id:1052}, properties:{}}, {start: {_id:1028}, end: {_id:1052}, properties:{}}, {start: {_id:1029}, end: {_id:1052}, properties:{}}, {start: {_id:1030}, end: {_id:1052}, properties:{}}, {start: {_id:1031}, end: {_id:1052}, properties:{}}, {start: {_id:1032}, end: {_id:1052}, properties:{}}, {start: {_id:1033}, end: {_id:1052}, properties:{}}, {start: {_id:1034}, end: {_id:1052}, properties:{}}, {start: {_id:1035}, end: {_id:1052}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1019}, end: {_id:1001}, properties:{}}, {start: {_id:1020}, end: {_id:1000}, properties:{}}, {start: {_id:1021}, end: {_id:999}, properties:{}}, {start: {_id:1022}, end: {_id:1002}, properties:{}}, {start: {_id:1023}, end: {_id:1003}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:994}, end: {_id:982}, properties:{}}, {start: {_id:994}, end: {_id:983}, properties:{}}, {start: {_id:995}, end: {_id:984}, properties:{}}, {start: {_id:995}, end: {_id:985}, properties:{}}, {start: {_id:996}, end: {_id:986}, properties:{}}, {start: {_id:996}, end: {_id:987}, properties:{}}, {start: {_id:997}, end: {_id:986}, properties:{}}, {start: {_id:997}, end: {_id:987}, properties:{}}, {start: {_id:998}, end: {_id:988}, properties:{}}, {start: {_id:998}, end: {_id:989}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1022}, end: {_id:1016}, properties:{}}, {start: {_id:1023}, end: {_id:1016}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:981}, end: {_id:1048}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:1044}, end: {_id:1019}, properties:{}}, {start: {_id:1045}, end: {_id:1020}, properties:{}}, {start: {_id:1046}, end: {_id:1022}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:981}, end: {_id:1039}, properties:{}}, {start: {_id:981}, end: {_id:1040}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:990}, end: {_id:1017}, properties:{}}, {start: {_id:990}, end: {_id:1018}, properties:{}}, {start: {_id:991}, end: {_id:1018}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1012}, end: {_id:992}, properties:{}}, {start: {_id:1013}, end: {_id:993}, properties:{}}, {start: {_id:1014}, end: {_id:993}, properties:{}}, {start: {_id:1015}, end: {_id:993}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:994}, end: {_id:1004}, properties:{}}, {start: {_id:995}, end: {_id:1005}, properties:{}}, {start: {_id:996}, end: {_id:1004}, properties:{}}, {start: {_id:997}, end: {_id:1005}, properties:{}}, {start: {_id:998}, end: {_id:1006}, properties:{}}, {start: {_id:998}, end: {_id:1007}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;