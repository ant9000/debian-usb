INSTALL
-------

Install prerequisites:

```
sudo apt install golang git libglib2.0-dev libostree-dev qemu-system-x86 \
     qemu-user-static debootstrap systemd-container apt-cacher-ng \
     gdisk grub-pc-bin grub-efi-amd64-bin
export GOPATH=`pwd`/gocode
go get -u github.com/go-debos/debos/cmd/debos
export http_proxy=http://<your LAN ip here>:3142
```

USAGE
-----

Example run:

```
$GOPATH/bin/debos --memory=4G debian.yaml
$GOPATH/bin/debos --memory=4G grub.yaml
```

CONFIGURATION
-------------

There are a few configurable parameters in debian.yaml; for instance, let's
create an image for architecture i686 and targeting testing:

```
$GOPATH/bin/debos --memory=4G -t arch:i686 -t suite:testing debian.yaml
$GOPATH/bin/debos --memory=4G -t arch:i686 -t suite:testing grub.yaml
```

Look at debian.yaml to see what's available.


LINKS
-----

- https://ekaia.org/blog/2018/07/03/introducing-debos/
- https://godoc.org/github.com/go-debos/debos/actions
