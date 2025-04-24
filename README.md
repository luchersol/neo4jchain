# Neo4jChain

In order to run the project just run the following commands:

## For docker

``` bin/bash
cd front
cp .env.example .env
npm install
cd ..
docker-compose up --build -d
```

## For local

Initialize Neo4j Desktop and create a DBMS called CBD. Then, Start it.

Go to yor Neo4jChain repo, one terminal and execute this:

``` bin/bash
cd front 
cp .env.example .env
npm install
npm run dev
```

Open another terminal and run this:

``` bin/bash
./mvnw spring-boot:run
```

## App use

- Frontend: http://localhost:3000 (for Docker)
- Frontend: http://localhost:5173 (for Local)
- Backend API: http://localhost:8080

## Troubleshooting

You have to have free the following ports: 3000 (for Docker), 8080, 7474, 7687, 5173 (for Local).
