FROM ghcr.io/ublue-os/base:latest
# See https://pagure.io/releng/issue/11047 for final location

COPY etc /etc
COPY usr /usr

RUN wget https://copr.fedorainfracloud.org/coprs/lyessaadi/blackbox/repo/fedora-37/lyessaadi-blackbox-fedora-37.repo -O /etc/yum.repos.d/lyessaadi-blackbox.repo

RUN rpm-ostree install gnome-shell-extension-appindicator gnome-shell-extension-dash-to-dock yaru-theme \
    openssl gnome-shell-extension-gsconnect nautilus-gsconnect blackbox-terminal && \
    systemctl unmask dconf-update.service && \
    systemctl enable dconf-update.service && \
    systemctl enable rpm-ostree-countme.service && \
    fc-cache -f /usr/share/fonts/ubuntu && \
    ostree container commit
