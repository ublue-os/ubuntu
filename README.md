[![build-ublue](https://github.com/ublue-os/ubuntu/actions/workflows/build.yml/badge.svg)](https://github.com/ublue-os/ubuntu/actions/workflows/build.yml)

# Ubuntu
A familiar(ish) Ubuntu desktop for Fedora Silverblue.
This is a containerized version of [ublue](https://ublue.it) utilizing the latest image based features in ostree.
You'll need to have Fedora Silverblue installed to rebase to this image (see below). 
We anticipate that at some point the Fedora installer will grow an ability to install a custom image. 

It is an interpretation of "What if we could rebuild Ubuntu from the ground up built on cloud-native technology?" 

> "Let's see what's out there." - Jean-Luc Picard

# Usage

Warning: This is an experimental feature and should not be used in production, try it in a VM for a while, you have been warned!

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ublue-os/ubuntu:latest

We build date tags as well, so if you want to rebase to a particular day's release:
  
    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/ublue-os/ubuntu:20221217 

The `latest` tag will automatically point to the latest build. 

# Features

### Changes from stock Fedora

- Ubuntu-like GNOME layout
  - Includes the following GNOME Extensions
    - Dash to Dock - for a more Unity-like dock
    - Appindicator - for tray-like icons in the top right corner
    - GSConnect - Integrate your mobile device with your desktop
- Built on top of the the [uBlue base image](https://github.com/ublue-os/base) - the system is designed for automatic staging of updates, we recommend shutting down your computer when not using it to ensure all updates are being applied

### Future Features

These are currently unimplemented ideas that we plan on adding:

- Include a preconfigured Ubuntu LTS distrobox
- Provide a `:lts` tag derived from CentOS Stream for a more enterprise-like cadence
- Inclusion of more Ubuntu artwork

### Applications

- Mozilla Firefox, Mozilla Thunderbird, Extension Manager, Libreoffice, DejaDup, FontDownloader, Flatseal, and the Celluloid Media Player
- Core GNOME Applications installed from Flathub
  - GNOME Calculator, Calendar, Characters, Connections, Contacts, Evince, Firmware, Logs, Maps, NautilusPreviewer, TextEditor, Weather, baobab, clocks, eog, and font-viewer
- All applications installed per user instead of system wide, similar to openSUSE MicroOS. Thanks for the inspiration Team Green!

## Frequently Asked Questions

What about codecs?

> So far pulling in Firefox and Celluloid pull in all the right stuff, it's unlikely you'll need extra codecs

Are you planning on adding more apps and stuff?

> Not really, but I'm hoping to do more images like -gaming, -cloudnative, etc. that derive off of this base image. Once we figure out a way to cleanly split out application installation from the base image we'll split it up to make it easy to customize.

I cancelled the first run thing or it failed, how do I rerun it?

> Running `/usr/bin/ublue-firstboot` will restart the process. You might need to delete `~/.config/ublue/firstboot-done` if you ever want to rerun it again.  

Ugh man why didn't you do nvidia drivers while you're at it?

> I don't have the hardware to test, but you know someone's going to do it, this is really new stuff, part of the reason I am doing this is to show others that this is possible!

Should I trust you?

> This is all hosted, built, and pushed on GitHub. As far as if I'm a trustable fellow, here's my [bio](https://www.ypsidanger.com/about/). If you've made it this far then hopefully you've come to the conclusion on how easy it would be to build all of this on your own trusted machinery. :smile: