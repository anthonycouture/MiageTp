# Explication de la réalisation pour la notation du TP
**Binôme : Anthony Couture et Florian Barbet**

Pour l'ensemble des tests j'utilise la voiture **BMW X1** de type **4x4** qui est la seule voiture de ma BDD.  
Après l'avoir créé elle a la plaque **AA-003-AA**

La démo des exercices a été écrite le 11/12/2020 ce qui est important pour comprendre le bon fonctionnement.

## Exercice noté 1
Dans le namespace Reservation je vais réserver ma voiture grâce à l'appel à cette URL : **/api/reservation/createreservation/**  
Voici le BP :  
![Image de reservation BP](./images/Reservation_BP.png)  
Comme la voiture n'a pas de réservation c'est ok:  
![Image de reservation ok](./images/Reservation_ok.png)  
![Image de reservation ok en BDD](./images/Reservation_ok_BDD.png)  
Si je souhaite réaliser la même réservation c'est ko car la voiture est réservé et j'ai que celle la dans cette catégorie :  
![Image de reservation ok](./images/Reservation_ko.png)  


## Exercice noté 2
Dans le namespace Commande je peux sortir une voiture du parc grâce à l'appel à cette URL : **/api/commande/sortirparcvoiture/**  
Comme je dois faire une gestion aussi dans le namespace Reservation j'ai créé cette URL dans celui-ci : **/api/reservation/sortirparcvoiture/** qui permet d'appeler un BP qui fera les vérifications nécéssaires pour savoir si la voiture est réservé et si pas réservé de faire les bonnes suppressions.  
Voici le BP dans le namespace Réservation :  
![Image de reservation BP sortir parc](./images/Sortir_voiture_bp_reservation.png)  
Voici le BP dans le namespace Commande :  
![Image de commande BP sortir parc](./images/Sortir_voiture_bp_commande.png)  
Ma voiture est réservé lors de l'exercice noté précédent donc si j'essaye de la sortir c'est ko :  
![Image de sortir parc ko](./images/Sortir_voiture_ko.png)  
J'ai changé la réservation de la voiture qui est une réservation terminé je peux donc sortir ma voiture du parc donc c'est ok :  
![Image de reservation terminer](./images/Sortir_voiture_reservation_terminer_bdd.png)  
![Image de sortir parc ok](./images/Sortir_voiture_ok.png)  
La voiture n'existe plus en BDD :  
![Image de sortir parc ok bdd](./images/Sortir_voiture_ok_bdd.png)  
![Image de sortir parc ok bdd1](./images/Sortir_voiture_ok_bdd_1.png)  

# Indication pour le TP

## intersystems-iris-docker-rest-template
This is a template of a REST API application built with ObjectScript in InterSystems IRIS.
It also has OPEN API spec, 
can be developed with Docker and VSCode,
can ve deployed as ZPM module.

## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation with ZPM

zpm:USER>install rest-template

## Installation for development

Create your repository from template.

Clone/git pull the repo into any local directory e.g. like it is shown below (here I show all the examples related to this repository, but I assume you have your own derived from the template):

```
$ git clone git@github.com:intersystems-community/objectscript-rest-docker-template.git
```

Open the terminal in this directory and run:

```
$ docker-compose up -d --build
```

or open the folder in VSCode and do the following:
![rest](https://user-images.githubusercontent.com/2781759/78183327-63569800-7470-11ea-8561-c3b547ce9001.gif)


## How to Work With it

This template creates /crud REST web-application on IRIS which implements 4 types of communication: GET, POST, PUT and DELETE aka CRUD operations.
These interface works with a sample persistent class Sample.Person.

# Testing GET requests

To test GET you need to have some data. You can create it with POST request (see below), or you can create some fake testing data. to do that open IRIS terminal or web terminal on /localhost:52773/terminal/  and call:

```
USER>do ##class(Sample.Person).AddTestData(10)
```
This will create 10 random records in Sample.Person class.


You can get swagger Open API 2.0 documentation on:
```
localhost:yourport/_spec
```

This REST API exposes two GET requests: all the data and one record.
To get all the data in JSON call:

```
localhost:52773/crud/persons/all
```

To request the data for a particular record provide the id in GET request like 'localhost:52773/crud/persons/id' . E.g.:

```
localhost:52773/crud/persons/1
```

This will return JSON data for the person with ID=1, something like that:

```
{"Name":"Elon Mask","Title":"CEO","Company":"Tesla","Phone":"123-123-1233","DOB":"1982-01-19"}
```

# Testing POST request

Create a POST request e.g. in Postman with raw data in JSON. e.g.

```
{"Name":"Elon Mask","Title":"CEO","Company":"Tesla","Phone":"123-123-1233","DOB":"1982-01-19"}
```

Adjust the authorisation if needed - it is basic for container with default login and password for IRIR Community edition container

and send the POST request to localhost:52773/crud/persons/

This will create a record in Sample.Person class of IRIS.

# Testing PUT request

PUT request could be used to update the records. This needs to send the similar JSON as in POST request above supplying the id of the updated record in URL.
E.g. we want to change the record with id=5. Prepare in Postman the JSON in raw like following:

```
{"Name":"Jeff Besos","Title":"CEO","Company":"Amazon","Phone":"123-123-1233","DOB":"1982-01-19"}
```

and send the put request to:
```
localhost:52773/crud/persons/5
```

# Testing DELETE request

For delete request this REST API expects only the id of the record to delete. E.g. if the id=5 the following DELETE call will delete the record:

```
localhost:52773/crud/persons/5
```

## How to start coding
This repository is ready to code in VSCode with ObjectScript plugin.
Install [VSCode](https://code.visualstudio.com/) and [ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) plugin and open the folder in VSCode.
Open /src/cls/PackageSample/ObjectScript.cls class and try to make changes - it will be compiled in running IRIS docker container.

Feel free to delete PackageSample folder and place your ObjectScript classes in a form
/src/cls/Package/Classname.cls

The script in Installer.cls will import everything you place under /src/cls into IRIS.

## What's insde the repo

# Dockerfile

The simplest dockerfile to start IRIS and load ObjectScript from /src/cls folder
Use the related docker-compose.yml to easily setup additional parametes like port number and where you map keys and host folders.

# Dockerfile-zpm

Dockerfile-zpm builds for you a container which contains ZPM package manager client so you are able to install packages from ZPM in this container

# .vscode/settings.json

Settings file to let you immedietly code in VSCode with [VSCode ObjectScript plugin](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript))

# .vscode/launch.json
Config file if you want to debug with VSCode ObjectScript
