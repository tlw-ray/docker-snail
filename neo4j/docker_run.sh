docker run \
--name DB_Neo4j \
-p 7474:7474 \
-p 7687:7687 \
-v $HOME/neo4j/data:/data \
-d \
neo4j

