#!/usr/bin/env pwsh
# Byg og push images
# Der bygges oven på images vedligeholdt af https://www.rocker-project.org/
# Der mangler en Oracle klient og ROracle pakken. Men lige nu er det Proof of Concept. 
# Container sættes i gang med 
# docker run --name rdst -d -p 8787:8787 -e PASSWORD=pw njesp/rdst
docker login -u njesp 
docker build -t njesp/rdst .
docker push njesp/rdst
#