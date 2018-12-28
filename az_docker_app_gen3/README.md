
# Multi-container app via docker-compose. 

Samme app virker lokalt på Linux og Windows. Uden ændringer. 

Den virker også uden ændringer på Azure App Services og på Google Cloud

Deployment scripts Powershell og kører enten på Windows Powershell eller på Linux på Powershell Core.


Bygget med Docker og docker-compose til at få lagene til at hænge sammen. 

Applikationen har en database (PostgreSQL, hvad ellers) i bunden og en web applikation ovenpå (Python-baseret. hvad ellers). 

Applikationen startes i lokal udgave med: 

```
docker-compose up -d
```

Peg en web-browser mod http://localhost for at se applikationen i al sin magt og vælde

Azure deployment af Appen nås fra http://njn-dockerizedmultiimage.azurewebsites.net/

Google Cloud instansen har en rigtig ip http://35.204.205.142/


Data i databasen er persisteret i containeren. så det er forfra ved rebuild. Enten kan data peges ud af databasen med et volume og -v flag eller database-containeren kan erstattes af en database-service eksternt.

Datamodellen i databasen bygges ind i data-containeren med et init-script.

Deploy til Azure foregår med Azure CLI, så det kan gentages ensartet. CLI-kommandoerne er scriptet i Powershell.

Alternativ (til docker compose) deployment er via Kubernetes. 

Patches af software kommer på via docker build, som trækker seneste patchede base images.

Ved loadbalencerede apps kan frontend containers skiftes ud en af gangen. Databasebackend er vanskeligere at patche uden nedetid, men der kommer DBaaS ind i billedet (så gør Microsoft det)

Hvis ens Azure er lukket ned i forhold til omverdenen, så komplicerer det sagerne (i hvert fald ved Azure App Services).