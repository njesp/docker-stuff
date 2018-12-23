#!/usr/bin/env pwsh
# Deploy docker-compose multi container app til Azure App Services
# Sletter eventuel eksisterende ressorcegruppe, bar-røv-princippet
# Dedikeret ressourcegruppe gør at man bare kan slette den, så ryger alle ressourcer under med i købet
$name = 'njn-DockerizedMultiImage'
$resgrp = 'resGrpDockerApps'
$srvplan = 'DockerizedAppServicePlan'
$compose_file = 'docker-compose.yml'
az login
az account set --subscription "Visual Studio Enterprise"
az group delete --name $resgrp --yes
az group create --name $resgrp --location "West Europe"
az appservice plan create --name $srvplan --resource-group $resgrp --sku B1 --is-linux
az webapp create --resource-group $resgrp --plan $srvplan --name $name --multicontainer-config-type compose --multicontainer-config-file $compose_file
az webapp log config --resource-group  $resgrp --name $name --application-logging true --detailed-error-messages true --docker-container-logging filesystem --failed-request-tracing true --level verbose
Write-Host 'Sig nej hvis der ikke skal ryddes op endnu'
az group delete --name $resgrp