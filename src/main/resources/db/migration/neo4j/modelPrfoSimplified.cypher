// BORRAR TODO
MATCH (n)
DETACH DELETE n;

// CREAR TODO
CREATE
// Organizaciones
(profesores:Organization { name: "Profesores", code: "PROF" }),
(alumnos:Organization { name: "Alumnos", code: "ALUM" }),

// Cadena Faceted
(chainFaceted:Chain:ChainFaceted { name: "Faceted Chain", version: "1", description: "Cadena de tipo faceted", ownershipType: "STATE" }),

// Equipos
(grupoProfesores:Team { name: "Grupo Profesores", specialization: "FunctionalUser" }),
(grupo1:Team { name: "Grupo 1", specialization: "ITUser" }),

// Asociación equipos ↔ organizaciones
(profesores)-[:TEAM]->(grupoProfesores),
(alumnos)-[:TEAM]->(grupo1),

// Organizaciones ↔ cadena
(profesores)-[:BELONGS_TO]->(chainFaceted),
(alumnos)-[:BELONGS_TO]->(chainFaceted),

// Personas
(julio:Person { name: "julio", firstName: "Julio", lastName: "", email: "julio@us.es", phone: "", password: "1234" }),
(pedro:Person { name: "pedro", firstName: "Pedro", lastName: "", email: "pedro@alum.us.es", phone: "", password: "1234" }),
(juan:Person { name: "juan", firstName: "Juan", lastName: "", email: "juan@alum.us.es", phone: "", password: "1234" }),
(paula:Person { name: "paula", firstName: "Paula", lastName: "", email: "paula@alum.us.es", phone: "", password: "1234" }),

// Personas ↔ equipos
(grupoProfesores)-[:MEMBER]->(julio),
(grupo1)-[:MEMBER]->(pedro),
(grupo1)-[:MEMBER]->(juan),
(grupo1)-[:MEMBER]->(paula),

// Roles
(profesor:Role { name: "Profesor" }),
(alumno:Role { name: "Alumno" }),
(julio)-[:ROLE]->(profesor),
(pedro)-[:ROLE]->(alumno),
(juan)-[:ROLE]->(alumno),
(paula)-[:ROLE]->(alumno),

// Servicio
(servicioAlumnos:ServiceOrg { name: "Servicio de Alumnos", description: "Servicio de los alumnos del grupo 2" }),
(servicioAlumnos)-[:TEAM]->(grupo1),
(alumnos)-[:SERVICE]->(servicioAlumnos),

// SLA y Scope
(slaAlumnos:Sla { name: "ServicioAlumnosSla" }),
(scope:Scope { name: "Alcance General" }),
(slaAlumnos)-[:GUARANTEE]->(scope),

// Objetivos dentro del scope
(ttr:Objective { name: "Alcance General TTR", metric: "TTR", value: 48.0, unit: "HOUR" }),
(tto:Objective { name: "Alcance General TTO", metric: "TTO", value: 48.0, unit: "HOUR" }),
(scope)-[:OBJECTIVE]->(ttr),
(scope)-[:OBJECTIVE]->(tto),

// Cliente asociado a SLA
(customerProfesores:Customer { name: "AlumnosServiceCustomer_1" }),
(customerProfesores)-[:ORGANIZATION]->(profesores),
(customerProfesores)-[:SLA]->(slaAlumnos),
(servicioAlumnos)-[:CUSTOMER]->(customerProfesores),

// Status y Tipos de petición
(statusNew:Status { name: "New" }),
(incident:RequestType { name: "Incident" }),
(userRequest:RequestType { name: "User Request" }),

(scope)-[:REQUEST_TYPE]->(incident),
(scope)-[:REQUEST_TYPE]->(userRequest),

