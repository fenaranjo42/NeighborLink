# NeighborLink
iOS application to bring people living nearby closer together

NeighborLink's Trello board: https://trello.com/b/jRwU99ab/neighborlink

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

