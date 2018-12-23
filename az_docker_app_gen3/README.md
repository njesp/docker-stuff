
# Multi-container app via docker-compose. 

Hensigten er at få denne app til at trille på Azure. 

Applikationen virker fint lokalt og på Azure

Bygger på Docker, Docker-compose og Azure App Services

Applikationen har en database (PostgreSQL, hvad ellers) i bunden og en web applikation ovenpå (Python-baseret. hvad ellers). 

Applikationen startes i lokal udgave med: 

```
docker-compose up -d
```

Peg en web-browser mod http://localhost for at se applikationen i al sin magt og vælde

Azure deployment af Appen nås fra http://njn-dockerizedmultiimage.azurewebsites.net/

Data i databasen er persisteret i containeren. så det er forfra ved rebuild. Enten kan data peges ud af databasen med et volume og -v flag eller database-containeren kan erstattes af en database-service eksternt.

Datamodellen i databasen bygges ind i data-containeren med et init-script.

Deploy til Azure foregår med Azure CLI, så det kan gentages ensartet. CLI-kommandoerne er scriptet i Powershell, som kan køre på Windows og Linux. 

Alternativ (til docker compose) deployment er via Kubernetes. 

Patches af software kommer på via docker build, som trækker seneste patchede base images.

Ved loadbalencerede apps kan frontend containers skiftes ud en af gangen. Databasebackend er vanskeligere at patche uden nedetid, men der kommer DBaaS ind i billedet (så gør Microsoft det)

Kunne formentlig trivielt deployes på Amazons Cloud (AWS) uden større ændringer. 

Hvis ens Azure er lukket ned i forhold til omverdenen, så komplicerer det sagerne (i hvert fald ved Azure App Services).