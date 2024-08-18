# mptsd

mptsd receives MPEG-TS streams from multicast (UDP/RTP) or HTTP and combines them into one multiple program stream that is suitable for output to a DVB-C modulator. It has been tested with the Dektec DTE-3114 Quad QAM Modulator and is used in production in several small DVB networks.

Check out the [Wiki](https://github.com/TVforME/mptsd/wiki) for examples of use.

## Installation

mptsd does not depend on any external libraries. There are two source code dependencies that come with mptsd - `libfuncs` and `libtsfuncs`.

Make sure your kernel has `CONFIG_HIGH_RES_TIMERS` enabled. Otherwise, the sleep timeout may not be able to calibrate itself, and mptsd will not work.

## Documentation

mptsd is controlled using command line parameters. Run `mptsd` to see all of the parameters and an explanation of what each one does. Additionally, there are 4 configuration files. Example files are included in the distribution, which you can modify to suit your needs.

- `mptsd.conf` - Configures the `network_id` in the outputted NIT table and also MPEG PSI tables playout timeouts.
- `mptsd_nit.conf` - Configures NIT table output.
- `mptsd_channels.conf` - Configures inputs, SDT provider name, and `transport_stream_id`.
- `mptsd_epg.conf` - Configures EIT current/next tables. This file is auto-reloaded when it is changed, allowing EPG in the output to work.

One mptsd instance should be used for each transponder.

## Output Stream

mptsd can achieve perfect PCR restamping to output using `-m 3`. This is useful for hardware modulators that require correct PCR values (most cheap modulators do, so always use `-m 3` with them). mptsd was tested and found to be working well with the Dektec DTE-3114 & HiDes UT-100C.

To enable RTP output instead of plain UDP for network streams, specify the SSRC identifier via the `-s` flag (must be != 0).

# How to Build and Install `mptsd` from Source using meson build system.

This guide provides step-by-step instructions on how to build and install the `mptsd` project from source using the Meson build system. Additionally, it explains how to strip the `mptsd` binary post-installation to reduce its size.
The make build remains as a second option if you not wanting to install meson and ninja on your system.

Before you begin, ensure that the following dependencies installed on your system:

- **Meson Build System**: Version 1.3.2 or later
- **Ninja Build System**: Version 1.11.1 or later
- **GCC Compiler**: Version 13.2.0 or later
- **Git**: To clone the repository

### Installing Dependencies on Ubuntu

You can install the required dependencies using `apt`:

```bash
sudo apt update
sudo apt install meson ninja-build gcc git
```

### Clone the repository:

```bash
git clone https://github.com/TVforME/mptsd.git
cd mptsd
```
## Set up the build directory

```bash
meson setup builddir
```
### Compile the project

```bash
meson compile -C builddir
```

### Install the executable

```bash
meson install -C builddir
```

### Clean the build directory (if necessary)

```bash
meson compile -C builddir clean_custom
```
