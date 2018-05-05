# Running KiCad in Ubuntu 18.04 using Docker

Need to do some PCB design but the recent upgrade to Ubuntu 18.04 [broke][1]
your KiCad?

This image based on Ubuntu 16.04 and KiCad 4.0 from [js-reynaud's PPA][2]
might help.

## Building

First, install Docker:

	sudo apt-get install docker.io

Then build build the image (this step takes a while as it downloads the whole
KiCad library):

	git clone https://github.com/adamheinrich/beaver-kicad.git
	cd beaver-kicad
	docker build -t beaver-kicad .

## Running

Finally, `cd` to the directory with your KiCad project (so that `pwd` can
retrieve its path) and run the image. The project directory will be mounted in
`/kicad-project`:

	docker run -ti --rm \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v $XAUTHORITY:/tmp/.Xauthority \
		-v `pwd`:/kicad-project \
		-e DISPLAY=$DISPLAY \
		-e XAUTHORITY=/tmp/.Xauthority \
		beaver-kicad

## Credits

- [docker-kicad][3] by Seppe Stas
- [Running GUI apps with Docker][4] by Fabio Rehm

[1]: https://bugs.launchpad.net/ubuntu/+source/kicad/+bug/1767652
[2]: https://launchpad.net/~js-reynaud/+archive/ubuntu/kicad-4
[3]: https://github.com/productize/docker-kicad/
[4]: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
