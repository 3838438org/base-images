_ = require 'lodash'

# TODO
# - add entry/exit dates

data = {
	arch: [
		{ slug: "armel", name: "arm v5", can_run: ["armel"] },
		{ slug: "rpi", name: "ARM v6", can_run: ["armel", "rpi"] },
		{ slug: "armv7hf", name: "ARM v7", can_run: ["armel", "rpi", "armv7hf"] },
		{ slug: "aarch64", name: "ARM v8", can_run: ["armel", "rpi", "armv7hf", "aarch64"] },
		{ slug: "i386", name: "Intel 32-bit (x86)", can_run: ["i386"] },
		{ slug: "amd64", name: "Intel 64-bit (x86-64)", can_run: [ "i386", "amd64" ] }
	],
	device: [
		{ slug: "am571x-evm", name: "am571x-evm", arch_slug: "armv7hf" },
		{ slug: "apalis-imx6q", name: "Toradex Apalis", arch_slug: "armv7hf" },
		{ slug: "artik10", name: "Samsung Artik 10", arch_slug: "armv7hf" },
		{ slug: "artik5", name: "Samsung Artik 5", arch_slug: "armv7hf" },
		{ slug: "artik710", name: "Samsung Artik 710", arch_slug: "armv7hf" },
		{ slug: "beaglebone-black", name: "Beaglebone Black", arch_slug: "armv7hf" },
		{ slug: "beaglebone-green", name: "Beaglebone Green", arch_slug: "armv7hf" },
		{ slug: "beaglebone-green-wifi", name: "Beaglebone Green WiFi", arch_slug: "armv7hf" },
		{ slug: "ccon-01", name: "CCON01", arch_slug: "armv7hf" },
		{ slug: "colibri-imx6dl", name: "Toradex Colibri", arch_slug: "armv7hf" },
		{ slug: "cybertan-ze250", name: "Cybertan ze250", arch_slug: "i386" },
		{ slug: "hummingboard", name: "Hummingboard", arch_slug: "armv7hf" },
		{ slug: "imx6ul-var-dart", name: "Dart", arch_slug: "armv7hf" },
		{ slug: "intel-edison", name: "Intel Edison", arch_slug: "i386" },
		{ slug: "intel-nuc", name: "Intel NUC", arch_slug: "amd64" },
		{ slug: "kitra710", name: "Kitra 710", arch_slug: "armv7hf" },
		{ slug: "nitrogen6x", name: "Nitrogen 6x", arch_slug: "armv7hf" },
		{ slug: "odroid-c1", name: "ODroid C1", arch_slug: "armv7hf" },
		{ slug: "odroid-xu4", name: "ODroid XU4", arch_slug: "armv7hf" },
		{ slug: "parallella", name: "Parallella", arch_slug: "armv7hf" },
		{ slug: "qemux86", name: "QEMU x86", arch_slug: "i386" },
		{ slug: "qemux86-64", name: "QEMU x86-64", arch_slug: "amd64" },
		{ slug: "raspberry-pi", name: "Raspberry Pi (1, Zero, Zero W)", arch_slug: "rpi" },
		{ slug: "raspberry-pi2", name: "Raspberry Pi 2", arch_slug: "armv7hf" },
		{ slug: "raspberrypi3", name: "Raspberry Pi 3", arch_slug: "armv7hf" },
		{ slug: "ts4900", name: "Technologic TS-4900", arch_slug: "armv7hf" },
		{ slug: "ts7700", name: "Technologic TS-7700", arch_slug: "armel" },
		{ slug: "up-board", name: "UP Board", arch_slug: "amd64" },
		{ slug: "via-vab820-quad", name: "VIA vab820", arch_slug: "armv7hf" },
		{ slug: "zc702-zynq7", name: "Zynq zc702", arch_slug: "armv7hf" }
	],
	distro_supports_hw: [
		{ distro_slug: "raspbian", hw_id: "raspberry-pi" },
		{ distro_slug: "raspbian", hw_id: "raspberry-pi2" },
		{ distro_slug: "raspbian", hw_id: "raspberrypi3" },
	],
	distro: [
		{ slug: "debian", name: "Debian" },
		{ slug: "raspbian", name: "Raspbian" },
		{ slug: "alpine", name: "Alpine Linux" },
		{ slug: "fedora", name: "Fedora" }
	],
	distro_version: [
		{ id: 1, distro_slug: "debian", libc_id: 1, version: "wheezy" },
		{ id: 2, distro_slug: "debian", libc_id: 1, version: "jessie" },
		{ id: 3, distro_slug: "debian", libc_id: 1, version: "stretch" },
		{ id: 4, distro_slug: "debian", libc_id: 1, version: "sid" },
		{ id: 5, distro_slug: "raspbian", libc_id: 1, version: "wheezy" },
		{ id: 6, distro_slug: "raspbian", libc_id: 1, version: "jessie" },
		{ id: 7, distro_slug: "raspbian", libc_id: 1, version: "stretch" },
		{ id: 8, distro_slug: "alpine", libc_id: 2, version: "3.5" },
		{ id: 9, distro_slug: "alpine", libc_id: 2, version: "3.6" },
		{ id: 10, distro_slug: "fedora", libc_id: 1, version: "24" },
		{ id: 11, distro_slug: "fedora", libc_id: 1, version: "25" },
	],

	distro_version_supports_arch: [
		# debian wheezy
		{ distro_version_id: 1, arch_slug: "armel" },
		{ distro_version_id: 1, arch_slug: "armv7hf" },
		{ distro_version_id: 1, arch_slug: "aarch64" },
		{ distro_version_id: 1, arch_slug: "i386" },
		{ distro_version_id: 1, arch_slug: "amd64" },
		# debian jessie
		{ distro_version_id: 2, arch_slug: "armel" },
		{ distro_version_id: 2, arch_slug: "armv7hf" },
		{ distro_version_id: 2, arch_slug: "aarch64" },
		{ distro_version_id: 2, arch_slug: "i386" },
		{ distro_version_id: 2, arch_slug: "amd64" },
		# debian stretch
		{ distro_version_id: 3, arch_slug: "armel" },
		{ distro_version_id: 3, arch_slug: "armv7hf" },
		{ distro_version_id: 3, arch_slug: "aarch64" },
		{ distro_version_id: 3, arch_slug: "i386" },
		{ distro_version_id: 3, arch_slug: "amd64" },
		# debian sid
		{ distro_version_id: 4, arch_slug: "armel" },
		{ distro_version_id: 4, arch_slug: "armv7hf" },
		{ distro_version_id: 4, arch_slug: "aarch64" },
		{ distro_version_id: 4, arch_slug: "i386" },
		{ distro_version_id: 4, arch_slug: "amd64" },
		# raspbian wheezy-jessie-stretch
		{ distro_version_id: 5, arch_slug: "rpi" },
		{ distro_version_id: 6, arch_slug: "rpi" },
		{ distro_version_id: 7, arch_slug: "rpi" },
		# alpine 3.5
		{ distro_version_id: 8, arch_slug: "armv7hf" },
		{ distro_version_id: 8, arch_slug: "aarch64" },
		{ distro_version_id: 8, arch_slug: "i386" },
		{ distro_version_id: 8, arch_slug: "amd64" },
		{ distro_version_id: 8, arch_slug: "rpi" },
		# alpine 3.6
		{ distro_version_id: 9, arch_slug: "armv7hf" },
		{ distro_version_id: 9, arch_slug: "aarch64" },
		{ distro_version_id: 9, arch_slug: "i386" },
		{ distro_version_id: 9, arch_slug: "amd64" },
		{ distro_version_id: 9, arch_slug: "rpi" },
		# fedora 24
		{ distro_version_id: 10, arch_slug: "armv7hf" },
		{ distro_version_id: 10, arch_slug: "aarch64" },
		{ distro_version_id: 10, arch_slug: "amd64" },
		# fedora 25
		{ distro_version_id: 11, arch_slug: "armv7hf" },
		{ distro_version_id: 11, arch_slug: "aarch64" },
		{ distro_version_id: 11, arch_slug: "amd64" },
	],

	stack: [
		{ slug: "node", name: "node.js", default_distro_version_id: 3 },
		{ slug: "java", name: "Java", default_distro_version_id: 3 },
		{ slug: "python", name: "Python", default_distro_version_id: 3 },
		{ slug: "go", name: "Go", default_distro_version_id: 3 },
		{ slug: "buildpack-deps", name: "Buildpack", default_distro_version_id: 3 },
	],

	stack_version: [
		{ id: 1, stack_slug: "node", version: "0.10.48" },
		{ id: 2, stack_slug: "node", version: "0.12.18" },
		{ id: 3, stack_slug: "node", version: "4.8.3" },
		{ id: 4, stack_slug: "node", version: "5.12.0" },
		{ id: 5, stack_slug: "node", version: "6.10.3" },
		{ id: 6, stack_slug: "node", version: "7.10.0" },
		{ id: 7, stack_slug: "node", version: "8.0.0" },
		{ id: 8, stack_slug: "java", version: "7" },
		{ id: 9, stack_slug: "java", version: "8" },
		{ id: 10, stack_slug: "python", version: "2.7.13" },
		{ id: 11, stack_slug: "python", version: "3.3.6" },
		{ id: 12, stack_slug: "python", version: "3.4.4" },
		{ id: 13, stack_slug: "python", version: "3.5.2" },
		{ id: 14, stack_slug: "python", version: "3.6.1" },
		{ id: 15, stack_slug: "go", version: "1.4.3" },
		{ id: 16, stack_slug: "go", version: "1.5.4" },
		{ id: 17, stack_slug: "go", version: "1.6.4" },
		{ id: 18, stack_slug: "go", version: "1.7.5" },
		{ id: 19, stack_slug: "go", version: "1.8" },
	],

	stack_version_supports_arch: [
		# aarch64 can be supported but we haven't added aarch64 image yet.
		{ stack_version_id: 1, arch_slug: "armel" },
		{ stack_version_id: 1, arch_slug: "rpi" },
		{ stack_version_id: 1, arch_slug: "armv7hf" },
		{ stack_version_id: 1, arch_slug: "i386" },
		{ stack_version_id: 1, arch_slug: "amd64" },

		{ stack_version_id: 2, arch_slug: "armel" },
		{ stack_version_id: 2, arch_slug: "rpi" },
		{ stack_version_id: 2, arch_slug: "armv7hf" },
		{ stack_version_id: 2, arch_slug: "i386" },
		{ stack_version_id: 2, arch_slug: "amd64" },

		{ stack_version_id: 3, arch_slug: "armel" },
		{ stack_version_id: 3, arch_slug: "rpi" },
		{ stack_version_id: 3, arch_slug: "armv7hf" },
		{ stack_version_id: 3, arch_slug: "i386" },
		{ stack_version_id: 3, arch_slug: "amd64" },

		{ stack_version_id: 4, arch_slug: "armel" },
		{ stack_version_id: 4, arch_slug: "rpi" },
		{ stack_version_id: 4, arch_slug: "armv7hf" },
		{ stack_version_id: 4, arch_slug: "i386" },
		{ stack_version_id: 4, arch_slug: "amd64" },

		{ stack_version_id: 5, arch_slug: "armel" },
		{ stack_version_id: 5, arch_slug: "rpi" },
		{ stack_version_id: 5, arch_slug: "armv7hf" },
		{ stack_version_id: 5, arch_slug: "i386" },
		{ stack_version_id: 5, arch_slug: "amd64" },

		{ stack_version_id: 6, arch_slug: "rpi" },
		{ stack_version_id: 6, arch_slug: "armv7hf" },
		{ stack_version_id: 6, arch_slug: "i386" },
		{ stack_version_id: 6, arch_slug: "amd64" },

		{ stack_version_id: 7, arch_slug: "rpi" },
		{ stack_version_id: 7, arch_slug: "armv7hf" },
		{ stack_version_id: 7, arch_slug: "i386" },
		{ stack_version_id: 7, arch_slug: "amd64" },

		{ stack_version_id: 8, arch_slug: "armel" },
		{ stack_version_id: 8, arch_slug: "rpi" },
		{ stack_version_id: 8, arch_slug: "armv7hf" },
		{ stack_version_id: 8, arch_slug: "i386" },
		{ stack_version_id: 8, arch_slug: "amd64" },

		{ stack_version_id: 9, arch_slug: "armel" },
		{ stack_version_id: 9, arch_slug: "rpi" },
		{ stack_version_id: 9, arch_slug: "armv7hf" },
		{ stack_version_id: 9, arch_slug: "i386" },
		{ stack_version_id: 9, arch_slug: "amd64" },

		{ stack_version_id: 10, arch_slug: "armel" },
		{ stack_version_id: 10, arch_slug: "rpi" },
		{ stack_version_id: 10, arch_slug: "armv7hf" },
		{ stack_version_id: 10, arch_slug: "i386" },
		{ stack_version_id: 10, arch_slug: "amd64" },

		{ stack_version_id: 11, arch_slug: "armel" },
		{ stack_version_id: 11, arch_slug: "rpi" },
		{ stack_version_id: 11, arch_slug: "armv7hf" },
		{ stack_version_id: 11, arch_slug: "i386" },
		{ stack_version_id: 11, arch_slug: "amd64" },

		{ stack_version_id: 12, arch_slug: "armel" },
		{ stack_version_id: 12, arch_slug: "rpi" },
		{ stack_version_id: 12, arch_slug: "armv7hf" },
		{ stack_version_id: 12, arch_slug: "i386" },
		{ stack_version_id: 12, arch_slug: "amd64" },

		{ stack_version_id: 13, arch_slug: "armel" },
		{ stack_version_id: 13, arch_slug: "rpi" },
		{ stack_version_id: 13, arch_slug: "armv7hf" },
		{ stack_version_id: 13, arch_slug: "i386" },
		{ stack_version_id: 13, arch_slug: "amd64" },

		{ stack_version_id: 14, arch_slug: "armel" },
		{ stack_version_id: 14, arch_slug: "rpi" },
		{ stack_version_id: 14, arch_slug: "armv7hf" },
		{ stack_version_id: 14, arch_slug: "i386" },
		{ stack_version_id: 14, arch_slug: "amd64" },

		{ stack_version_id: 15, arch_slug: "armel" },
		{ stack_version_id: 15, arch_slug: "rpi" },
		{ stack_version_id: 15, arch_slug: "armv7hf" },
		{ stack_version_id: 15, arch_slug: "i386" },
		{ stack_version_id: 15, arch_slug: "amd64" },

		{ stack_version_id: 16, arch_slug: "armel" },
		{ stack_version_id: 16, arch_slug: "rpi" },
		{ stack_version_id: 16, arch_slug: "armv7hf" },
		{ stack_version_id: 16, arch_slug: "i386" },
		{ stack_version_id: 16, arch_slug: "amd64" },

		{ stack_version_id: 17, arch_slug: "armel" },
		{ stack_version_id: 17, arch_slug: "rpi" },
		{ stack_version_id: 17, arch_slug: "armv7hf" },
		{ stack_version_id: 17, arch_slug: "i386" },
		{ stack_version_id: 17, arch_slug: "amd64" },

		{ stack_version_id: 18, arch_slug: "armel" },
		{ stack_version_id: 18, arch_slug: "rpi" },
		{ stack_version_id: 18, arch_slug: "armv7hf" },
		{ stack_version_id: 18, arch_slug: "i386" },
		{ stack_version_id: 18, arch_slug: "amd64" },

		{ stack_version_id: 19, arch_slug: "armel" },
		{ stack_version_id: 19, arch_slug: "rpi" },
		{ stack_version_id: 19, arch_slug: "armv7hf" },
		{ stack_version_id: 19, arch_slug: "i386" },
		{ stack_version_id: 19, arch_slug: "amd64" },
	],

	stack_version_supports_distro_version: [
		# node 0.10.x 
		{ stack_version_id: 1, distro_version_id: 1 },
		{ stack_version_id: 1, distro_version_id: 2 },
		{ stack_version_id: 1, distro_version_id: 3 },
		{ stack_version_id: 1, distro_version_id: 4 },
		{ stack_version_id: 1, distro_version_id: 5 },
		{ stack_version_id: 1, distro_version_id: 6 },
		{ stack_version_id: 1, distro_version_id: 7 },
		{ stack_version_id: 1, distro_version_id: 8 },
		{ stack_version_id: 1, distro_version_id: 9 },
		{ stack_version_id: 1, distro_version_id: 10 },
		{ stack_version_id: 1, distro_version_id: 11 },

		# node 0.12.x
		{ stack_version_id: 2, distro_version_id: 1 },
		{ stack_version_id: 2, distro_version_id: 2 },
		{ stack_version_id: 2, distro_version_id: 3 },
		{ stack_version_id: 2, distro_version_id: 4 },
		{ stack_version_id: 2, distro_version_id: 5 },
		{ stack_version_id: 2, distro_version_id: 6 },
		{ stack_version_id: 2, distro_version_id: 7 },
		{ stack_version_id: 2, distro_version_id: 10 },
		{ stack_version_id: 2, distro_version_id: 11 },

		# node 4.x
		{ stack_version_id: 3, distro_version_id: 1 },
		{ stack_version_id: 3, distro_version_id: 2 },
		{ stack_version_id: 3, distro_version_id: 3 },
		{ stack_version_id: 3, distro_version_id: 4 },
		{ stack_version_id: 3, distro_version_id: 5 },
		{ stack_version_id: 3, distro_version_id: 6 },
		{ stack_version_id: 3, distro_version_id: 7 },
		{ stack_version_id: 3, distro_version_id: 8 },
		{ stack_version_id: 3, distro_version_id: 9 },
		{ stack_version_id: 3, distro_version_id: 10 },
		{ stack_version_id: 3, distro_version_id: 11 },

		# node 5.x
		{ stack_version_id: 4, distro_version_id: 1 },
		{ stack_version_id: 4, distro_version_id: 2 },
		{ stack_version_id: 4, distro_version_id: 3 },
		{ stack_version_id: 4, distro_version_id: 4 },
		{ stack_version_id: 4, distro_version_id: 5 },
		{ stack_version_id: 4, distro_version_id: 6 },
		{ stack_version_id: 4, distro_version_id: 7 },
		{ stack_version_id: 4, distro_version_id: 8 },
		{ stack_version_id: 4, distro_version_id: 9 },
		{ stack_version_id: 4, distro_version_id: 10 },
		{ stack_version_id: 4, distro_version_id: 11 },

		# node 6.x
		{ stack_version_id: 5, distro_version_id: 2 },
		{ stack_version_id: 5, distro_version_id: 3 },
		{ stack_version_id: 5, distro_version_id: 4 },
		{ stack_version_id: 5, distro_version_id: 5 },
		{ stack_version_id: 5, distro_version_id: 6 },
		{ stack_version_id: 5, distro_version_id: 7 },
		{ stack_version_id: 5, distro_version_id: 8 },
		{ stack_version_id: 5, distro_version_id: 9 },
		{ stack_version_id: 5, distro_version_id: 10 },
		{ stack_version_id: 5, distro_version_id: 11 },

		# node 7.x
		{ stack_version_id: 6, distro_version_id: 2 },
		{ stack_version_id: 6, distro_version_id: 3 },
		{ stack_version_id: 6, distro_version_id: 4 },
		{ stack_version_id: 6, distro_version_id: 5 },
		{ stack_version_id: 6, distro_version_id: 6 },
		{ stack_version_id: 6, distro_version_id: 7 },
		{ stack_version_id: 6, distro_version_id: 8 },
		{ stack_version_id: 6, distro_version_id: 9 },
		{ stack_version_id: 6, distro_version_id: 10 },
		{ stack_version_id: 6, distro_version_id: 11 },

		# node 8.x
		{ stack_version_id: 7, distro_version_id: 2 },
		{ stack_version_id: 7, distro_version_id: 3 },
		{ stack_version_id: 7, distro_version_id: 4 },
		{ stack_version_id: 7, distro_version_id: 5 },
		{ stack_version_id: 7, distro_version_id: 6 },
		{ stack_version_id: 7, distro_version_id: 7 },
		{ stack_version_id: 7, distro_version_id: 8 },
		{ stack_version_id: 7, distro_version_id: 9 },
		{ stack_version_id: 7, distro_version_id: 10 },
		{ stack_version_id: 7, distro_version_id: 11 },

		# java 7.x
		{ stack_version_id: 8, distro_version_id: 1 },
		{ stack_version_id: 8, distro_version_id: 2 },
		{ stack_version_id: 8, distro_version_id: 3 },
		{ stack_version_id: 8, distro_version_id: 4 },
		{ stack_version_id: 8, distro_version_id: 5 },
		{ stack_version_id: 8, distro_version_id: 6 },
		{ stack_version_id: 8, distro_version_id: 7 },
		{ stack_version_id: 8, distro_version_id: 8 },
		{ stack_version_id: 8, distro_version_id: 9 },

		# java 8.x
		{ stack_version_id: 9, distro_version_id: 1 },
		{ stack_version_id: 9, distro_version_id: 2 },
		{ stack_version_id: 9, distro_version_id: 3 },
		{ stack_version_id: 9, distro_version_id: 4 },
		{ stack_version_id: 9, distro_version_id: 5 },
		{ stack_version_id: 9, distro_version_id: 6 },
		{ stack_version_id: 9, distro_version_id: 7 },
		{ stack_version_id: 9, distro_version_id: 8 },
		{ stack_version_id: 9, distro_version_id: 9 },
		{ stack_version_id: 9, distro_version_id: 10 },
		{ stack_version_id: 9, distro_version_id: 11 },

		# python 2.7
		{ stack_version_id: 10, distro_version_id: 1 },
		{ stack_version_id: 10, distro_version_id: 2 },
		{ stack_version_id: 10, distro_version_id: 3 },
		{ stack_version_id: 10, distro_version_id: 4 },
		{ stack_version_id: 10, distro_version_id: 5 },
		{ stack_version_id: 10, distro_version_id: 6 },
		{ stack_version_id: 10, distro_version_id: 7 },
		{ stack_version_id: 10, distro_version_id: 8 },
		{ stack_version_id: 10, distro_version_id: 9 },
		{ stack_version_id: 10, distro_version_id: 10 },
		{ stack_version_id: 10, distro_version_id: 11 },

		# python 3.3
		{ stack_version_id: 11, distro_version_id: 1 },
		{ stack_version_id: 11, distro_version_id: 2 },
		{ stack_version_id: 11, distro_version_id: 3 },
		{ stack_version_id: 11, distro_version_id: 4 },
		{ stack_version_id: 11, distro_version_id: 5 },
		{ stack_version_id: 11, distro_version_id: 6 },
		{ stack_version_id: 11, distro_version_id: 7 },
		{ stack_version_id: 11, distro_version_id: 8 },
		{ stack_version_id: 11, distro_version_id: 9 },
		{ stack_version_id: 11, distro_version_id: 10 },
		{ stack_version_id: 11, distro_version_id: 11 },

		# python 3.4
		{ stack_version_id: 12, distro_version_id: 1 },
		{ stack_version_id: 12, distro_version_id: 2 },
		{ stack_version_id: 12, distro_version_id: 3 },
		{ stack_version_id: 12, distro_version_id: 4 },
		{ stack_version_id: 12, distro_version_id: 5 },
		{ stack_version_id: 12, distro_version_id: 6 },
		{ stack_version_id: 12, distro_version_id: 7 },
		{ stack_version_id: 12, distro_version_id: 8 },
		{ stack_version_id: 12, distro_version_id: 9 },
		{ stack_version_id: 12, distro_version_id: 10 },
		{ stack_version_id: 12, distro_version_id: 11 },

		# python 3.5
		{ stack_version_id: 13, distro_version_id: 1 },
		{ stack_version_id: 13, distro_version_id: 2 },
		{ stack_version_id: 13, distro_version_id: 3 },
		{ stack_version_id: 13, distro_version_id: 4 },
		{ stack_version_id: 13, distro_version_id: 5 },
		{ stack_version_id: 13, distro_version_id: 6 },
		{ stack_version_id: 13, distro_version_id: 7 },
		{ stack_version_id: 13, distro_version_id: 8 },
		{ stack_version_id: 13, distro_version_id: 9 },
		{ stack_version_id: 13, distro_version_id: 10 },
		{ stack_version_id: 13, distro_version_id: 11 },

		# python 3.6
		{ stack_version_id: 14, distro_version_id: 1 },
		{ stack_version_id: 14, distro_version_id: 2 },
		{ stack_version_id: 14, distro_version_id: 3 },
		{ stack_version_id: 14, distro_version_id: 4 },
		{ stack_version_id: 14, distro_version_id: 5 },
		{ stack_version_id: 14, distro_version_id: 6 },
		{ stack_version_id: 14, distro_version_id: 7 },
		{ stack_version_id: 14, distro_version_id: 8 },
		{ stack_version_id: 14, distro_version_id: 9 },
		{ stack_version_id: 14, distro_version_id: 10 },
		{ stack_version_id: 14, distro_version_id: 11 },

		# go 1.4
		{ stack_version_id: 15, distro_version_id: 1 },
		{ stack_version_id: 15, distro_version_id: 2 },
		{ stack_version_id: 15, distro_version_id: 3 },
		{ stack_version_id: 15, distro_version_id: 4 },
		{ stack_version_id: 15, distro_version_id: 5 },
		{ stack_version_id: 15, distro_version_id: 6 },
		{ stack_version_id: 15, distro_version_id: 7 },
		{ stack_version_id: 15, distro_version_id: 8 },
		{ stack_version_id: 15, distro_version_id: 9 },
		{ stack_version_id: 15, distro_version_id: 10 },
		{ stack_version_id: 15, distro_version_id: 11 },

		# go 1.5
		{ stack_version_id: 16, distro_version_id: 1 },
		{ stack_version_id: 16, distro_version_id: 2 },
		{ stack_version_id: 16, distro_version_id: 3 },
		{ stack_version_id: 16, distro_version_id: 4 },
		{ stack_version_id: 16, distro_version_id: 5 },
		{ stack_version_id: 16, distro_version_id: 6 },
		{ stack_version_id: 16, distro_version_id: 7 },
		{ stack_version_id: 16, distro_version_id: 8 },
		{ stack_version_id: 16, distro_version_id: 9 },
		{ stack_version_id: 16, distro_version_id: 10 },
		{ stack_version_id: 16, distro_version_id: 11 },

		# go 1.6
		{ stack_version_id: 17, distro_version_id: 1 },
		{ stack_version_id: 17, distro_version_id: 2 },
		{ stack_version_id: 17, distro_version_id: 3 },
		{ stack_version_id: 17, distro_version_id: 4 },
		{ stack_version_id: 17, distro_version_id: 5 },
		{ stack_version_id: 17, distro_version_id: 6 },
		{ stack_version_id: 17, distro_version_id: 7 },
		{ stack_version_id: 17, distro_version_id: 8 },
		{ stack_version_id: 17, distro_version_id: 9 },
		{ stack_version_id: 17, distro_version_id: 10 },
		{ stack_version_id: 17, distro_version_id: 11 },

		# go 1.7
		{ stack_version_id: 18, distro_version_id: 1 },
		{ stack_version_id: 18, distro_version_id: 2 },
		{ stack_version_id: 18, distro_version_id: 3 },
		{ stack_version_id: 18, distro_version_id: 4 },
		{ stack_version_id: 18, distro_version_id: 5 },
		{ stack_version_id: 18, distro_version_id: 6 },
		{ stack_version_id: 18, distro_version_id: 7 },
		{ stack_version_id: 18, distro_version_id: 8 },
		{ stack_version_id: 18, distro_version_id: 9 },
		{ stack_version_id: 18, distro_version_id: 10 },
		{ stack_version_id: 18, distro_version_id: 11 },

		# go 1.8
		{ stack_version_id: 19, distro_version_id: 1 },
		{ stack_version_id: 19, distro_version_id: 2 },
		{ stack_version_id: 19, distro_version_id: 3 },
		{ stack_version_id: 19, distro_version_id: 4 },
		{ stack_version_id: 19, distro_version_id: 5 },
		{ stack_version_id: 19, distro_version_id: 6 },
		{ stack_version_id: 19, distro_version_id: 7 },
		{ stack_version_id: 19, distro_version_id: 8 },
		{ stack_version_id: 19, distro_version_id: 9 },
		{ stack_version_id: 19, distro_version_id: 10 },
		{ stack_version_id: 19, distro_version_id: 11 },
	],

	variant: [
		{ slug: "slim" },
		{ slug: "onbuild" },
		{ slug: "jdk" },
		{ slug: "jre" },
		{ slug: "curl" },
		{ slug: "scm" },
	],

	variant_is_compatible_with_distro_and_stack: [
		{ variant_slug: "slim", distro_slug: "fedora", stack_slug: "go" },
		{ variant_slug: "slim", distro_slug: "debian", stack_slug: "go" },
		{ variant_slug: "slim", distro_slug: "raspbian", stack_slug: "go" },
		{ variant_slug: "slim", distro_slug: "alpine", stack_slug: "go" },
		{ variant_slug: "slim", distro_slug: "fedora", stack_slug: "node" },
		{ variant_slug: "slim", distro_slug: "debian", stack_slug: "node" },
		{ variant_slug: "slim", distro_slug: "raspbian", stack_slug: "node" },
		{ variant_slug: "slim", distro_slug: "alpine", stack_slug: "node" },
		{ variant_slug: "slim", distro_slug: "fedora", stack_slug: "python" },
		{ variant_slug: "slim", distro_slug: "debian", stack_slug: "python" },
		{ variant_slug: "slim", distro_slug: "raspbian", stack_slug: "python" },
		{ variant_slug: "slim", distro_slug: "alpine", stack_slug: "python" },
		{ variant_slug: "onbuild", distro_slug: "fedora", stack_slug: "go" },
		{ variant_slug: "onbuild", distro_slug: "debian", stack_slug: "go" },
		{ variant_slug: "onbuild", distro_slug: "raspbian", stack_slug: "go" },
		{ variant_slug: "onbuild", distro_slug: "alpine", stack_slug: "go" },
		{ variant_slug: "onbuild", distro_slug: "fedora", stack_slug: "node" },
		{ variant_slug: "onbuild", distro_slug: "debian", stack_slug: "node" },
		{ variant_slug: "onbuild", distro_slug: "raspbian", stack_slug: "node" },
		{ variant_slug: "onbuild", distro_slug: "alpine", stack_slug: "node" },
		{ variant_slug: "onbuild", distro_slug: "fedora", stack_slug: "python" },
		{ variant_slug: "onbuild", distro_slug: "debian", stack_slug: "python" },
		{ variant_slug: "onbuild", distro_slug: "raspbian", stack_slug: "python" },
		{ variant_slug: "onbuild", distro_slug: "alpine", stack_slug: "python" },
		{ variant_slug: "jdk", distro_slug: "fedora", stack_slug: "java" },
		{ variant_slug: "jdk", distro_slug: "debian", stack_slug: "java" },
		{ variant_slug: "jdk", distro_slug: "raspbian", stack_slug: "java" },
		{ variant_slug: "jdk", distro_slug: "alpine", stack_slug: "java" },
		{ variant_slug: "jre", distro_slug: "fedora", stack_slug: "java" },
		{ variant_slug: "jre", distro_slug: "debian", stack_slug: "java" },
		{ variant_slug: "jre", distro_slug: "raspbian", stack_slug: "java" },
		{ variant_slug: "jre", distro_slug: "alpine", stack_slug: "java" },
		{ variant_slug: "curl", distro_slug: "fedora", stack_slug: "buildpack-deps" },
		{ variant_slug: "curl", distro_slug: "debian", stack_slug: "buildpack-deps" },
		{ variant_slug: "curl", distro_slug: "raspbian", stack_slug: "buildpack-deps" },
		{ variant_slug: "curl", distro_slug: "alpine", stack_slug: "buildpack-deps" },
		{ variant_slug: "scm", distro_slug: "fedora", stack_slug: "buildpack-deps" },
		{ variant_slug: "scm", distro_slug: "debian", stack_slug: "buildpack-deps" },
		{ variant_slug: "scm", distro_slug: "raspbian", stack_slug: "buildpack-deps" },
		{ variant_slug: "scm", distro_slug: "alpine", stack_slug: "buildpack-deps" },
	],

	libc: [
		{ id: 1, name: "glibc" },
		{ id: 2, name: "musl-libc" },
	],

	component: [
		{ id: 1, stack_version_id: 1, slug: "node", version: "0.10.48" },
		{ id: 2, stack_version_id: 2, slug: "node", version: "0.12.18" },
		{ id: 3, stack_version_id: 3, slug: "node", version: "4.8.3" },
		{ id: 4, stack_version_id: 4, slug: "node", version: "5.12.0" },
		{ id: 5, stack_version_id: 5, slug: "node", version: "6.10.3" },
		{ id: 6, stack_version_id: 6, slug: "node", version: "7.10.0" },
		{ id: 7, stack_version_id: 7, slug: "node", version: "8.0.0" },

		{ id: 8, stack_version_id: 10, slug: "python", version: "2.7.13" },
		{ id: 9, stack_version_id: 11, slug: "python", version: "3.3.6" },
		{ id: 10, stack_version_id: 12, slug: "python", version: "3.4.4" },
		{ id: 11, stack_version_id: 13, slug: "python", version: "3.5.2" },
		{ id: 12, stack_version_id: 14, slug: "python", version: "3.6.1" },

		{ id: 13, stack_version_id: 15, slug: "go", version: "1.4.3" },
		{ id: 14, stack_version_id: 16, slug: "go", version: "1.5.4" },
		{ id: 15, stack_version_id: 17, slug: "go", version: "1.6.4" },
		{ id: 16, stack_version_id: 18, slug: "go", version: "1.7.5" },
		{ id: 17, stack_version_id: 19, slug: "go", version: "1.8" },
	],

	blob: [
		# node 0.10.48
		{ component_id: 1, arch_slug: "armel", libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-armel.tar.gz", arch_slug: "armel", checksum: "c4638114768578200ae27127a54db65a7eb95b1cec9b69ace7b1ebd01d3c2c99" },
		{ component_id: 1, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "8b6923e153f096a80af0b68bc9888c6f5371a313ae0cfa104b9c9c9af4c3a204" },
		{ component_id: 1, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "0efdd6168d696641d54fe1cc71b60873c649f4614619becdb2bb3416f8e17cbd" },
		{ component_id: 1, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "6f74bc6f62c9b9e3ea60200185dd0e9b87e24f80d29e58bb2a446c06ae820425" },
		{ component_id: 1, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-i386.tar.gz", arch_slug: "i386", checksum: "6ff9db1265c85edabbf5dd3b18821c97bb5e80f6d29e2330f3298d7d89c5032b" },
		{ component_id: 1, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "b119c120eb887e2f02a7050029de819cf9bc566c999b171cec3f6ceb7572220d" },
		{ component_id: 1, libc_id: 1, url: "http://nodejs.org/dist/v0.10.48/node-v0.10.48-linux-x64.tar.gz", arch_slug: "x64", checksum: "82f5fe186349ca69d8889d1079dbb86ae77ce54fce5282b806c359ce360cec7b" },
		{ component_id: 1, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v0.10.48/node-v0.10.48-linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "e4dbe1a37a741aaacde1e40ade4d52ad44b584df4cc354461f32e6251ecf12ac" },

		# node 0.12.18
		{ component_id: 2, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.12.18/node-v0.12.18-linux-armel.tar.gz", arch_slug: "armel", checksum: "c502147cc6bbd1e10e9ee8e493a7cf7766870ad83a5e5371e0f291635ef036ae" },
		{ component_id: 2, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.12.18/node-v0.12.18-linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "2bc3c792668c7f345b511b5512aa562b40ce40bac30e745642f48e91a957d9c3" },
		{ component_id: 2, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.12.18/node-v0.12.18-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "cbfed21cbf3822e8523d2071d70d7c38bfce8fe54cc9e13fe72e8bc14934d23a" },
		{ component_id: 2, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.12.18/node-v0.12.18-linux-i386.tar.gz", arch_slug: "i386", checksum: "e2f6d436f39d2ffc2a1d5829dd1d25809e45f7d9055a8ca93692c7e12714f49d" },
		{ component_id: 2, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v0.12.18/node-v0.12.18-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "298c38814fb04f93aa121089d52750989c1b53337135f85f2cd1e2e10b1bee77" },
		{ component_id: 2, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v0.12.18/node-v0.12.18-linux-amd64.tar.gz", arch_slug: "amd64", checksum: "e2f6d436f39d2ffc2a1d5829dd1d25809e45f7d9055a8ca93692c7e12714f49d" },
		
		# node 4.8.3
		{ component_id: 3, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v4.8.3/node-v4.8.3-linux-armel.tar.gz", arch_slug: "armel", checksum: "7be6f13e407bff7eab3883764dca59dbedb751613cf23cbfe75a618a7c3ce333" },
		{ component_id: 3, libc_id: 1, url: "http://nodejs.org/dist/v4.8.3/node-v4.8.3-linux-armv6l.tar.gz", arch_slug: "rpi", checksum: "af669f5fc7cb5269978144a8b6469923657119b3ee712d6bf70167e36b6812c2" },
		{ component_id: 3, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v4.8.3/node-v4.8.3-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "849a55c62a726386649fb9c6da8e41ac3611d8b3a1ac481959516fc95047262a" },
		{ component_id: 3, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v4.8.3/node-v4.8.3-linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "99ea7697fd1a4fc297cbcfca98d920e19a8a5ffead5239db58c6f4383f56e21c" },
		{ component_id: 3, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v4.8.3/node-v4.8.3-linux-i386.tar.gz", arch_slug: "i386", checksum: "a47a28aed8307d4328ce23e5dda57d6b4bde7ddf60b41f354850f1f9cfe37750" },
		{ component_id: 3, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v4.8.3/node-v4.8.3-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "140651bbd447316ac45f7fdf50a11c728f628b1d8e4c9f5deb83b5fe23c87824" },
		{ component_id: 3, libc_id: 1, url: "http://nodejs.org/dist/v4.8.3/node-v4.8.3-linux-x64.tar.gz", arch_slug: "x64", checksum: "52382b93865a5edd834db10e8f60822680d26dc2b8cadccafc351b0082a9052a" },
		{ component_id: 3, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v4.8.3/node-v4.8.3-linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "d9591863975989387aa7369a95eaea11db9183d3c2d56b35cd2e58f15d7e17a3" },

		# node 5.12.0
		{ component_id: 4, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v5.12.0/node-v5.12.0-linux-armel.tar.gz", arch_slug: "armel", checksum: "88c0aafbfcdd2502daf9c41a10407315ba4ea5c29d8869d4c18200ed393d40ef" },
		{ component_id: 4, libc_id: 1, url: "http://nodejs.org/dist/v5.12.0/node-v5.12.0-linux-armv6l.tar.gz", arch_slug: "rpi", checksum: "f58b9db77eb82830157f814704e8c3b3ba3420079a8ded3ad39302a33e3a30af" },
		{ component_id: 4, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v5.12.0/node-v5.12.0-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "79eed93307990a6e39641a544aec5a4483411b6124fc76dd380b64b8d7e0d2b0" },
		{ component_id: 4, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v5.12.0/node-v5.12.0-linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "bbaa5d89b483272f930b65361bc241c5fb694471712af2e15a3afd65e7d1611f" },
		{ component_id: 4, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v5.12.0/node-v5.12.0-linux-i386.tar.gz", arch_slug: "i386", checksum: "566dac853617197601895295e3b679561c908186f9fb79a66668dcb29d689cf2" },
		{ component_id: 4, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v5.12.0/node-v5.12.0-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "eb49f6bb180b2ef05d723c337f996ed8a18e558d5d5c7d601728c07213037ca9" },
		{ component_id: 4, libc_id: 1, url: "http://nodejs.org/dist/v5.12.0/node-v5.12.0-linux-x64.tar.gz", arch_slug: "x64", checksum: "c0f459152aa87aba8a019a95899352170db0d8d52c860715c88356cb253fe2c4" },
		{ component_id: 4, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v5.12.0/node-v5.12.0-linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "898ce95ba34bbb1e2b065e201b5d21af5bc49776ae8c4962db3f80b1ef782ae4" },

		# node 6.10.3
		{ component_id: 5, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v6.10.3/node-v6.10.3-linux-armel.tar.gz", arch_slug: "armel", checksum: "b4435e849d2907f393f7db3462cdf670ffc1860f370673ca65ae4fd1673b11ee" },
		{ component_id: 5, libc_id: 1, url: "http://nodejs.org/dist/v6.10.3/node-v6.10.3-linux-armv6l.tar.gz", arch_slug: "rpi", checksum: "f58b9db77eb82830157f814704e8c3b3ba3420079a8ded3ad39302a33e3a30af" },
		{ component_id: 5, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v6.10.3/node-v6.10.3-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "6f86f96783b9ac77580205a0cd550459af80a3eb311571b6845adb3ec4d46bb2" },
		{ component_id: 5, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v6.10.3/node-v6.10.3-linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "255276ad9becd1938e6a615885a0e47d276a7b09e51ce73613bafe4fbada19bf" },
		{ component_id: 5, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v6.10.3/node-v6.10.3-linux-i386.tar.gz", arch_slug: "i386", checksum: "bc4ad8df8b7f1cd47eb85e2436e5aea0f68316c2d3932f1c9614832ac878303c" },
		{ component_id: 5, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v6.10.3/node-v6.10.3-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "ac4e2cab12dc677f5807637afc52f074d58c88682cac50160065ccc6c77cf2de" },
		{ component_id: 5, libc_id: 1, url: "http://nodejs.org/dist/v6.10.3/node-v6.10.3-linux-x64.tar.gz", arch_slug: "x64", checksum: "c6a60f823a4df31f1ed3a4044d250e322f2f2794d97798d47c6ee4af9376f927" },
		{ component_id: 5, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v6.10.3/node-v6.10.3-linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "731e6f74e7b62ef2d3e61656a9715b7337a742a34b04adf7966a2fbe2be2646b" },

		# node 7.10.0
		{ component_id: 6, libc_id: 1, url: "http://nodejs.org/dist/v7.10.0/node-v7.10.0-linux-armv6l.tar.gz", arch_slug: "rpi", checksum: "659992438c2db5c4c4b69532658a0392033c59a4e29e82736bee9913bf7335df" },
		{ component_id: 6, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v7.10.0/node-v7.10.0-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "bf81ad1ef8ecd6b261f1058f3bedefd0cd9be933d0068a91e87b00fa4afe4272" },
		{ component_id: 6, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v7.10.0/node-v7.10.0-linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "255276ad9becd1938e6a615885a0e47d276a7b09e51ce73613bafe4fbada19bf" },
		{ component_id: 6, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v7.10.0/node-v7.10.0-linux-i386.tar.gz", arch_slug: "i386", checksum: "dcc8b39e3c81ab7c23cf4493250a1d848363d70b94b68a9ab6c6a13b7d6c1140" },
		{ component_id: 6, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v7.10.0/node-v7.10.0-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "ac4e2cab12dc677f5807637afc52f074d58c88682cac50160065ccc6c77cf2de" },
		{ component_id: 6, libc_id: 1, url: "http://nodejs.org/dist/v7.10.0/node-v7.10.0-linux-x64.tar.gz", arch_slug: "x64", checksum: "9da0e99091897795491d21d58c40186f75ca7bf505d145d1a2e558f8c754a81b" },
		{ component_id: 6, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v7.10.0/node-v7.10.0-linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "a031f244756903a1b8dbb56fc992933f1f5f6c7cd5ee19190ed6717f3959d9f6" },

		# node 8.0.0
		{ component_id: 7, libc_id: 1, url: "http://nodejs.org/dist/v8.0.0/node-v8.0.0-linux-armv6l.tar.gz", arch_slug: "rpi", checksum: "46a46f0c9be5b9a87b0836b31c97ea080283f575c04ab77a270c9cc40d4add19" },
		{ component_id: 7, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/node/v8.0.0/node-v8.0.0-linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "fd3633733b4fc82b97a1a87c4fb67b1b7a3654fb9f65e2b96dbbba29f97c629f" },
		{ component_id: 7, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v8.0.0/node-v8.0.0-linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "af278a35732d29d209ae7c33193da674a369d5b7f47304bdeaff3607254c9d19" },
		{ component_id: 7, libc_id: 1, url: "http://nodejs.org/dist/v8.0.0/node-v8.0.0-linux-x86.tar.gz", arch_slug: "x86", checksum: "e012b41f021cb0ff691d40085884623a82a5e79d4763ca3739487d3ba160a79d" },
		{ component_id: 7, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v8.0.0/node-v8.0.0-linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "2c007ababedd0e3b44b5aed6c31258fd643c2c9c67e4331f4231871289585a27" },
		{ component_id: 7, libc_id: 1, url: "http://nodejs.org/dist/v8.0.0/node-v8.0.0-linux-x64.tar.gz", arch_slug: "x64", checksum: "1944f0ead4c9dbdf92a97041cb2ec34cc08ea873958c7009befaa56a7ccea4c2" },
		{ component_id: 7, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/node/v8.0.0/node-v8.0.0-linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "c57045997e1d71310b24fc1fd56453196fd146b854a381715790b9a7c5906e13" },
		
		# no binaries for java

		# python 2.7.13
		{ component_id: 8, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-armel.tar.gz", arch_slug: "armel", checksum: "d1b45a1031161883fa985530095e9eb9f567d3b5fa1c29002d492d25eb73c806" },
		{ component_id: 8, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "94d4aff130a28d5bc8ac4d53cb6ddef6443e668f9ff28f684e500c29e2cbdbdc" },
		{ component_id: 8, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "2f0a1098aaf9b68afc4200fb50a162eb7d6dfe4cf4b49af5f2a1a217fa7e81c0" },
		{ component_id: 8, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "f25d70d062dc5d445fd94bb94c1d62556e0a40c18a8ae9fd1f846bbb44752da2" },
		{ component_id: 8, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-i386.tar.gz", arch_slug: "i386", checksum: "a0891c2ab7962be5ee2b5a2cd2cc773c6e058be96beab8658f04570d96ca6691" },
		{ component_id: 8, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "cb23ad3c96d81cce36bc41f3f81d06d5b3847771663c39054291491b8f9482a6" },
		{ component_id: 8, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "8f6ca55b8430603a92131e639b58dc3a22a546c05e8eccfec4b1d473b3b8c5eb" },
		{ component_id: 8, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v2.7.13/Python-2.7.13.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "a268eb2c46a906645cc2c0e6f5488c9edd1a0133e5acb36a4749e28cc6f41422" },

		# python 3.3.6
		{ component_id: 9, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-armel.tar.gz", arch_slug: "armel", checksum: "fe851731e6b731864ae112b44499091a52f1e504badb79c98578b74a7ee9dc90" },
		{ component_id: 9, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "774dad867f9943caae7ac6296f0a138fcd5160d3d4b75a610b3e387aa284c532" },
		{ component_id: 9, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "53f1de661f8facdef1232fd6f004e31910c6d26a343d97e67d42f1683c2ec8eb" },
		{ component_id: 9, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "ab155560ccebeaefa70efe85c83e8b67a6f4284388fb47594b6cb4d438c1425f" },
		{ component_id: 9, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-i386.tar.gz", arch_slug: "i386", checksum: "26134913cf8254b6f92b0c68b39bf9202d05eda63383ab6aaf531b7d173b786a" },
		{ component_id: 9, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "8370dffa5bc55eb927b3a46770d85433e60bc53dfa69b9e5a19818933a71b280" },
		{ component_id: 9, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "d2eeddb163d9d5f00e910c1e028daeb9dfe2afef4753a4a70d396ef4cabce014" },
		{ component_id: 9, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.3.6/Python-3.3.6.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "69b189207e26ec79a177b3fc7e1c931a123898c7b03bc99daf6aa10c99137c40" },

		# python 3.4.4
		{ component_id: 10, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-armel.tar.gz", arch_slug: "armel", checksum: "257a43c04dd89be16534a599e7b40ca08d8052f17a4e3c6d5965c69af5ccd014" },
		{ component_id: 10, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "66d07fac4b54cfd0622e31e0cdb392bbc47e4f7eed26c40c42fbac1adbf9d3ad" },
		{ component_id: 10, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "e4e3b7bb8844c530aa1a4c6725c540bf955e93a9b6124c34ae0fa5f8c06375ff" },
		{ component_id: 10, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "cce4e51a32aa41dfe52e498f55d84c1168a204852fea1c36243d9a7c9267d598" },
		{ component_id: 10, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-i386.tar.gz", arch_slug: "i386", checksum: "84074af8c676a35e1546eceb86008111dd9106a2eb949d78d7146879489c3b4e" },
		{ component_id: 10, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "ad97ac09ff348833673b80142eb3c6ca8e8658390a412060b4de3320701ec45b" },
		{ component_id: 10, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "839b3ae30b1feeedef288bf1bf23ff0e3ffaa70fe12d84e4a528d4cc1cbd09bc" },
		{ component_id: 10, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.4.4/Python-3.4.4.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "9cee1893c03b2353772a685c69f783345bcffd7d9aacebf5e6963f086160e122" },

		# python 3.5.2
		{ component_id: 11, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-armel.tar.gz", arch_slug: "armel", checksum: "c6b82b7a67dbfc4aef8b9eb67144cb4efff609e4006a2d416e80c0e0b0f60ab7" },
		{ component_id: 11, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "b56a0db217fa26cd88d86c38fba09ce33f5f5672f3051b296f2b56e2169adb48" },
		{ component_id: 11, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "31ccb530df0d099522c41e7a67b43b56b1ea78f844f32cba86b72f9d24636054" },
		{ component_id: 11, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "6c2ab7eb3d117d383bce57ec52abc815a7855d2e0331886ee4f49b9dbf312793" },
		{ component_id: 11, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-i386.tar.gz", arch_slug: "i386", checksum: "4b0017defec3ab436d03a2e96514b9c10ed79b163b7becbd9de953e89ce4651c" },
		{ component_id: 11, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "42744077fa8a262c1df8e4284d073d6d694e5ad73b265507c2b36514011eba48" },
		{ component_id: 11, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "f0635e0501765c01dab68cd80949b9d4830834e1a5359468a9d94d0675edbaee" },
		{ component_id: 11, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.5.2/Python-3.5.2.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "c9677c0b5f109e63827db46fed1b37fe31856edbd5600861f87365dc9d464198" },

		# python 3.6.1
		{ component_id: 12, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-armel.tar.gz", arch_slug: "armel", checksum: "94ae2d66f762a2e49c4b1a13498451904a501381f4ac80ddeb179b037e857617" },
		{ component_id: 12, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "85e7295f5194ee2c099cfcf2a27e186d9714e849468bf1fa52292be6b2217621" },
		{ component_id: 12, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "8f93b45014190cd8fbd4dd7a35aa2c34260a7370cea9ba7ed78f9a4e52cb042d" },
		{ component_id: 12, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "34eec398575e3914066534c5b1e1c591ad49e0b0c35dd3a3367dcde1c1877975" },
		{ component_id: 12, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-i386.tar.gz", arch_slug: "i386", checksum: "4d46231eae615982a8937239d81c7b9ab52cfaa019567c7afe0324d9040013f7" },
		{ component_id: 12, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "f2f0440fa81246d6469f85dab4cbf2911f7eaa056beb642a74915f486a956274" },
		{ component_id: 12, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "d2cfc00742057199b7de4550267aa2dd0f8fb6ddca3ffe532def409ddbf4f302" },
		{ component_id: 12, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/python/v3.6.1/Python-3.6.1.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "d949de343d5c500bd28de0bcb53e393e66a750f3dc258887d5073ba957d4a2b3" },

		# go 1.4.3
		{ component_id: 13, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.4.3/go1.4.3.linux-armel.tar.gz", arch_slug: "armel", checksum: "0609ee8768016359fb341c076e44aed35bba7a0e13272f2f1b3ba4b320ae6a86" },
		{ component_id: 13, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.4.3/go1.4.3.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "b969971dd5390af9839ee113b4ac051e9053e7c34387a1c1dc16a207bcd4d5f6" },
		{ component_id: 13, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.4.3/go1.4.3.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "59c7e40992347bc3511765bcaa607ad5825a0d958ab9d211e2856ed755ca5a09" },
		{ component_id: 13, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.4.3/go1.4.3.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "d9ba0116db22b9711c36d42649387c6b84cfd932133c0e763a9d1ad770188a81" },
		{ component_id: 13, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.4.3.linux-386.tar.gz", arch_slug: "386", checksum: "20c666025dd84dd7f2ec856aa5c0c104b6477c13b564113555b048a65e105306" },
		{ component_id: 13, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.4.3/go1.4.3.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "91e5c8ee3248d869977ce20342c265b3a62806188d5078f0e3a0a24c9094c0ea" },
		{ component_id: 13, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.4.3.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "ce3140662f45356eb78bc16a88fc7cfb29fb00e18d7c632608245b789b2086d2" },
		{ component_id: 13, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.4.3/go1.4.3.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "0126aa246cec7f9489c97fd083da26db31680f36d9141b2f38a59efbc73b8946" },

		# go 1.5.4
		{ component_id: 14, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.5.4/go1.5.4.linux-armel.tar.gz", arch_slug: "armel", checksum: "d593a3da6bbdc228dea8ccee8575100a4b262205d0aa458022663a8137701f54" },
		{ component_id: 14, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.5.4/go1.5.4.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "05e35bbc6a6b62e79f23980ef3d5071a2c5fee7eaa08057311aba2dec5d2301b" },
		{ component_id: 14, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.5.4/go1.5.4.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "fdb1003503ed24b204a267b5698fec3601bad7ee56c70097817612197ad90a8d" },
		{ component_id: 14, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.5.4/go1.5.4.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "d5ec25bdadd2407196cf55823e8b20d6ee961e4e12f3d0e5d29ec8ed924fbe0d" },
		{ component_id: 14, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.5.4.linux-386.tar.gz", arch_slug: "386", checksum: "4b2b29d44144d0d306ba34ca5559aa9314c8f31165421ade2b59c74c28059690" },
		{ component_id: 14, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.5.4/go1.5.4.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "76c75c7b1d532e1484422fc5d6b000b38232e340cb6a7944268ef8376a154770" },
		{ component_id: 14, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.5.4.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "a3358721210787dc1e06f5ea1460ae0564f22a0fbd91be9dcd947fb1d19b9560" },
		{ component_id: 14, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.5.4/go1.5.4.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "d6a0ef0db641f9fb16da7714313b18f04325f4d12abe8cb8b7916d2541bc666d" },

		# go 1.6.4
		{ component_id: 15, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.6.4/go1.6.4.linux-armel.tar.gz", arch_slug: "armel", checksum: "154d1f39339b37afec1b4f2ee095870bdf83630a99568d586295b6cbddf14db8" },
		{ component_id: 15, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.6.4/go1.6.4.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "4452a3343c3b35a4250655100a3d9050391ab38e4fc72d8ce2cfc80cb8822cd2" },
		{ component_id: 15, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.6.4/go1.6.4.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "2e1041466b9bdffb1c07c691c2cfd6346ee3ce122f57fdf92710f24a400dc4e6" },
		{ component_id: 15, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.6.4/go1.6.4.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "0771bc6209ab359df2dc73ceb0bd06e6d2751b016dd7165dfb3512b86620bfaf" },
		{ component_id: 15, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.6.4.linux-386.tar.gz", arch_slug: "386", checksum: "d9a4524dd6192bfa180fe462a468aa92fbeb0cca4887d16a9496064ceef1e94b" },
		{ component_id: 15, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.6.4/go1.6.4.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "ec8866f2679b7094ca88450dfe056ae5965973972a9d823412dd7032997bd3d3" },
		{ component_id: 15, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.6.4.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "b58bf5cede40b21812dfa031258db18fc39746cc0972bc26dae0393acc377aaf" },
		{ component_id: 15, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.6.4/go1.6.4.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "323ead62917dea1765cbb0ad3de92c6f9a312db13467c0cad2cb5b942ddca3c4" },

		# go 1.7.5
		{ component_id: 16, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.7.5/go1.7.5.linux-armel.tar.gz", arch_slug: "armel", checksum: "b3ae76529482d3d4a754cdbc1fecf1a3047d66363b3d1090da0e300714d20f79" },
		{ component_id: 16, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.7.5/go1.7.5.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "88677b88f7b32e813c6bbbeb9ce2d1a00d687b50c077b5c7275d28ecbb6d16eb" },
		{ component_id: 16, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.7.5/go1.7.5.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "4dc6e9e851bd48b92b758ff2127ffc5ac7320b35e1dd1b7aa51e74191fbee259" },
		{ component_id: 16, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.7.5/go1.7.5.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "445b61cd7fbb8246769bf394a9e930cc6fc90c14bd90dbf49d41127af23759d2" },
		{ component_id: 16, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.7.5.linux-386.tar.gz", arch_slug: "386", checksum: "432cb92ae656f6fe1fa96a981782ef5948438b6da6691423aae900918b1eb955" },
		{ component_id: 16, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.7.5/go1.7.5.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "5ff6b0c132090dc8ae58858de22eab771d416adfdfba4b5272876ce4ef93c613" },
		{ component_id: 16, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.7.5.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "2e4dd6c44f0693bef4e7b46cc701513d74c3cc44f2419bf519d7868b12931ac3" },
		{ component_id: 16, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.7.5/go1.7.5.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "0b067f4986c76486e5de65ac21c660cca586851f0a5f41adee4c6f5e492774f9" },

		# go 1.8
		{ component_id: 17, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.8/go1.8.linux-armel.tar.gz", arch_slug: "armel", checksum: "e44bf1c0eb74228f6ee82fdb064b82426db871cc971aab456ed85ea4f89bb4e0" },
		{ component_id: 17, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.8/go1.8.linux-armv6hf.tar.gz", arch_slug: "armv6hf", checksum: "64a0bb2ee38061c5f011483a36116dcd4decf07d192d63ac24319524080aea87" },
		{ component_id: 17, libc_id: 1, url: "http://resin-packages.s3.amazonaws.com/golang/v1.8/go1.8.linux-armv7hf.tar.gz", arch_slug: "armv7hf", checksum: "3a70cfa425cd09b0e549640a483f3c0d034269a2bfc3f47da7f373d16cfe4aa8" },
		{ component_id: 17, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.8/go1.8.linux-alpine-armhf.tar.gz", arch_slug: "armv7hf", checksum: "d9759ca7bef54e6ca4da6fc690481c51604ded60ad2265facf1986121bcc1fa0" },
		{ component_id: 17, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.8.linux-386.tar.gz", arch_slug: "386", checksum: "8f618dc8b01c2e53e639a38d780645b8424e671e292c7b518248022205d6a448" },
		{ component_id: 17, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.8/go1.8.linux-alpine-i386.tar.gz", arch_slug: "i386", checksum: "34d671dc010bc4f45bf9baee33148cea4034bddf6e373f4469e0f09025ba1351" },
		{ component_id: 17, libc_id: 1, url: "https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz", arch_slug: "amd64", checksum: "53ab94104ee3923e228a2cb2116e5e462ad3ebaeea06ff04463479d7f12d27ca" },
		{ component_id: 17, libc_id: 2, url: "http://resin-packages.s3.amazonaws.com/golang/v1.8/go1.8.linux-alpine-amd64.tar.gz", arch_slug: "amd64", checksum: "a13caaca2e7e2522272316a3fac05999493df0d7e5dda118511124ec48c50b3a" },
	]
}

generate = (stack_version, distro_version, hw, variant) ->
	hasVariant = data.variant_is_compatible_with_distro_and_stack.some (r) ->
		r.variant_slug is variant.slug and r.distro_slug is distro_version.distro_slug and r.stack_slug is stack_version.stack_slug

	if hw.arch_slug
		hwArchs = _.find(data.arch, slug: device.arch_slug).can_run
	else
		hwArchs = [ hw.slug ]

	distroVersionArchs = _.filter(data.distro_version_supports_arch, distro_version_id: distro_version.id).map(({arch_slug}) -> arch_slug)
	distro_arch = _.intersection(hwArchs, distroVersionArchs).pop()

	stackVersionArchs = _.filter(data.stack_version_supports_arch, stack_version_id: stack_version.id).map(({arch_slug}) -> arch_slug)
	stack_arch = _.intersection(hwArchs, stackVersionArchs).pop()

	if _.filter(data.distro_supports_hw, distro_slug: distro_version.distro_slug).length isnt 0 and not _.find(data.distro_supports_hw, { distro_slug: distro_version.distro_slug, hw_id: hw.slug })
		return false

	if not (hasVariant and distro_arch and stack_arch)
		return false

	components = _.filter(data.component, stack_version_id: stack_version.id)

	components = components.map( (component) ->
		ret = _.cloneDeep(component)
		ret.blob = _.find(data.blob, { component_id: component.id, libc_id: distro_version.libc_id, arch_slug: stack_arch })
		return [ component.slug, ret ]
	)

	components = _.fromPairs(components)

	obj = _.cloneDeep({hw, stack_version, distro_version, variant })
	obj.stack_version.arch_slug = stack_arch
	obj.distro_version.arch_slug = distro_arch
	obj.stack_version.components = components

	expand = (obj) ->
		foo = _.toPairs(obj)
		.filter(([key]) -> key isnt 'id')
		.map ([key, value]) ->
			if key.endsWith("_id")
				key = key.slice(0, -3)
				value =  _.find(data[key], id: value)
			else if key.endsWith("_slug")
				key = key.slice(0, -5)
				value = _.find(data[key], slug: value)

			if _.isObject(value) and not _.isArray(value)
				value = expand(value)

			if key in ["distro_version", "stack_version"]
				key = key.slice(0, -8)
				value = _.merge(value[key], value)
				delete value[key]

			[ key, value ]
		return _.fromPairs(foo)

	return expand(obj)

for stack_version in data.stack_version
	for distro_version in data.distro_version
		for device in data.device
			for variant in data.variant
				obj = generate(stack_version, distro_version, device, variant)
				if obj
					console.log(JSON.stringify(obj))

for stack_version in data.stack_version
	for distro_version in data.distro_version
		for arch in data.arch
			for variant in data.variant
				obj = generate(stack_version, distro_version, arch, variant)
				if obj
					console.log(JSON.stringify(obj))

