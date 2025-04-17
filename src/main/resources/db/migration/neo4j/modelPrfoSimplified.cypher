MATCH (n)
DETACH DELETE n;

// Crear Organizaciones
CREATE (profesores:Organization { name: "Profesores", code: "PROF" })
CREATE (alumnos:Organization { name: "Alumnos", code: "ALUM" })

// Crear Cadena Faceted
CREATE (chainFaceted:Chain:ChainFaceted { name: "Faceted Chain", version: "1", description: "Cadena de tipo faceted", ownershipType: "STATE" })

// Crear Equipos
CREATE (grupoProfesores:Team { name: "Grupo Profesores", specialization: "FunctionalUser" })
CREATE (grupo1:Team { name: "Grupo 1", specialization: "ITUser" })

// Asociar Equipos a Organizaciones
CREATE (profesores)-[:TEAM]->(grupoProfesores)
CREATE (alumnos)-[:TEAM]->(grupo1)

// Vincular Organizaciones a la Cadena Faceted
CREATE (profesores)-[:BELONGS_TO]->(chainFaceted)
CREATE (alumnos)-[:BELONGS_TO]->(chainFaceted)

// Crear Personas y Asignarlas a Equipos
CREATE (julio:Person { name: "julio", firstName: "Julio", lastName: "", email: "julio@us.es", phone: "", password: "1234" })
CREATE (pedro:Person { name: "pedro", firstName: "Pedro", lastName: "", email: "pedro@alum.us.es", phone: "", password: "1234" })
CREATE (juan:Person { name: "juan", firstName: "Juan", lastName: "", email: "juan@alum.us.es", phone: "", password: "1234" })
CREATE (paula:Person { name: "paula", firstName: "Paula", lastName: "", email: "paula@alum.us.es", phone: "", password: "1234" })

// Relacionar Personas con Equipos
CREATE (julio)-[:MEMBER]->(grupoProfesores)
CREATE (pedro)-[:MEMBER]->(grupo1)
CREATE (juan)-[:MEMBER]->(grupo1)
CREATE (paula)-[:MEMBER]->(grupo1)

// Crear Roles y Asignarlos a Personas
CREATE (profesor:Role { name: "Profesor" })
CREATE (alumno:Role { name: "Alumno" })
CREATE (julio)-[:ROLE]->(profesor)
CREATE (pedro)-[:ROLE]->(alumno)
CREATE (juan)-[:ROLE]->(alumno)
CREATE (paula)-[:ROLE]->(alumno)

// Crear Servicio
CREATE (servicioAlumnos:ServiceOrg { name: "Servicio de Alumnos", description: "Servicio de los alumnos del grupo 2" })
CREATE (servicioAlumnos)-[:TEAM]->(grupo1)
CREATE (alumnos)-[:SERVICE]->(servicioAlumnos)

// Crear SLA y Scope
CREATE (slaAlumnos:Sla { name: "ServicioAlumnosSla" })
CREATE (scope:Scope { name: "Alcance General" })
CREATE (slaAlumnos)-[:GUARANTEE]->(scope)

// Crear Objetivos dentro del Scope
CREATE (ttr:Objective { name: "Alcance General TTR", metric: "TTR", value: 48.0, unit: "HOUR" })
CREATE (tto:Objective { name: "Alcance General TTO", metric: "TTO", value: 48.0, unit: "HOUR" })
CREATE (scope)-[:OBJECTIVE]->(ttr)
CREATE (scope)-[:OBJECTIVE]->(tto)

// Asociar SLA a Clientes
CREATE (customerProfesores:Customer { name: "AlumnosServiceCustomer_1" })
CREATE (customerProfesores)-[:ORGANIZATION]->(profesores)
CREATE (customerProfesores)-[:SLA]->(slaAlumnos)
CREATE (servicioAlumnos)-[:CUSTOMER]->(customerProfesores)

CREATE (incident:RequestType { name: "Incident" }),
(userRequest:RequestType { name: "User Request" });

CREATE
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
(issue12:Issue { createdAt: localdatetime("2025-02-25T11:15:00"), lastAssignedAt: localdatetime("2025-04-17T00:00:00"), TTR: 0.0, name: "Fallo en carga de documentos", description: "Los documentos no se cargan correctamente en la plataforma", title: "Error documentos", TTO: 4311534.0 });

CREATE
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
(issue12)-[:REQUEST_TYPE]->(incident);

MATCH (i:Issue), (p:Person { name: "julio" })
MERGE (i)-[:CREATED_BY]->(p);

MATCH (i:Issue), (s:Status { name: "New" })
MERGE (i)-[:STATUS]->(s);

MATCH (i:Issue), (so:ServiceOrg { name: "Servicio de Alumnos" })
MERGE (i)-[:SERVICE]->(so);
