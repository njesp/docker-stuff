#!/usr/bin/env pwsh
# docker machine demo
$sub = az account show --query "id" -o tsv)
docker-machine create --driver azure `
    -azure-location 'West Europe' `
    --azure-size 'Standard_B1ms' `
    -azure-open-port 8000 `
    --azure-subscription-id $sub m01
docker-machine env m01
eval $(docker-machine env m01)
docker run busybox echo hello world
docker-machine ip m01
docker run -d -p 8000:80 nginx
curl $(docker-machine ip m01):8000
#docker-machine rm m01
#docker-machine ls
