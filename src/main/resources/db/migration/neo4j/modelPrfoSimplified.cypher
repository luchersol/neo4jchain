MATCH(n) DETACH DELETE n
// Crear Organizaciones
CREATE (profesores:Organization { name: "Profesores", code: "PROF" })
CREATE (alumnos:Organization { name: "Alumnos", code: "ALUM" })

// Crear Cadena Faceted
CREATE (chainFaceted:ChainFaceted { id: 1, name: "Faceted Chain", version: "1", description: "Cadena de tipo faceted", ownershipType: "STATE" })

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
CREATE (julio:Person { firstName: "Julio", lastName: "", email: "julio@us.es", phone: "", username: "julio", password: "1234" })
CREATE (pedro:Person { firstName: "Pedro", lastName: "", email: "pedro@alum.us.es", phone: "", username: "pedro", password: "1234" })
CREATE (juan:Person { firstName: "Juan", lastName: "", email: "juan@alum.us.es", phone: "", username: "juan", password: "1234" })
CREATE (paula:Person { firstName: "Paula", lastName: "", email: "paula@alum.us.es", phone: "", username: "paula", password: "1234" })

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
CREATE (scope:Sla { name: "Alcance General" })
CREATE (slaAlumnos)-[:GUARANTEE]->(scope)

// Crear Objetivos dentro del Scope
CREATE (ttr:Objective { metric: "TTR", value: 48.0, unit: "HOUR" })
CREATE (tto:Objective { metric: "TTO", value: 48.0, unit: "HOUR" })
CREATE (scope)-[:OBJECTIVE]->(ttr)
CREATE (scope)-[:OBJECTIVE]->(tto)

// Asociar SLA a Clientes
CREATE (customerProfesores:Customer { id: 1 })
CREATE (customerProfesores)-[:ORGANIZATION]->(profesores)
CREATE (customerProfesores)-[:SLA]->(slaAlumnos)
CREATE (servicioAlumnos)-[:CUSTOMER]->(customerProfesores)
