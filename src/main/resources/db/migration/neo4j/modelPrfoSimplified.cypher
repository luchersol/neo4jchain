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
