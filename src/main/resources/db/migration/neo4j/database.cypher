MATCH(n) DETACH DELETE n;
DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:2001, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:2002, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:2003, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:2004, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:2005, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:2006, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:2007, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}, {_id:2008, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", value:48.0}}, {_id:2009, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", value:48.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:2010, properties:{name:"Revisor"}}, {_id:2011, properties:{name:"Fabricante"}}, {_id:2012, properties:{name:"Profesor"}}, {_id:2013, properties:{name:"Alumno"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:2014, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:2015, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:2016, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:2017, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}, {_id:2018, properties:{name:"Alcance General User request", priority:"LOW"}}, {_id:2019, properties:{name:"Alcance general Incident", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:2020, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:2021, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:2022, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}, {_id:2023, properties:{name:"Grupo Profesores", specialization:"FunctionalUser"}}, {_id:2024, properties:{name:"Grupo 1", specialization:"ITUser"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:2025, properties:{name:"Pieza de defensa"}}, {_id:2026, properties:{name:"Pieza de Uso comercial"}}, {_id:2027, properties:{name:"Incident"}}, {_id:2028, properties:{name:"User Request"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:2029, properties:{lastName:"López", firstName:"Rocío", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:2030, properties:{lastName:"Romero", firstName:"Raquel", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:2031, properties:{lastName:"Gómez", firstName:"Rubén", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:2032, properties:{lastName:"Suárez", firstName:"Fran", phone:"654654654", name:"franito", email:"franito@gmail.com"}}, {_id:2033, properties:{lastName:"", firstName:"Julio", password:"1234", phone:"", name:"julio", email:"julio@us.es"}}, {_id:2034, properties:{lastName:"", firstName:"Pedro", password:"1234", phone:"", name:"pedro", email:"pedro@alum.us.es"}}, {_id:2035, properties:{lastName:"", firstName:"Juan", password:"1234", phone:"", name:"juan", email:"juan@alum.us.es"}}, {_id:2036, properties:{lastName:"", firstName:"Paula", password:"1234", phone:"", name:"paula", email:"paula@alum.us.es"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:2037, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:2038, properties:{name:"Revisar pieza"}}, {_id:2039, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:2040, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:2041, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:2042, properties:{code:"RDP", name:"Revisora de piezas S.A"}}, {_id:2043, properties:{code:"PROF", name:"Profesores"}}, {_id:2044, properties:{code:"ALUM", name:"Alumnos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:2045, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:49:45.1042723'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-21T11:49:45.1042723'), title:"Plataforma caída", closedAt:localdatetime('2025-04-21T11:49:45.1042723'), TTO:478278.0}}, {_id:2046, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:55:04.9371147'), TTR:50.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-21T11:55:04.9371147'), title:"Error en notas", closedAt:localdatetime('2025-04-21T11:55:04.9371147'), TTO:533537.0}}, {_id:2047, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error subida tarea", TTO:620534.0}}, {_id:2048, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso bloqueado", TTO:1376334.0}}, {_id:2049, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo matrícula", TTO:2407134.0}}, {_id:2050, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:06.1645076'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-21T11:58:06.1645076'), title:"Acceso aula virtual", TTO:804420.0}}, {_id:2051, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:30.3118271'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-21T11:58:30.3118271'), title:"Correo caído", TTO:1098744.0}}, {_id:2052, properties:{TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-21T12:03:39.5893836'), title:"Fallo en notificaciones", TTO:1398753.0}}, {_id:2053, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:2054, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:04:21.6649559'), TTR:21.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-21T12:04:21.6649559'), title:"Sincronización fallida", closedAt:localdatetime('2025-04-21T12:04:21.6649559'), TTO:2983394.0}}, {_id:2055, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error de login", TTO:3455934.0}}, {_id:2056, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error documentos", TTO:4311534.0}}, {_id:2074, properties:{createdAt:localdatetime('2025-04-21T12:09:57.6391491'), TTR:0.0, name:"Revisión de ala derecha the EuroFighter", description:"Necesitamos revisar el ala derecha del Eurofighter 450-XDSW", title:"Revisión de ala derecha the EuroFighter", TTO:0.0}}, {_id:2075, properties:{TTR:0.0, name:"Asientos de pasajero Boeing 737", description:"Necesitamos que revisen estos asientos: F12, F36, F18 y F29 ", lastAssignedAt:localdatetime('2025-04-21T12:14:52.8513009'), title:"Revisión de los asientos del Boeing 737 AZWWED-424", TTO:178.0}}, {_id:2076, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:19:38.8621162'), TTR:27.0, name:"Tren de aterrizaje", description:"Deberían revisar el tren de aterrizaje ", lastAssignedAt:localdatetime('2025-04-21T12:19:38.8621162'), title:"Revisión del tren de aterrizaje para el avión B-2463-XEFDW", closedAt:localdatetime('2025-04-21T12:19:38.8621162'), TTO:104.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:2057, properties:{name:"Nueva petición", id:1}}, {_id:2058, properties:{name:"Pendiente de revisión"}}, {_id:2059, properties:{name:"Revisión en curso"}}, {_id:2060, properties:{name:"Revisión exitosa"}}, {_id:2061, properties:{name:"Revisión fallida"}}, {_id:2062, properties:{name:"New"}}, {_id:2063, properties:{name:"Gestionándose"}}, {_id:2064, properties:{name:"Cerrada"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:2065, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:2066, properties:{name:"ServicioDeRevisiónCustomer_1"}}, {_id:2067, properties:{name:"AlumnosServiceCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:2068, properties:{name:"SLA control de calidad"}}, {_id:2069, properties:{name:"SLA análisis"}}, {_id:2070, properties:{name:"ServicioAlumnosSla"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:2071, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:2072, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}, {_id:2073, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:2068}, end: {_id:2014}, properties:{}}, {start: {_id:2068}, end: {_id:2015}, properties:{}}, {start: {_id:2069}, end: {_id:2016}, properties:{}}, {start: {_id:2069}, end: {_id:2017}, properties:{}}, {start: {_id:2070}, end: {_id:2018}, properties:{}}, {start: {_id:2070}, end: {_id:2019}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2071}, end: {_id:2025}, properties:{}}, {start: {_id:2071}, end: {_id:2026}, properties:{}}, {start: {_id:2072}, end: {_id:2025}, properties:{}}, {start: {_id:2072}, end: {_id:2026}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2045}, end: {_id:2027}, properties:{}}, {start: {_id:2046}, end: {_id:2028}, properties:{}}, {start: {_id:2047}, end: {_id:2027}, properties:{}}, {start: {_id:2048}, end: {_id:2028}, properties:{}}, {start: {_id:2049}, end: {_id:2027}, properties:{}}, {start: {_id:2050}, end: {_id:2028}, properties:{}}, {start: {_id:2051}, end: {_id:2027}, properties:{}}, {start: {_id:2052}, end: {_id:2027}, properties:{}}, {start: {_id:2053}, end: {_id:2028}, properties:{}}, {start: {_id:2054}, end: {_id:2027}, properties:{}}, {start: {_id:2055}, end: {_id:2028}, properties:{}}, {start: {_id:2056}, end: {_id:2027}, properties:{}}, {start: {_id:2074}, end: {_id:2025}, properties:{}}, {start: {_id:2075}, end: {_id:2026}, properties:{}}, {start: {_id:2076}, end: {_id:2025}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2071}, end: {_id:2065}, properties:{}}, {start: {_id:2072}, end: {_id:2066}, properties:{}}, {start: {_id:2073}, end: {_id:2067}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:2020}, end: {_id:2010}, properties:{}}, {start: {_id:2021}, end: {_id:2010}, properties:{}}, {start: {_id:2022}, end: {_id:2011}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2045}, end: {_id:2064}, properties:{}}, {start: {_id:2046}, end: {_id:2064}, properties:{}}, {start: {_id:2047}, end: {_id:2062}, properties:{}}, {start: {_id:2048}, end: {_id:2062}, properties:{}}, {start: {_id:2049}, end: {_id:2062}, properties:{}}, {start: {_id:2050}, end: {_id:2063}, properties:{}}, {start: {_id:2051}, end: {_id:2063}, properties:{}}, {start: {_id:2052}, end: {_id:2062}, properties:{}}, {start: {_id:2053}, end: {_id:2062}, properties:{}}, {start: {_id:2054}, end: {_id:2064}, properties:{}}, {start: {_id:2055}, end: {_id:2062}, properties:{}}, {start: {_id:2056}, end: {_id:2062}, properties:{}}, {start: {_id:2074}, end: {_id:2058}, properties:{}}, {start: {_id:2075}, end: {_id:2058}, properties:{}}, {start: {_id:2076}, end: {_id:2060}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:2057}, end: {_id:2058}, properties:{}}, {start: {_id:2058}, end: {_id:2059}, properties:{}}, {start: {_id:2059}, end: {_id:2060}, properties:{}}, {start: {_id:2059}, end: {_id:2061}, properties:{}}, {start: {_id:2062}, end: {_id:2063}, properties:{}}, {start: {_id:2063}, end: {_id:2064}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:2065}, end: {_id:2069}, properties:{}}, {start: {_id:2066}, end: {_id:2068}, properties:{}}, {start: {_id:2067}, end: {_id:2070}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:2071}, end: {_id:2021}, properties:{}}, {start: {_id:2072}, end: {_id:2020}, properties:{}}, {start: {_id:2073}, end: {_id:2024}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:2040}, end: {_id:2001}, properties:{}}, {start: {_id:2041}, end: {_id:2001}, properties:{}}, {start: {_id:2042}, end: {_id:2001}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:2045}, end: {_id:2024}, properties:{}}, {start: {_id:2046}, end: {_id:2024}, properties:{}}, {start: {_id:2050}, end: {_id:2024}, properties:{}}, {start: {_id:2052}, end: {_id:2024}, properties:{}}, {start: {_id:2054}, end: {_id:2024}, properties:{}}, {start: {_id:2075}, end: {_id:2021}, properties:{}}, {start: {_id:2076}, end: {_id:2020}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:2020}, end: {_id:2029}, properties:{}}, {start: {_id:2020}, end: {_id:2030}, properties:{}}, {start: {_id:2021}, end: {_id:2031}, properties:{}}, {start: {_id:2022}, end: {_id:2032}, properties:{}}, {start: {_id:2023}, end: {_id:2033}, properties:{}}, {start: {_id:2024}, end: {_id:2034}, properties:{}}, {start: {_id:2024}, end: {_id:2035}, properties:{}}, {start: {_id:2024}, end: {_id:2036}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:2071}, end: {_id:2058}, properties:{}}, {start: {_id:2072}, end: {_id:2059}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:2001}, end: {_id:2058}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:2045}, end: {_id:2033}, properties:{}}, {start: {_id:2046}, end: {_id:2033}, properties:{}}, {start: {_id:2047}, end: {_id:2033}, properties:{}}, {start: {_id:2048}, end: {_id:2033}, properties:{}}, {start: {_id:2049}, end: {_id:2033}, properties:{}}, {start: {_id:2050}, end: {_id:2033}, properties:{}}, {start: {_id:2051}, end: {_id:2033}, properties:{}}, {start: {_id:2052}, end: {_id:2033}, properties:{}}, {start: {_id:2053}, end: {_id:2033}, properties:{}}, {start: {_id:2054}, end: {_id:2033}, properties:{}}, {start: {_id:2055}, end: {_id:2033}, properties:{}}, {start: {_id:2056}, end: {_id:2033}, properties:{}}, {start: {_id:2074}, end: {_id:2032}, properties:{}}, {start: {_id:2075}, end: {_id:2032}, properties:{}}, {start: {_id:2076}, end: {_id:2032}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:2041}, end: {_id:2071}, properties:{}}, {start: {_id:2044}, end: {_id:2073}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2045}, end: {_id:2035}, properties:{}}, {start: {_id:2046}, end: {_id:2035}, properties:{}}, {start: {_id:2050}, end: {_id:2034}, properties:{}}, {start: {_id:2052}, end: {_id:2036}, properties:{}}, {start: {_id:2054}, end: {_id:2036}, properties:{}}, {start: {_id:2075}, end: {_id:2031}, properties:{}}, {start: {_id:2076}, end: {_id:2030}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASSIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:2029}, end: {_id:2010}, properties:{}}, {start: {_id:2030}, end: {_id:2010}, properties:{}}, {start: {_id:2031}, end: {_id:2010}, properties:{}}, {start: {_id:2032}, end: {_id:2011}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:2045}, end: {_id:2073}, properties:{}}, {start: {_id:2046}, end: {_id:2073}, properties:{}}, {start: {_id:2047}, end: {_id:2073}, properties:{}}, {start: {_id:2048}, end: {_id:2073}, properties:{}}, {start: {_id:2049}, end: {_id:2073}, properties:{}}, {start: {_id:2050}, end: {_id:2073}, properties:{}}, {start: {_id:2051}, end: {_id:2073}, properties:{}}, {start: {_id:2052}, end: {_id:2073}, properties:{}}, {start: {_id:2053}, end: {_id:2073}, properties:{}}, {start: {_id:2054}, end: {_id:2073}, properties:{}}, {start: {_id:2055}, end: {_id:2073}, properties:{}}, {start: {_id:2056}, end: {_id:2073}, properties:{}}, {start: {_id:2074}, end: {_id:2071}, properties:{}}, {start: {_id:2075}, end: {_id:2071}, properties:{}}, {start: {_id:2076}, end: {_id:2071}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2040}, end: {_id:2022}, properties:{}}, {start: {_id:2041}, end: {_id:2021}, properties:{}}, {start: {_id:2042}, end: {_id:2020}, properties:{}}, {start: {_id:2043}, end: {_id:2023}, properties:{}}, {start: {_id:2044}, end: {_id:2024}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:2014}, end: {_id:2002}, properties:{}}, {start: {_id:2014}, end: {_id:2003}, properties:{}}, {start: {_id:2015}, end: {_id:2004}, properties:{}}, {start: {_id:2015}, end: {_id:2005}, properties:{}}, {start: {_id:2016}, end: {_id:2006}, properties:{}}, {start: {_id:2016}, end: {_id:2007}, properties:{}}, {start: {_id:2017}, end: {_id:2006}, properties:{}}, {start: {_id:2017}, end: {_id:2007}, properties:{}}, {start: {_id:2018}, end: {_id:2008}, properties:{}}, {start: {_id:2018}, end: {_id:2009}, properties:{}}, {start: {_id:2019}, end: {_id:2008}, properties:{}}, {start: {_id:2019}, end: {_id:2009}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2043}, end: {_id:2037}, properties:{}}, {start: {_id:2044}, end: {_id:2037}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:2001}, end: {_id:2069}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:2065}, end: {_id:2040}, properties:{}}, {start: {_id:2066}, end: {_id:2041}, properties:{}}, {start: {_id:2067}, end: {_id:2043}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:2001}, end: {_id:2060}, properties:{}}, {start: {_id:2001}, end: {_id:2061}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:2010}, end: {_id:2038}, properties:{}}, {start: {_id:2010}, end: {_id:2039}, properties:{}}, {start: {_id:2011}, end: {_id:2039}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2033}, end: {_id:2012}, properties:{}}, {start: {_id:2034}, end: {_id:2013}, properties:{}}, {start: {_id:2035}, end: {_id:2013}, properties:{}}, {start: {_id:2036}, end: {_id:2013}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:2014}, end: {_id:2025}, properties:{}}, {start: {_id:2015}, end: {_id:2026}, properties:{}}, {start: {_id:2016}, end: {_id:2025}, properties:{}}, {start: {_id:2017}, end: {_id:2026}, properties:{}}, {start: {_id:2018}, end: {_id:2028}, properties:{}}, {start: {_id:2019}, end: {_id:2027}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;