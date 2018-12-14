INSTALL
-------

Install prerequisites:

```
sudo apt install golang git libglib2.0-dev libostree-dev qemu-system-x86 \
     qemu-user-static debootstrap systemd-container \
     gdisk grub-pc-bin grub-efi-amd64-bin
export GOPATH=`pwd`/gocode
go get -u github.com/go-debos/debos/cmd/debos
```

USAGE
-----

Example run:

```
$GOPATH/bin/debos --memory=4G debian.yaml
$GOPATH/bin/debos --memory=4G grub.yaml
```

The two steps above will produce a complete image that can be dd'ed to an USB pendrive, with

```
sudo dd if=debian-stable-amd64.img of=<USB block device name here> bs=64k status=progress
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

CACHING
-------

Downloading deb packages over and over is time consuming. You can setup a local cache and
use it as a proxy, like this:

```
sudo apt install apt-cacher-ng
export http_proxy=http://<your LAN IP here>:3142
```

Subsequent builds will reuse local packages. Note that you really need to use your LAN IP,
localhost will not work. Also, be aware that apt-cacher-ng will be accessible from outside
your machine unless you firewall it.

LINKS
-----

- https://ekaia.org/blog/2018/07/03/introducing-debos/
- https://godoc.org/github.com/go-debos/debos/actions
