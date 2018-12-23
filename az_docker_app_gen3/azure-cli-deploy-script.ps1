#!/usr/bin/env pwsh
# Deploy docker-compose multi container app til Azure App Services
# Sletter eventuel eksisterende ressorcegruppe, bar-røv-princippet
# Dedikeret ressourcegruppe gør at man bare kan slette den, så ryger alle ressourcer under med i købet
az login
az account set --subscription "Visual Studio Enterprise"
az group delete --name resGrpDockerApps --yes
az group create --name resGrpDockerApps --location "West Europe"
az appservice plan create --name DockerizedAppServicePlan --resource-group resGrpDockerApps --sku B1 --is-linux
az webapp create --resource-group resGrpDockerApps --plan DockerizedAppServicePlan --name njn-DockerizedMultiImage --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml
Write-Host 'Sig nej hvis der ikke skal ryddes op endnu'
az group delete --name resGrpDockerApps