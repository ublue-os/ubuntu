# Changelog

## [1.1.0](https://github.com/ublue-os/ubuntu/compare/v1.0.0...v1.1.0) (2023-05-01)


### Features

* add blur-my-shell gnome extension ([8161cfd](https://github.com/ublue-os/ubuntu/commit/8161cfda9cf93d0f12ff6df1eabdf667ea31ce04))
* add cosign on the image ([#38](https://github.com/ublue-os/ubuntu/issues/38)) ([2c3f264](https://github.com/ublue-os/ubuntu/commit/2c3f264e4f566c4ce8712521551ede4abab3c8ae))
* add dependabot to update actions ([#52](https://github.com/ublue-os/ubuntu/issues/52)) ([8f23063](https://github.com/ublue-os/ubuntu/commit/8f23063a4d334067d3137b91206163da441ab632))
* add Fedora 38 build, build one hour behind the base image ([#33](https://github.com/ublue-os/ubuntu/issues/33)) ([0f86568](https://github.com/ublue-os/ubuntu/commit/0f86568bcc9fad971b53d2f896ce4108e8a2657b))
* add gaming, yubikey, and other udev rules ([#50](https://github.com/ublue-os/ubuntu/issues/50)) ([43b2fb2](https://github.com/ublue-os/ubuntu/commit/43b2fb263b82e7280ac39310cadec55048c73ad6))
* add virt-manager ([#35](https://github.com/ublue-os/ubuntu/issues/35)) ([592b389](https://github.com/ublue-os/ubuntu/commit/592b389fa182f7ede99ea8a78a530156f493c886))
* add webapp-manager ([#42](https://github.com/ublue-os/ubuntu/issues/42)) ([e7bf9df](https://github.com/ublue-os/ubuntu/commit/e7bf9df30fe222281f687075c6ed7c98cbcd71ed))
* add wireguard-tools and libratbag ([#32](https://github.com/ublue-os/ubuntu/issues/32)) ([befe4e2](https://github.com/ublue-os/ubuntu/commit/befe4e2e89dbe007762825ef1641386085652a81))
* switch to new ublue-os/main image ([#59](https://github.com/ublue-os/ubuntu/issues/59)) ([d2070c3](https://github.com/ublue-os/ubuntu/commit/d2070c38a188e0ce06751b2c7fde786c247624da))
* switch to the terra repo for blackbox ([#46](https://github.com/ublue-os/ubuntu/issues/46)) ([aaaf1c8](https://github.com/ublue-os/ubuntu/commit/aaaf1c8ba8cabc4b8b8acea939a8095f27862649))


### Bug Fixes

* add missing .desktop file ([#60](https://github.com/ublue-os/ubuntu/issues/60)) ([f921b5c](https://github.com/ublue-os/ubuntu/commit/f921b5c98e82a557449ada7938771523d14631b2))
* add yq to image ([a062e5a](https://github.com/ublue-os/ubuntu/commit/a062e5a42525e39d9183e20969d671fb8e5e18cf))
* copy the ublue script and config to the right place ([#61](https://github.com/ublue-os/ubuntu/issues/61)) ([43e9fc7](https://github.com/ublue-os/ubuntu/commit/43e9fc7bd1d99eb30c4a125ab2a64207cc1a978a))
* general update ([#48](https://github.com/ublue-os/ubuntu/issues/48)) ([674b780](https://github.com/ublue-os/ubuntu/commit/674b7807536ca15c8ece2db2e29fb5bf91f2efe8))
* name image ubuntu ([#56](https://github.com/ublue-os/ubuntu/issues/56)) ([9500a5b](https://github.com/ublue-os/ubuntu/commit/9500a5b683982ec706d8a836c6ab8b127d764d14))
* remove gnome-app-extensions experiment ([#55](https://github.com/ublue-os/ubuntu/issues/55)) ([9eff421](https://github.com/ublue-os/ubuntu/commit/9eff421d737cf8881a0575ce29da04dae07d211d))
* remove gnome-software-rpm-ostree ([#47](https://github.com/ublue-os/ubuntu/issues/47)) ([508b8c7](https://github.com/ublue-os/ubuntu/commit/508b8c7cbb7702277c346da032e8cacc239678a3))
* remove tailscale repo from final image ([1187aaa](https://github.com/ublue-os/ubuntu/commit/1187aaad12be32110e48497e5cd71acd140d27ad))
* rename back to just `ubuntu` ([#57](https://github.com/ublue-os/ubuntu/issues/57)) ([9e53d90](https://github.com/ublue-os/ubuntu/commit/9e53d90eb8ad9f3e4f3bbb170a9adfcd98a4f08f))
* rename signing argument ([#58](https://github.com/ublue-os/ubuntu/issues/58)) ([13c25c8](https://github.com/ublue-os/ubuntu/commit/13c25c8d5427818f8a9a7c8070a449130ca50f85))
* replace busted justfile snippet ([#66](https://github.com/ublue-os/ubuntu/issues/66)) ([ec124f2](https://github.com/ublue-os/ubuntu/commit/ec124f2595aa891ed96d7fe2194401c078ff1d14))
* run at 10:20 so we can ingest the latest nvidia builds ([#64](https://github.com/ublue-os/ubuntu/issues/64)) ([bca6a9c](https://github.com/ublue-os/ubuntu/commit/bca6a9c69680784718c85cf903f144bdf7101829))
* update action from main repo ([#62](https://github.com/ublue-os/ubuntu/issues/62)) ([b3d04db](https://github.com/ublue-os/ubuntu/commit/b3d04dbad843cf0773473cbd075ba0b9a55665cc))
* update cosign section and align with other action changes ([#54](https://github.com/ublue-os/ubuntu/issues/54)) ([78acf44](https://github.com/ublue-os/ubuntu/commit/78acf44e6be23180da41da37fa3e70a3a3c94a96))
* update readme ([5db5cac](https://github.com/ublue-os/ubuntu/commit/5db5cac644ff167892f70d23c5963a74f5df8462))

## 1.0.0 (2023-02-03)


### Features

* add release and conventional commit actions ([5a657f8](https://github.com/ublue-os/ubuntu/commit/5a657f8ff1001196608840847736bafde8235f76))


### Bug Fixes

* fix indentation in the action ([2e15657](https://github.com/ublue-os/ubuntu/commit/2e156571d94211b9d41073d7904eb68cb88c050c))
