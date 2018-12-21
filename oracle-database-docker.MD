# Oracle Database og Docker
* Oracle Database images skal bygges lokalt fra downloads
* Derved sikrer de sig accept af licens (eller kan man ikke downloade)
## På Linux bygges image og eksporteres 
* git clone git@github.com:oracle/docker-images.git
* cd docker-images/OracleDatabase/SingleInstance/dockerfiles
* Byg 18.4 XE, build tager nogen tid
* Download XE-rpm'en fra Oracle og placer i mappen 18.4.0. 
* ./buildDockerImage.sh -v 18.4.0 -x 
* docker save oracle/database:18.4.0-xe | gzip -c > ./xe_docker_image_18.4.tgz
* Detaljer om byggeproces kan læses i README under SingleInstance
## Brug af image på anden maskine, uanset platform
* Flyt .gz til hvor imaget skal bruges
* gunzip -c ./xe_docker_image_18.4.tgz | docker load
* eller unzip tar og 
* docker load -i ./xe_docker_image_18.4.tar
## EE Image er samme fremgangsmåde
* Hent EE zip (ikke rpm)
* ./buildDockerImage.sh -v 18.3.0 -e 
* docker save oracle/database:18.3.0-ee | gzip -c > ./ee_docker_image_18.3.tgz
## Kør på Windows
* Få installeret Docker Community Edition, google dig igennem dette, trivielt
* Enable Hyper-V fra en admin powershell prompt
* Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V –All
* Disable igen, hvis man en dag får brug for det
* Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
* Docker settings, shared drives, sæt hak i c: i settings for Docker
* Docker settings, containers skal være linux for at køre Oracle
* Start som dæmon, tager noget tid
```
docker run --name xedocker -d -p 1521:1521 -p 5500:5500 \
-e ORACLE_PWD=oracle -e ORACLE_CHARACTERSET=AL32UTF8 \
-v c:/temp/create_scripts:/opt/oracle/scripts/setup \
oracle/database:18.4.0-xe
```
* Efterfølgende stop og start
* docker stop xedocker eller docker start xedocker
* Slet container, så man kan starte forfra med docker run
* docker rm xedocker
* Man kan dirigere databasefiler ud på hosten med -v, se mere i Oracles README
* Enterprise Manager Express skulle kunne nås via https://localhost:5500/em
* Man det virker ikke helt. Browsere klager over TLS problemer.
* -v c:/temp/create-scripts giver mulighed for at få sat nogen ting op 
* når databasen dannes, fx system privilegier, se README og ellers vedlagte eksempel 
* Databasen er multitenant, google eventuelt dette
* Connectionstrings er disse, tre indbyggede brugere og en der oprettes ifm. docker run
* sys/oracle//localhost:1521/XE
* system/oracle//localhost:1521/XE
* pdbadmin/oracle//localhost:1521/XEPDB1
* dst_user01/Xpassword_01//localhost:1521/XEPDB1