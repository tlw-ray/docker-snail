docker run -d --name neo4j -e NEO4J_AUTH="neo4j/@Operations1" -p 7474:7474 -p 7687:7687 -v $PWD/data/data:/data -v $PWD/data/logs:/logs -v $PWD/data/import:/var/lib/neo4j/import -v $PWD/data/conf:/var/lib/neo4j/conf -v $PWD/data/plugins:/plugins neo4j
