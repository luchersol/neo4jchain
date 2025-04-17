// BORRAR TODO
MATCH (n)
DETACH DELETE n;

// CREAR TODO
CREATE
// Organizaciones
(profesores:Organization { id: 1, name: "Profesores", code: "PROF" }),
(alumnos:Organization { id: 2, name: "Alumnos", code: "ALUM" }),

// Cadena Faceted
(chainFaceted:Chain:ChainFaceted { id: 1, name: "Faceted Chain", version: "1", description: "Cadena de tipo faceted", ownershipType: "STATE" }),

// Equipos
(grupoProfesores:Team { id: 1, name: "Grupo Profesores", specialization: "FunctionalUser" }),
(grupo1:Team { id: 2, name: "Grupo 1", specialization: "ITUser" }),

// Asociación equipos ↔ organizaciones
(profesores)-[:TEAM]->(grupoProfesores),
(alumnos)-[:TEAM]->(grupo1),

// Organizaciones ↔ cadena
(profesores)-[:BELONGS_TO]->(chainFaceted),
(alumnos)-[:BELONGS_TO]->(chainFaceted),

// Personas
(julio:Person { id: 1, name: "julio", firstName: "Julio", lastName: "", email: "julio@us.es", phone: "", password: "1234" }),
(pedro:Person { id: 2, name: "pedro", firstName: "Pedro", lastName: "", email: "pedro@alum.us.es", phone: "", password: "1234" }),
(juan:Person { id: 3, name: "juan", firstName: "Juan", lastName: "", email: "juan@alum.us.es", phone: "", password: "1234" }),
(paula:Person { id: 4, name: "paula", firstName: "Paula", lastName: "", email: "paula@alum.us.es", phone: "", password: "1234" }),

// Personas ↔ equipos
(julio)-[:MEMBER]->(grupoProfesores),
(pedro)-[:MEMBER]->(grupo1),
(juan)-[:MEMBER]->(grupo1),
(paula)-[:MEMBER]->(grupo1),

// Roles
(profesor:Role { id: 1, name: "Profesor" }),
(alumno:Role { id: 2, name: "Alumno" }),
(julio)-[:ROLE]->(profesor),
(pedro)-[:ROLE]->(alumno),
(juan)-[:ROLE]->(alumno),
(paula)-[:ROLE]->(alumno),

// Servicio
(servicioAlumnos:ServiceOrg { id: 1, name: "Servicio de Alumnos", description: "Servicio de los alumnos del grupo 2" }),
(servicioAlumnos)-[:TEAM]->(grupo1),
(alumnos)-[:SERVICE]->(servicioAlumnos),

// SLA y Scope
(slaAlumnos:Sla { id: 1, name: "ServicioAlumnosSla" }),
(scope:Scope { id: 1, name: "Alcance General" }),
(slaAlumnos)-[:GUARANTEE]->(scope),

// Objetivos dentro del scope
(ttr:Objective { id: 1, name: "Alcance General TTR", metric: "TTR", value: 48.0, unit: "HOUR" }),
(tto:Objective { id: 2, name: "Alcance General TTO", metric: "TTO", value: 48.0, unit: "HOUR" }),
(scope)-[:OBJECTIVE]->(ttr),
(scope)-[:OBJECTIVE]->(tto),

// Cliente asociado a SLA
(customerProfesores:Customer { id: 1, name: "AlumnosServiceCustomer_1" }),
(customerProfesores)-[:ORGANIZATION]->(profesores),
(customerProfesores)-[:SLA]->(slaAlumnos),
(servicioAlumnos)-[:CUSTOMER]->(customerProfesores),

// Status y Tipos de petición
(statusNew:Status { id: 1, name: "New" }),
(incident:RequestType { id: 1, name: "Incident" }),
(userRequest:RequestType { id: 2, name: "User Request" }),

// Issues
(issue1:Issue { id: 1, createdAt: localdatetime("2025-04-16T10:20:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Error de plataforma", description: "No se puede acceder a la plataforma educativa", title: "Plataforma caída", TTO: 90094.0 }),
(issue2:Issue { id: 2, createdAt: localdatetime("2025-04-15T15:45:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema con calificaciones", description: "Las calificaciones no se muestran correctamente", title: "Error en notas", TTO: 145034.0 }),
(issue3:Issue { id: 3, createdAt: localdatetime("2025-04-10T08:00:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Imposible subir tarea", description: "No se pueden subir archivos a la tarea final", title: "Error subida tarea", TTO: 620534.0 }),
(issue4:Issue { id: 4, createdAt: localdatetime("2025-04-01T12:30:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Cuenta bloqueada", description: "Un alumno no puede acceder a su cuenta", title: "Acceso bloqueado", TTO: 1376334.0 }),
(issue5:Issue { id: 5, createdAt: localdatetime("2025-03-20T09:00:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema de matrícula", description: "Error al actualizar datos de matrícula", title: "Fallo matrícula", TTO: 2407134.0 }),
(issue6:Issue { id: 6, createdAt: localdatetime("2025-04-12T14:10:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema de acceso al aula virtual", description: "Algunos usuarios no pueden entrar al aula virtual", title: "Acceso aula virtual", TTO: 415734.0 }),
(issue7:Issue { id: 7, createdAt: localdatetime("2025-04-08T19:30:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Caída del sistema de correos", description: "El servicio de correo institucional está fuera de línea", title: "Correo caído", TTO: 710034.0 }),
(issue8:Issue { id: 8, createdAt: localdatetime("2025-04-05T08:50:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Error en notificaciones", description: "Las notificaciones no están llegando a los alumnos", title: "Fallo en notificaciones", TTO: 1009734.0 }),
(issue9:Issue { id: 9, createdAt: localdatetime("2025-03-29T17:25:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problemas en videollamadas", description: "Se interrumpen las videollamadas en la plataforma", title: "Fallos en videollamadas", TTO: 1570134.0 }),
(issue10:Issue { id: 10, createdAt: localdatetime("2025-03-15T10:00:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Error de sincronización", description: "Problemas sincronizando datos entre aplicaciones", title: "Sincronización fallida", TTO: 2594334.0 }),
(issue11:Issue { id: 11, createdAt: localdatetime("2025-03-05T09:40:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Problema de autenticación", description: "Usuarios no pueden autenticarse con su contraseña", title: "Error de login", TTO: 3455934.0 }),
(issue12:Issue { id: 12, createdAt: localdatetime("2025-02-25T11:15:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Fallo en carga de documentos", description: "Los documentos no se cargan correctamente en la plataforma", title: "Error documentos", TTO: 4311534.0 }),

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
