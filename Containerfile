ARG FEDORA_MAJOR_VERSION=37

FROM ghcr.io/ublue-os/base:${FEDORA_MAJOR_VERSION}
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc
COPY usr /usr

COPY --from=ghcr.io/ublue-os/udev-rules etc/udev/rules.d/* /etc/udev/rules.d

RUN wget https://copr.fedorainfracloud.org/coprs/lyessaadi/blackbox/repo/fedora-37/lyessaadi-blackbox-fedora-37.repo -O /etc/yum.repos.d/lyessaadi-blackbox.repo
RUN wget https://copr.fedorainfracloud.org/coprs/kylegospo/gnome-vrr/repo/fedora-$(rpm -E %fedora)/kylegospo-gnome-vrr-fedora-$(rpm -E %fedora).repo -O /etc/yum.repos.d/_copr_kylegospo-gnome-vrr.repo
RUN wget https://copr.fedorainfracloud.org/coprs/sunwire/input-remapper/repo/fedora-37/sunwire-input-remapper-fedora-37.repo -O /etc/yum.repos.d/sunwire-input-remapper-fedora-37.repo
RUN rpm-ostree override replace --experimental --from repo=copr:copr.fedorainfracloud.org:kylegospo:gnome-vrr mutter gnome-control-center gnome-control-center-filesystem

RUN rpm-ostree install blackbox-terminal gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock \
    gnome-shell-extension-gsconnect nautilus-gsconnect just libgda libgda-sqlite libratbag-ratbagd openssl podman-docker \
    python3-input-remapper tailscale virt-manager wireguard-tools yaru-theme && \
    rm -f /var/lib/unbound/root.key && \
    systemctl unmask dconf-update.service && \
    systemctl enable dconf-update.service && \
    systemctl enable rpm-ostree-countme.service && \
    systemctl enable tailscaled.service && \
    fc-cache -f /usr/share/fonts/ubuntu && \
    rm -f /etc/yum.repos.d/lyessaadi-blackbox.repo && \
    rm -f /etc/yum.repos.d/_copr_kylegospo-gnome-vrr.repo && \
    rm -f /etc/yum.repos.d/tailscale.repo && \
    rm -f /etc/yum.repos.d/sunwire-input-remapper-fedora-37.repo && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf && \
    sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf && \
    ostree container commit

# K8s tools

COPY --from=cgr.dev/chainguard/kubectl:latest /usr/bin/kubectl /usr/bin/kubectl
COPY --from=cgr.dev/chainguard/cosign:latest /usr/bin/cosign /usr/bin/cosign

RUN curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.17.0/kind-$(uname)-amd64"
RUN chmod +x ./kind
RUN mv ./kind /usr/bin/kind
