MATCH(n) DETACH DELETE n;
DROP CONSTRAINT UNIQUE_IMPORT_NAME IF EXISTS;
CREATE CONSTRAINT UNIQUE_IMPORT_NAME FOR (node:`UNIQUE IMPORT LABEL`) REQUIRE (node.`UNIQUE IMPORT ID`) IS UNIQUE;
UNWIND [{_id:1855, properties:{ownershipType:"STATE", name:"Revisión de piezas de aviones", description:"Cadena de tipo state para revisión de piezas de aviones", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainState;
UNWIND [{_id:1856, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza de defensa", value:4.0}}, {_id:1857, properties:{unit:"HOUR", metric:"TTR", name:"TTR pieza de defensa", value:16.0}}, {_id:1858, properties:{unit:"HOUR", metric:"TTO", name:"TTO Pieza comercial", value:10.0}}, {_id:1859, properties:{unit:"HOUR", metric:"TTR", name:"TTR Pieza comercial", value:24.0}}, {_id:1860, properties:{unit:"HOUR", metric:"TTO", name:"TTO de Análisis", value:2.0}}, {_id:1861, properties:{unit:"HOUR", metric:"TTR", name:"TTR de análisis", value:5.0}}, {_id:1862, properties:{unit:"HOUR", metric:"TTR", name:"Alcance General TTR", value:48.0}}, {_id:1863, properties:{unit:"HOUR", metric:"TTO", name:"Alcance General TTO", value:48.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Objective;
UNWIND [{_id:1864, properties:{name:"Revisor"}}, {_id:1865, properties:{name:"Fabricante"}}, {_id:1866, properties:{name:"Profesor"}}, {_id:1867, properties:{name:"Alumno"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Role;
UNWIND [{_id:1868, properties:{name:"Scope de piezas de defensa", priority:"LOW"}}, {_id:1869, properties:{name:"Scope piezas comerciales", priority:"LOW"}}, {_id:1870, properties:{name:"Scope de análisis de piezas de defensa", priority:"LOW"}}, {_id:1871, properties:{name:"Scope de análisis de piezas comerciales", priority:"LOW"}}, {_id:1872, properties:{name:"Alcance General User request", priority:"LOW"}}, {_id:1873, properties:{name:"Alcance general Incident", priority:"LOW"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Scope;
UNWIND [{_id:1874, properties:{name:"Equipo de revisión", specialization:"Revisión"}}, {_id:1875, properties:{name:"Equipo de análisis", specialization:"Análisis"}}, {_id:1876, properties:{name:"Fabricantes", specialization:"Técnicos especializados en la fabricación de piezas"}}, {_id:1877, properties:{name:"Grupo Profesores", specialization:"FunctionalUser"}}, {_id:1878, properties:{name:"Grupo 1", specialization:"ITUser"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Team;
UNWIND [{_id:1879, properties:{name:"Pieza de defensa"}}, {_id:1880, properties:{name:"Pieza de Uso comercial"}}, {_id:1881, properties:{name:"Incident"}}, {_id:1882, properties:{name:"User Request"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:RequestType;
UNWIND [{_id:1883, properties:{lastName:"López", firstName:"Rocío", phone:"666666666", name:"rocio", email:"rocio@gmail.com"}}, {_id:1884, properties:{lastName:"Romero", firstName:"Raquel", phone:"665896235", name:"raquel", email:"raqrom@gmail.com"}}, {_id:1885, properties:{lastName:"Gómez", firstName:"Rubén", phone:"987654321", name:"ruben", email:"rub@gmail.com"}}, {_id:1886, properties:{lastName:"Suárez", firstName:"Fran", phone:"654654654", name:"franito", email:"franito@gmail.com"}}, {_id:1887, properties:{lastName:"", firstName:"Julio", password:"1234", phone:"", name:"julio", email:"julio@us.es"}}, {_id:1888, properties:{lastName:"", firstName:"Pedro", password:"1234", phone:"", name:"pedro", email:"pedro@alum.us.es"}}, {_id:1889, properties:{lastName:"", firstName:"Juan", password:"1234", phone:"", name:"juan", email:"juan@alum.us.es"}}, {_id:1890, properties:{lastName:"", firstName:"Paula", password:"1234", phone:"", name:"paula", email:"paula@alum.us.es"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Person;
UNWIND [{_id:1891, properties:{ownershipType:"STATE", name:"Faceted Chain", description:"Cadena de tipo faceted", version:"1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Chain:ChainFaceted;
UNWIND [{_id:1892, properties:{name:"Revisar pieza"}}, {_id:1893, properties:{name:"Empaquetar piezas"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Privilege;
UNWIND [{_id:1894, properties:{code:"FA", name:"Fabricante de piezas S.A"}}, {_id:1895, properties:{code:"AP", name:"Analista de Piezas S.L."}}, {_id:1896, properties:{code:"RDP", name:"Revisora de piezas S.A"}}, {_id:1897, properties:{code:"PROF", name:"Profesores"}}, {_id:1898, properties:{code:"ALUM", name:"Alumnos"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Organization;
UNWIND [{_id:1899, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:49:45.1042723'), TTR:0.0, name:"Error de plataforma", description:"No se puede acceder a la plataforma educativa", lastAssignedAt:localdatetime('2025-04-21T11:49:45.1042723'), title:"Plataforma caída", closedAt:localdatetime('2025-04-21T11:49:45.1042723'), TTO:478278.0}}, {_id:1900, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:55:04.9371147'), TTR:50.0, name:"Problema con calificaciones", description:"Las calificaciones no se muestran correctamente", lastAssignedAt:localdatetime('2025-04-21T11:55:04.9371147'), title:"Error en notas", closedAt:localdatetime('2025-04-21T11:55:04.9371147'), TTO:533537.0}}, {_id:1901, properties:{createdAt:localdatetime('2025-04-10T08:00:00'), TTR:0.0, name:"Imposible subir tarea", description:"No se pueden subir archivos a la tarea final", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error subida tarea", TTO:620534.0}}, {_id:1902, properties:{createdAt:localdatetime('2025-04-01T12:30:00'), TTR:0.0, name:"Cuenta bloqueada", description:"Un alumno no puede acceder a su cuenta", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Acceso bloqueado", TTO:1376334.0}}, {_id:1903, properties:{createdAt:localdatetime('2025-03-20T09:00:00'), TTR:0.0, name:"Problema de matrícula", description:"Error al actualizar datos de matrícula", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallo matrícula", TTO:2407134.0}}, {_id:1904, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:06.1645076'), TTR:0.0, name:"Problema de acceso al aula virtual", description:"Algunos usuarios no pueden entrar al aula virtual", lastAssignedAt:localdatetime('2025-04-21T11:58:06.1645076'), title:"Acceso aula virtual", TTO:804420.0}}, {_id:1905, properties:{lastStateChangedAt:localdatetime('2025-04-21T11:58:30.3118271'), TTR:0.0, name:"Caída del sistema de correos", description:"El servicio de correo institucional está fuera de línea", lastAssignedAt:localdatetime('2025-04-21T11:58:30.3118271'), title:"Correo caído", TTO:1098744.0}}, {_id:1906, properties:{TTR:0.0, name:"Error en notificaciones", description:"Las notificaciones no están llegando a los alumnos", lastAssignedAt:localdatetime('2025-04-21T12:03:39.5893836'), title:"Fallo en notificaciones", TTO:1398753.0}}, {_id:1907, properties:{createdAt:localdatetime('2025-03-29T17:25:00'), TTR:0.0, name:"Problemas en videollamadas", description:"Se interrumpen las videollamadas en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Fallos en videollamadas", TTO:1570134.0}}, {_id:1908, properties:{lastStateChangedAt:localdatetime('2025-04-21T12:04:21.6649559'), TTR:21.0, name:"Error de sincronización", description:"Problemas sincronizando datos entre aplicaciones", lastAssignedAt:localdatetime('2025-04-21T12:04:21.6649559'), title:"Sincronización fallida", closedAt:localdatetime('2025-04-21T12:04:21.6649559'), TTO:2983394.0}}, {_id:1909, properties:{createdAt:localdatetime('2025-03-05T09:40:00'), TTR:0.0, name:"Problema de autenticación", description:"Usuarios no pueden autenticarse con su contraseña", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error de login", TTO:3455934.0}}, {_id:1910, properties:{createdAt:localdatetime('2025-02-25T11:15:00'), TTR:0.0, name:"Fallo en carga de documentos", description:"Los documentos no se cargan correctamente en la plataforma", lastAssignedAt:localdatetime('2025-04-17T00:00:00'), title:"Error documentos", TTO:4311534.0}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Issue;
UNWIND [{_id:1911, properties:{name:"Nueva petición", id:1}}, {_id:1912, properties:{name:"Pendiente de revisión"}}, {_id:1913, properties:{name:"Revisión en curso"}}, {_id:1914, properties:{name:"Revisión exitosa"}}, {_id:1915, properties:{name:"Revisión fallida"}}, {_id:1916, properties:{name:"New"}}, {_id:1917, properties:{name:"Gestionándose"}}, {_id:1918, properties:{name:"Cerrada"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Status;
UNWIND [{_id:1919, properties:{name:"ServicioDeAnálisisCustomer_1"}}, {_id:1920, properties:{name:"ServicioDeRevisiónCustomer_1"}}, {_id:1921, properties:{name:"AlumnosServiceCustomer_1"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Customer;
UNWIND [{_id:1922, properties:{name:"SLA control de calidad"}}, {_id:1923, properties:{name:"SLA análisis"}}, {_id:1924, properties:{name:"ServicioAlumnosSla"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:Sla;
UNWIND [{_id:1925, properties:{name:"Servicio de análisis de piezas", description:"En este servicio se analizan las piezas antes de examinar su calidad"}}, {_id:1926, properties:{name:"Servicio de revisión de piezas", description:"En este servicio de revisan las piezas"}}, {_id:1927, properties:{name:"Servicio de Alumnos", description:"Servicio de los alumnos del grupo 2"}}] AS row
CREATE (n:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row._id}) SET n += row.properties SET n:ServiceOrg;
UNWIND [{start: {_id:1922}, end: {_id:1868}, properties:{}}, {start: {_id:1922}, end: {_id:1869}, properties:{}}, {start: {_id:1923}, end: {_id:1870}, properties:{}}, {start: {_id:1923}, end: {_id:1871}, properties:{}}, {start: {_id:1924}, end: {_id:1872}, properties:{}}, {start: {_id:1924}, end: {_id:1873}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:GUARANTEE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1925}, end: {_id:1879}, properties:{}}, {start: {_id:1925}, end: {_id:1880}, properties:{}}, {start: {_id:1926}, end: {_id:1879}, properties:{}}, {start: {_id:1926}, end: {_id:1880}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1899}, end: {_id:1881}, properties:{}}, {start: {_id:1900}, end: {_id:1882}, properties:{}}, {start: {_id:1901}, end: {_id:1881}, properties:{}}, {start: {_id:1902}, end: {_id:1882}, properties:{}}, {start: {_id:1903}, end: {_id:1881}, properties:{}}, {start: {_id:1904}, end: {_id:1882}, properties:{}}, {start: {_id:1905}, end: {_id:1881}, properties:{}}, {start: {_id:1906}, end: {_id:1881}, properties:{}}, {start: {_id:1907}, end: {_id:1882}, properties:{}}, {start: {_id:1908}, end: {_id:1881}, properties:{}}, {start: {_id:1909}, end: {_id:1882}, properties:{}}, {start: {_id:1910}, end: {_id:1881}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1925}, end: {_id:1919}, properties:{}}, {start: {_id:1926}, end: {_id:1920}, properties:{}}, {start: {_id:1927}, end: {_id:1921}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CUSTOMER]->(end) SET r += row.properties;
UNWIND [{start: {_id:1874}, end: {_id:1864}, properties:{}}, {start: {_id:1875}, end: {_id:1864}, properties:{}}, {start: {_id:1876}, end: {_id:1865}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1899}, end: {_id:1918}, properties:{}}, {start: {_id:1900}, end: {_id:1918}, properties:{}}, {start: {_id:1901}, end: {_id:1916}, properties:{}}, {start: {_id:1902}, end: {_id:1916}, properties:{}}, {start: {_id:1903}, end: {_id:1916}, properties:{}}, {start: {_id:1904}, end: {_id:1917}, properties:{}}, {start: {_id:1905}, end: {_id:1917}, properties:{}}, {start: {_id:1906}, end: {_id:1916}, properties:{}}, {start: {_id:1907}, end: {_id:1916}, properties:{}}, {start: {_id:1908}, end: {_id:1918}, properties:{}}, {start: {_id:1909}, end: {_id:1916}, properties:{}}, {start: {_id:1910}, end: {_id:1916}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1911}, end: {_id:1912}, properties:{}}, {start: {_id:1912}, end: {_id:1913}, properties:{}}, {start: {_id:1913}, end: {_id:1914}, properties:{}}, {start: {_id:1913}, end: {_id:1915}, properties:{}}, {start: {_id:1916}, end: {_id:1917}, properties:{}}, {start: {_id:1917}, end: {_id:1918}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:NEXT_STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1919}, end: {_id:1923}, properties:{}}, {start: {_id:1920}, end: {_id:1922}, properties:{}}, {start: {_id:1921}, end: {_id:1924}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:1925}, end: {_id:1875}, properties:{}}, {start: {_id:1926}, end: {_id:1874}, properties:{}}, {start: {_id:1927}, end: {_id:1878}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:1894}, end: {_id:1855}, properties:{}}, {start: {_id:1895}, end: {_id:1855}, properties:{}}, {start: {_id:1896}, end: {_id:1855}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1899}, end: {_id:1878}, properties:{}}, {start: {_id:1900}, end: {_id:1878}, properties:{}}, {start: {_id:1904}, end: {_id:1878}, properties:{}}, {start: {_id:1906}, end: {_id:1878}, properties:{}}, {start: {_id:1908}, end: {_id:1878}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1874}, end: {_id:1883}, properties:{}}, {start: {_id:1874}, end: {_id:1884}, properties:{}}, {start: {_id:1875}, end: {_id:1885}, properties:{}}, {start: {_id:1876}, end: {_id:1886}, properties:{}}, {start: {_id:1877}, end: {_id:1887}, properties:{}}, {start: {_id:1878}, end: {_id:1888}, properties:{}}, {start: {_id:1878}, end: {_id:1889}, properties:{}}, {start: {_id:1878}, end: {_id:1890}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:MEMBER]->(end) SET r += row.properties;
UNWIND [{start: {_id:1925}, end: {_id:1912}, properties:{}}, {start: {_id:1926}, end: {_id:1913}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:STATUS]->(end) SET r += row.properties;
UNWIND [{start: {_id:1855}, end: {_id:1912}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:1899}, end: {_id:1887}, properties:{}}, {start: {_id:1900}, end: {_id:1887}, properties:{}}, {start: {_id:1901}, end: {_id:1887}, properties:{}}, {start: {_id:1902}, end: {_id:1887}, properties:{}}, {start: {_id:1903}, end: {_id:1887}, properties:{}}, {start: {_id:1904}, end: {_id:1887}, properties:{}}, {start: {_id:1905}, end: {_id:1887}, properties:{}}, {start: {_id:1906}, end: {_id:1887}, properties:{}}, {start: {_id:1907}, end: {_id:1887}, properties:{}}, {start: {_id:1908}, end: {_id:1887}, properties:{}}, {start: {_id:1909}, end: {_id:1887}, properties:{}}, {start: {_id:1910}, end: {_id:1887}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:CREATED_BY]->(end) SET r += row.properties;
UNWIND [{start: {_id:1895}, end: {_id:1925}, properties:{}}, {start: {_id:1898}, end: {_id:1927}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1899}, end: {_id:1889}, properties:{}}, {start: {_id:1900}, end: {_id:1889}, properties:{}}, {start: {_id:1904}, end: {_id:1888}, properties:{}}, {start: {_id:1906}, end: {_id:1890}, properties:{}}, {start: {_id:1908}, end: {_id:1890}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ASSIGNED_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1883}, end: {_id:1864}, properties:{}}, {start: {_id:1884}, end: {_id:1864}, properties:{}}, {start: {_id:1885}, end: {_id:1864}, properties:{}}, {start: {_id:1886}, end: {_id:1865}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLES]->(end) SET r += row.properties;
UNWIND [{start: {_id:1899}, end: {_id:1927}, properties:{}}, {start: {_id:1900}, end: {_id:1927}, properties:{}}, {start: {_id:1901}, end: {_id:1927}, properties:{}}, {start: {_id:1902}, end: {_id:1927}, properties:{}}, {start: {_id:1903}, end: {_id:1927}, properties:{}}, {start: {_id:1904}, end: {_id:1927}, properties:{}}, {start: {_id:1905}, end: {_id:1927}, properties:{}}, {start: {_id:1906}, end: {_id:1927}, properties:{}}, {start: {_id:1907}, end: {_id:1927}, properties:{}}, {start: {_id:1908}, end: {_id:1927}, properties:{}}, {start: {_id:1909}, end: {_id:1927}, properties:{}}, {start: {_id:1910}, end: {_id:1927}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:SERVICE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1894}, end: {_id:1876}, properties:{}}, {start: {_id:1895}, end: {_id:1875}, properties:{}}, {start: {_id:1896}, end: {_id:1874}, properties:{}}, {start: {_id:1897}, end: {_id:1877}, properties:{}}, {start: {_id:1898}, end: {_id:1878}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TEAM]->(end) SET r += row.properties;
UNWIND [{start: {_id:1868}, end: {_id:1856}, properties:{}}, {start: {_id:1868}, end: {_id:1857}, properties:{}}, {start: {_id:1869}, end: {_id:1858}, properties:{}}, {start: {_id:1869}, end: {_id:1859}, properties:{}}, {start: {_id:1870}, end: {_id:1860}, properties:{}}, {start: {_id:1870}, end: {_id:1861}, properties:{}}, {start: {_id:1871}, end: {_id:1860}, properties:{}}, {start: {_id:1871}, end: {_id:1861}, properties:{}}, {start: {_id:1872}, end: {_id:1862}, properties:{}}, {start: {_id:1872}, end: {_id:1863}, properties:{}}, {start: {_id:1873}, end: {_id:1862}, properties:{}}, {start: {_id:1873}, end: {_id:1863}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:OBJECTIVE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1897}, end: {_id:1891}, properties:{}}, {start: {_id:1898}, end: {_id:1891}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:BELONGS_TO]->(end) SET r += row.properties;
UNWIND [{start: {_id:1855}, end: {_id:1923}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:INITIAL_SLA]->(end) SET r += row.properties;
UNWIND [{start: {_id:1919}, end: {_id:1894}, properties:{}}, {start: {_id:1920}, end: {_id:1895}, properties:{}}, {start: {_id:1921}, end: {_id:1897}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ORGANIZATION]->(end) SET r += row.properties;
UNWIND [{start: {_id:1855}, end: {_id:1914}, properties:{}}, {start: {_id:1855}, end: {_id:1915}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:TERMINAL]->(end) SET r += row.properties;
UNWIND [{start: {_id:1864}, end: {_id:1892}, properties:{}}, {start: {_id:1864}, end: {_id:1893}, properties:{}}, {start: {_id:1865}, end: {_id:1893}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:PRIVILEGE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1887}, end: {_id:1866}, properties:{}}, {start: {_id:1888}, end: {_id:1867}, properties:{}}, {start: {_id:1889}, end: {_id:1867}, properties:{}}, {start: {_id:1890}, end: {_id:1867}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:ROLE]->(end) SET r += row.properties;
UNWIND [{start: {_id:1868}, end: {_id:1879}, properties:{}}, {start: {_id:1869}, end: {_id:1880}, properties:{}}, {start: {_id:1870}, end: {_id:1879}, properties:{}}, {start: {_id:1871}, end: {_id:1880}, properties:{}}, {start: {_id:1872}, end: {_id:1882}, properties:{}}, {start: {_id:1873}, end: {_id:1881}, properties:{}}] AS row
MATCH (start:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.start._id})
MATCH (end:`UNIQUE IMPORT LABEL`{`UNIQUE IMPORT ID`: row.end._id})
CREATE (start)-[r:REQUEST_TYPE]->(end) SET r += row.properties;
MATCH (n:`UNIQUE IMPORT LABEL`)  WITH n LIMIT 20000 REMOVE n:`UNIQUE IMPORT LABEL` REMOVE n.`UNIQUE IMPORT ID`;
DROP CONSTRAINT UNIQUE_IMPORT_NAME;