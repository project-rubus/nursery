# :seedling: scripts for building raspberry pi images

## Approach

Building raspberry pi images from scratch requires adding a lot of additional software to debian - this doesn't seem ideal to do on a real life machine so I'd like to enable this to work under docker or a virtual machine.

Using docker has a few hurdles

- docker may not work as expected on windows
- the docker container must be started with `--privileged`
- the way that paths are mounted at is really important if package installation is to work, but if docker is stored on a filesystem with `nosuid` or `nodev` set then things will fail cryptically

Using vagrant requires that vagrant and vmware are installed, but other than that might be more simple to get working.  It will create a very large virtual disk though and performance may be somewhat worse than docker.

## Vagrant

* Download vagrant from: https://www.vagrantup.com/downloads.html
* Download virtualbox from https://www.virtualbox.org/wiki/Downloads

## Usage

### Docker

```shell
docker build -t rubus/nursery-builder .
docker volume create rubus-work
docker volume create rubus-deploy
docker run --rm -it \
       --privileged \
       -v rubus-work:/pi-gen/work \
       -v rubus-deploy:/pi-gen/deploy \
       -v ${PWD}/stages:/pi-gen/custom-stages:ro \
       rubus/nursery-builder \
       nursery-build
```


### Vagrant

``` shell
vagrant up
vagrant ssh
nursery-build /pi-gen
```


```
pip3 install -r requirements.txt
./nursery prepare
```
