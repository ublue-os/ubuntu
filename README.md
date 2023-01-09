[![build-ublue](https://github.com/ublue-os/ubuntu/actions/workflows/build.yml/badge.svg)](https://github.com/ublue-os/ubuntu/actions/workflows/build.yml)

# Ubuntu
A familiar(ish) Ubuntu desktop for Fedora Silverblue.
This is a containerized version of [ublue](https://ublue.it) utilizing the latest image based features in ostree.
You'll need to have Fedora Silverblue installed to rebase to this image (see below). 
We anticipate that at some point the Fedora installer will grow an ability to install a custom image. 

It is an interpretation of "What if we could rebuild Ubuntu from the ground up built on cloud-native technology?"
The goal is to provide an Ubuntu experience using the most amount of automation possible.
The endstate is a system as reliable as a Chromebook with near-zero maintainance, but with the power of Ubuntu and Fedora fused together. 

![image](https://user-images.githubusercontent.com/1264109/209229025-ad64ee88-50c1-4344-a5af-6e76da36b72f.png)

> "Let's see what's out there." - Jean-Luc Picard

# Usage

> **Warning** 
> This is an experimental feature and should not be used in production, try it in a VM for a while, you have been warned!

1. Download and install [Fedora Silverblue](https://silverblue.fedoraproject.org/download)
1. After you reboot you should [pin the working deployment](https://docs.fedoraproject.org/en-US/fedora-silverblue/faq/#_about_using_silverblue) so you can safely rollback. 
1. Open a terminal and rebase the OS to this image:

        sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ublue-os/ubuntu:latest
        
1. Reboot the system and you're done!

1. To revert back:

        sudo rpm-ostree rebase fedora:fedora/37/x86_64/silverblue

Check the [Silverblue documentation](https://docs.fedoraproject.org/en-US/fedora-silverblue/) for instructions on how to use rpm-ostree. 
We build date tags as well, so if you want to rebase to a particular day's release:
  
    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ublue-os/ubuntu:20221217 

The `latest` tag will automatically point to the latest build. 

# Features

**This image heavily utilizes _cloud-native concepts_.** 

System updates are image-based and automatic. Applications are logically seperated from the system by using Flatpaks, and the CLI experience is contained within OCI containers: 

- Ubuntu-like GNOME layout
  - Includes the following GNOME Extensions
    - Dash to Dock - for a more Unity-like dock
    - Appindicator - for tray-like icons in the top right corner
    - GSConnect - Integrate your mobile device with your desktop
    - GNOME Variable Refresh Rate patches included via the [GNOME VRR COPR](https://copr.fedorainfracloud.org/coprs/kylegospo/gnome-vrr/)
- GNOME Software with Flathub
    - Use a familiar software center UI to install graphical software
- Built-in Ubuntu user space 
    - Official Ubuntu LTS cloud image 
      - `Ctrl`-`Alt`-`u` - will launch an Ubuntu image inside a terminal via [Distrobox](https://github.com/89luca89/distrobox), your home directory will be transparently mounted
      - A [BlackBox terminal](https://www.omgubuntu.co.uk/2022/07/blackbox-gtk4-terminal-emulator-for-gnome) is used just for this configuration
      - Use this container for your typical CLI needs or to install software that is not available via Flatpak or Fedora 
      - Refer to the [Distrobox documentation](https://distrobox.privatedns.org/#distrobox) for more information on using and configuring custom images
    - GNOME Terminal
      - `Ctrl`-`Alt`-`t` - will launch a host-level GNOME Terminal if you need to do host-level things in Fedora (you shouldn't need to do much).   
- Kubernetes Tools
    - [kind](https://kind.sigs.k8s.io/) - Do a `kind create cluster` to get started!
    - [kubectl](https://kubernetes.io/docs/reference/kubectl/)
- Quality of Life Improvements
    - systemd shutdown timers adjusted to 15 seconds
    - udev rules for game controllers included out of the box
- Built on top of the the [uBlue base image](https://github.com/ublue-os/base) 
  - System designed for automatic staging of updates
    - If you've never used an image-based Linux before just use your computer normally
    - Don't overthink it, just shut your computer off when you're not using it

### Future Features

These are currently unimplemented ideas that we plan on adding:

- Provide a `:lts` tag derived from CentOS Stream for a more enterprise-like cadence
- Inclusion of more Ubuntu artwork

### Applications

- Mozilla Firefox, Mozilla Thunderbird, Extension Manager, Libreoffice, DejaDup, FontDownloader, Flatseal, and the Celluloid Media Player
- Core GNOME Applications installed from Flathub
  - GNOME Calculator, Calendar, Characters, Connections, Contacts, Evince, Firmware, Logs, Maps, NautilusPreviewer, TextEditor, Weather, baobab, clocks, eog, and font-viewer
- All applications installed per user instead of system wide, similar to openSUSE MicroOS. Thanks for the inspiration Team Green!

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/ublue-os/ubuntu

## Frequently Asked Questions

What about codecs?

> It's unlikely you'll need extra codecs, Flathub provides everything you need. You might need to [force enable hardware acceleration](https://fedoraproject.org/wiki/Firefox_Hardware_acceleration#Web_page_rendering) in Firefox directly. 

Are you planning on adding more apps and stuff?

> Not really, but I'm hoping to do more images like -gaming, -cloudnative, etc. that derive off of this base image. Once we figure out a way to cleanly split out application installation from the base image we'll split it up to make it easy to customize.

I cancelled the first run thing or it failed, how do I rerun it?

> Running `/usr/bin/ublue-firstboot` will restart the process. You might need to delete `~/.config/ublue/firstboot-done` if you ever want to rerun it again.  

Ugh man why didn't you do nvidia drivers while you're at it?

> I don't have the hardware to test, but you know someone's going to do it, this is really new stuff, part of the reason I am doing this is to show others that this is possible!

Should I trust you?

> This is all hosted, built, and pushed on GitHub. As far as if I'm a trustable fellow, here's my [bio](https://www.ypsidanger.com/about/). If you've made it this far then hopefully you've come to the conclusion on how easy it would be to build all of this on your own trusted machinery. :smile:
