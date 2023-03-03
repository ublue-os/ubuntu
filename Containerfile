ARG FEDORA_MAJOR_VERSION=37

FROM ghcr.io/ublue-os/silverblue-main:${FEDORA_MAJOR_VERSION}

COPY etc /etc
COPY usr /usr

COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os-udev-rules /
COPY --from=ghcr.io/ublue-os/config:latest /files/ublue-os-update-services /

COPY ublue-firstboot /usr/bin
COPY recipe.yml /etc/ublue-recipe.yml

RUN wget https://github.com/terrapkg/subatomic-repos/raw/main/terra.repo -O /etc/yum.repos.d/terra.repo
RUN wget https://copr.fedorainfracloud.org/coprs/kylegospo/gnome-vrr/repo/fedora-$(rpm -E %fedora)/kylegospo-gnome-vrr-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-gnome-vrr.repo
RUN wget https://copr.fedorainfracloud.org/coprs/sunwire/input-remapper/repo/fedora-37/sunwire-input-remapper-fedora-37.repo -O /etc/yum.repos.d/sunwire-input-remapper-fedora-37.repo
RUN wget https://copr.fedorainfracloud.org/coprs/kylegospo/webapp-manager/repo/fedora-37/kylegospo-webapp-manager-fedora-37.repo -O /etc/yum.repos.d/kylegospo-webapp-manager-fedora-37.repo
RUN rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:kylegospo:gnome-vrr mutter gnome-control-center gnome-control-center-filesystem
RUN rpm-ostree override remove gnome-software-rpm-ostree firefox firefox-langpacks
RUN rpm-ostree install blackbox-terminal gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-blur-my-shell gnome-shell-extension-gsconnect nautilus-gsconnect \
    libgda libgda-sqlite libratbag-ratbagd openssl podman-docker python3-input-remapper \
    tailscale virt-manager wireguard-tools webapp-manager yaru-theme && \
    rm -f /var/lib/unbound/root.key && \
    rm -f /var/lib/freeipmi/ipckey && \
    systemctl unmask dconf-update.service && \
    systemctl enable dconf-update.service && \
    systemctl enable rpm-ostree-countme.service && \
    systemctl enable tailscaled.service && \
    fc-cache -f /usr/share/fonts/ubuntu && \
    rm -f /etc/yum.repos.d/terra.repo && \
    rm -f /etc/yum.repos.d/_copr_kylegospo-gnome-vrr.repo && \
    rm -f /etc/yum.repos.d/tailscale.repo && \
    rm -f /etc/yum.repos.d/sunwire-input-remapper-fedora-37.repo && \
    rm -f /etc/yum.repos.d/kylegospo-webapp-manager-fedora-37.repo && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    ostree container commit

# K8s tools

COPY --from=cgr.dev/chainguard/kubectl:latest /usr/bin/kubectl /usr/bin/kubectl
COPY --from=cgr.dev/chainguard/cosign:latest /usr/bin/cosign /usr/bin/cosign

RUN curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.17.0/kind-$(uname)-amd64"
RUN chmod +x ./kind
RUN mv ./kind /usr/bin/kind
