# This file contains a query that exports all database in a cypher file
CALL apoc.export.cypher.all(null, {stream:true, format: "plain"})
YIELD cypherStatements
RETURN cypherStatements;
