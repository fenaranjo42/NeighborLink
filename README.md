# NeighborLink
iOS application to bring people living nearby closer together

![Alt text](~/Desktop/Login.png?raw=true "Login")

NeighborLink's Trello board: https://trello.com/b/jRwU99ab/neighborlink

NeighborLink's Design Screens on Invision: https://projects.invisionapp.com/d/main#/projects/prototypes/10300046/screens
(I am designing them myself and am not very good at it, if you have any advice or want to collaborate, let me know!)

# Updating Dependencies with Carthage
Note: Carthage not set up yet

NeighborLink will use frameworks for Authentication (https://github.com/fenaranjo42/Authentication), Networking, and a Common framework 

```
cd Application/NeighborLink
carthage update --use-submodules --platform iOS
```
use
```
carthage bootstrap --platform iOS
```
if you cloned the project for the first time