// Issues
(issue1:Issue { createdAt: localdatetime("2025-04-16T10:20:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Error de plataforma", description: "No se puede acceder a la plataforma educativa", title: "Plataforma caída", TTO: 90094.0 }),
(issue2:Issue { createdAt: localdatetime("2025-04-15T15:45:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema con calificaciones", description: "Las calificaciones no se muestran correctamente", title: "Error en notas", TTO: 145034.0 }),
(issue3:Issue { createdAt: localdatetime("2025-04-10T08:00:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Imposible subir tarea", description: "No se pueden subir archivos a la tarea final", title: "Error subida tarea", TTO: 620534.0 }),
(issue4:Issue { createdAt: localdatetime("2025-04-01T12:30:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Cuenta bloqueada", description: "Un alumno no puede acceder a su cuenta", title: "Acceso bloqueado", TTO: 1376334.0 }),
(issue5:Issue { createdAt: localdatetime("2025-03-20T09:00:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema de matrícula", description: "Error al actualizar datos de matrícula", title: "Fallo matrícula", TTO: 2407134.0 }),
(issue6:Issue { createdAt: localdatetime("2025-04-12T14:10:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema de acceso al aula virtual", description: "Algunos usuarios no pueden entrar al aula virtual", title: "Acceso aula virtual", TTO: 415734.0 }),
(issue7:Issue { createdAt: localdatetime("2025-04-08T19:30:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Caída del sistema de correos", description: "El servicio de correo institucional está fuera de línea", title: "Correo caído", TTO: 710034.0 }),
(issue8:Issue { createdAt: localdatetime("2025-04-05T08:50:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Error en notificaciones", description: "Las notificaciones no están llegando a los alumnos", title: "Fallo en notificaciones", TTO: 1009734.0 }),
(issue9:Issue { createdAt: localdatetime("2025-03-29T17:25:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problemas en videollamadas", description: "Se interrumpen las videollamadas en la plataforma", title: "Fallos en videollamadas", TTO: 1570134.0 }),
(issue10:Issue { createdAt: localdatetime("2025-03-15T10:00:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Error de sincronización", description: "Problemas sincronizando datos entre aplicaciones", title: "Sincronización fallida", TTO: 2594334.0 }),
(issue11:Issue { createdAt: localdatetime("2025-03-05T09:40:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema de autenticación", description: "Usuarios no pueden autenticarse con su contraseña", title: "Error de login", TTO: 3455934.0 }),
(issue12:Issue { createdAt: localdatetime("2025-02-25T11:15:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Fallo en carga de documentos", description: "Los documentos no se cargan correctamente en la plataforma", title: "Error documentos", TTO: 4311534.0 }),

// Issues ↔ Tipos
(issue1)-[:REQUEST_TYPE]->(incident),
(issue2)-[:REQUEST_TYPE]->(userRequest),
(issue3)-[:REQUEST_TYPE]->(incident),
(issue4)-[:REQUEST_TYPE]->(userRequest),
(issue5)-[:REQUEST_TYPE]->(incident),
(issue6)-[:REQUEST_TYPE]->(userRequest),
(issue7)-[:REQUEST_TYPE]->(incident),
(issue8)-[:REQUEST_TYPE]->(incident),
(issue9)-[:REQUEST_TYPE]->(userRequest),
(issue10)-[:REQUEST_TYPE]->(incident),
(issue11)-[:REQUEST_TYPE]->(userRequest),
(issue12)-[:REQUEST_TYPE]->(incident),

// Issues ↔ Persona creadora
(issue1)-[:CREATED_BY]->(julio),
(issue2)-[:CREATED_BY]->(julio),
(issue3)-[:CREATED_BY]->(julio),
(issue4)-[:CREATED_BY]->(julio),
(issue5)-[:CREATED_BY]->(julio),
(issue6)-[:CREATED_BY]->(julio),
(issue7)-[:CREATED_BY]->(julio),
(issue8)-[:CREATED_BY]->(julio),
(issue9)-[:CREATED_BY]->(julio),
(issue10)-[:CREATED_BY]->(julio),
(issue11)-[:CREATED_BY]->(julio),
(issue12)-[:CREATED_BY]->(julio),

// Issues ↔ Status
(issue1)-[:STATUS]->(statusNew),
(issue2)-[:STATUS]->(statusNew),
(issue3)-[:STATUS]->(statusNew),
(issue4)-[:STATUS]->(statusNew),
(issue5)-[:STATUS]->(statusNew),
(issue6)-[:STATUS]->(statusNew),
(issue7)-[:STATUS]->(statusNew),
(issue8)-[:STATUS]->(statusNew),
(issue9)-[:STATUS]->(statusNew),
(issue10)-[:STATUS]->(statusNew),
(issue11)-[:STATUS]->(statusNew),
(issue12)-[:STATUS]->(statusNew),

// Issues ↔ Servicio
(issue1)-[:SERVICE]->(servicioAlumnos),
(issue2)-[:SERVICE]->(servicioAlumnos),
(issue3)-[:SERVICE]->(servicioAlumnos),
(issue4)-[:SERVICE]->(servicioAlumnos),
(issue5)-[:SERVICE]->(servicioAlumnos),
(issue6)-[:SERVICE]->(servicioAlumnos),
(issue7)-[:SERVICE]->(servicioAlumnos),
(issue8)-[:SERVICE]->(servicioAlumnos),
(issue9)-[:SERVICE]->(servicioAlumnos),
(issue10)-[:SERVICE]->(servicioAlumnos),
(issue11)-[:SERVICE]->(servicioAlumnos),
(issue12)-[:SERVICE]->(servicioAlumnos);
