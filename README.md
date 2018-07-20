# Unity3d in a container

### Description
-------
This repository contains a simple Makefile to create a Unity3d container. 
The goal is to install unity distributions independently. This requires a current version of docker.
The current unity version is Unity-2018.2.0f2.

### Build
**1. Get the repository**
#### https
```https
git clone https://github.com:frzifus/docker-unity3d.git
```

**2. Navigate to the repo**
```bash
Version: Unity-2018.2.0f2
make build:   creates a docker image (unity3d)
make install: stars UnitySetup
make run:     starts unity3d
make shell:   opens a shell in the container
```

### Troubleshooting
If you receive an error like
```
Could not connect to display
```
your docker daemon isn't authorized to use your local XServer session. Fix:
```
xhost +local:docker
```

### TODO
-------
- Build a flatpak
