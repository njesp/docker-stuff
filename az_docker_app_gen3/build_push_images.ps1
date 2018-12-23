#!/usr/bin/env pwsh
# Byg og push images 
docker login -u njesp 
docker build -t njesp/azdemodb ./db
docker build -t njesp/azdemowebapp ./app
docker push njesp/azdemodb
docker push njesp/azdemowebapp
