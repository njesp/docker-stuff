
# Multi-container app via docker-compose. 

Hensigten er at få denne app til at trille på Azure. 

Applikationen virker fint lokalt.

Bygger på Docker og Docker-compose. 

Applikationen har en database (PostgreSQL, hvad ellers) i bunden og en web applikation ovenpå (Python-baseret. hvad ellers). 

Applikationen startes i lokal udgave med: 

```
docker-compose up -d
```

Peg en web-browser mod http://localhost for at se applikationen i al sin magt og vælde

Data i databasen er persisteret i containeren. så det er forfra ved rebuild. Enten kan data peges ud af databasen med et volume og -v flag eller database-containeren kan erstattes af en database-service eksternt.

Datamodellen i databasen bygges ind i data-containeren med et init-script.

Deploy til Azure tænkes foregå med Azure CLI, så det kan gentages ensartet.

Alternativ deployment er via Kubernetes. 