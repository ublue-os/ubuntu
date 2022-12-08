[![build-ublue](https://github.com/castrojo/ublue-image/actions/workflows/build.yml/badge.svg)](https://github.com/castrojo/ublue-image/actions/workflows/build.yml)

# ublue-image
A familiar(ish) Ubuntu desktop for Fedora Silverblue.
This is a containerized version of [ublue](https://ublue.it) utilizing the latest image based features in ostree.

> "Let's see what's out there." - Jean-Luc Picard

# Usage

WARNING: This is still experimental. You should have Fedora Silverblue 37 already installed:

    sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/castrojo/ublue-image:latest

# Features

This is intended to be an example of how you can derive custom OCI images of your operating system, built out of git and then pushed to a registry.
This image is then splatted onto your disk, therefore eliminating the risk of you mangling repos or having to reset before upgrades. 
Imagine Silverblue but pushed even more into cloud-native land and I'm the conductor, honk honk. 

### Changes from stock Silverblue

- Start with a base Fedora Silverblue 37 image
- Removes Firefox from the base image
- Adds the following packages to the base image:
  - distrobox and gnome-tweaks
  - Dash to Dock and Appindicator GNOME Extensions
- Sets automatic staging of updates for the system 
- Sets flatpaks to update twice a day

### Applications

- Mozilla Firefox, Mozilla Thunderbird, Extension Manager, Libreoffice, DejaDup, FontDownloader, Flatseal, and the Celluloid Media Player
- Core GNOME Applications installed from Flathub
  - GNOME Calculator, Calendar, Characters, Connections, Contacts, Evince, Firmware, Logs, Maps, NautilusPreviewer, TextEditor, Weather, baobab, clocks, eog, and font-viewer
- All applications installed per user instead of system wide, similar to openSUSE MicroOS. Thanks for the inspiration Team Green!

### Choose Team Blue or Team Orange

![image](https://user-images.githubusercontent.com/1264109/205803912-cbce5490-762f-4674-8fc1-8cb498884dfa.png)

After installation is finished you can either keep the normal Fedora desktop, or choose a subset of Ubuntu's desktop layout.
Personally I prefer the Ubuntu desktop on my desktops and laptops but upstream GNOME on my tablet and 2-and-1. 
Go figure.

## Other Details

Images are built here once a day and when changes are pushed to this repo.
As the Fedora Silverblue images update those changes will propogate to you via this image automatically.
I'll adjust this based on what Fedora does image publication wise so we're nice and efficient.

## Frequently Asked Questions

What about codecs?

> So far pulling in Firefox and Celluloid pull in all the right stuff, it's unlikely you'll need extra codecs on the base image.

Are you planning on adding more apps and stuff?

> Not really, but I'm hoping to do more images like -gaming, -cloudnative, etc. that derive off of this base image.

Ugh man why didn't you do nvidia drivers while you're at it?

> I don't have the hardware to test, but you know someone's going to do it, this is really new stuff, part of the reason I am doing this is to show others that this is possible!

I chose the wrong desktop, how do I rerun the initial wizard thing?

> Run `/usr/bin/ublue-firstboot` to rerun the script. 

Should I trust you?

> This is all hosted, built, and pushed on GitHub. As far as if I'm a trustable fellow, here's my [bio](https://www.ypsidanger.com/about/). If you've made it this far then hopefully you've come to the conclusion on how easy it would be to build all of this on your own trusted machinery. :smile:
