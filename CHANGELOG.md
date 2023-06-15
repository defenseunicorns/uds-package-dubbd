# Changelog

## [0.2.4](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.2.3...v0.2.4) (2023-06-14)


### Bug Fixes

* misplaced files in zarf.yaml ([#283](https://github.com/defenseunicorns/uds-package-dubbd/issues/283)) ([48d3744](https://github.com/defenseunicorns/uds-package-dubbd/commit/48d37447c937c9d11cfa05511ca4d285497ca496))

## [0.2.3](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.2.2...v0.2.3) (2023-06-13)

### Added
* 4046fa8 Switch istio to TID by default (#275)
* Add AWS LB annotations ([#272](https://github.com/defenseunicorns/uds-package-dubbd/issues/272)) ([b8cdcb5](https://github.com/defenseunicorns/uds-package-dubbd/commit/b8cdcb56a920ba4d24a9fee4a75ee33f5e9fef0d))
* adjust semver to not bump major version ([#274](https://github.com/defenseunicorns/uds-package-dubbd/issues/274)) ([f25bfa3](https://github.com/defenseunicorns/uds-package-dubbd/commit/f25bfa353d6d75ce0c36cfb0c1717d9e1325ff24))
* Delete both S3 and KMS when force_delete is set to true (#266)

### Changed
* Updates Big Bang to 2.3.0 (#207)
* Update Release Please docs in README ([#263](https://github.com/defenseunicorns/uds-package-dubbd/issues/263)) ([d4f34b3](https://github.com/defenseunicorns/uds-package-dubbd/commit/d4f34b354bc89f5dcef2d1876a27bd31baed838a))
* d83192c updates docs to include all exposed variables (#273)
* d4984ee chore: update PUBLIC_{KEY,CERT}_FILE references to {KEY,CERT}_FILE (#251)


## [0.2.2](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.2.1...v0.2.2) (2023-06-09)

- updates CI
- Sets minimum TLS version for the Istio mesh and gateway
- updates package and repo naming


## [0.2.1](https://github.com/defenseunicorns/zarf-package-big-bang/compare/v0.2.0...v0.2.1) (2023-06-06)


### Bug Fixes

* release-please to use inline comments ([#236](https://github.com/defenseunicorns/zarf-package-big-bang/issues/236)) ([c1c435e](https://github.com/defenseunicorns/zarf-package-big-bang/commit/c1c435e89d414a1d2a70cc995d7e29a824e6670e))

## [0.2.0](https://github.com/defenseunicorns/zarf-package-big-bang/compare/v0.1.3...v0.2.0) (2023-06-06)


### Features

* auto-versioning and packaging ([b5a61e5](https://github.com/defenseunicorns/zarf-package-big-bang/commit/b5a61e54b2e7eacc4d61bbecf8d5199fecce941c))

## [0.1.3](https://github.com/defenseunicorns/zarf-package-big-bang/compare/v0.1.2...v0.1.3) (2023-06-06)


### Bug Fixes

* change flag type ([f121897](https://github.com/defenseunicorns/zarf-package-big-bang/commit/f12189702d72e719cbf1c4d73916553fd28342f9))
* create default false ([0cdff1d](https://github.com/defenseunicorns/zarf-package-big-bang/commit/0cdff1d7d8d50d677f01eccc4aff08f8ae5edea5))
* define default ([765c450](https://github.com/defenseunicorns/zarf-package-big-bang/commit/765c450f1e30d7472340eb53b06b476ed5858cb6))
* more logging ([d271958](https://github.com/defenseunicorns/zarf-package-big-bang/commit/d2719589e38f67fdd3945856bb10fb377051c258))
* paramater type mismatch ([29e86bf](https://github.com/defenseunicorns/zarf-package-big-bang/commit/29e86bf49c378771aa9ebb520d4ad79e755772ab))
* release flag ([b23ecad](https://github.com/defenseunicorns/zarf-package-big-bang/commit/b23ecad45433b233a225882fe3b602757e5af43c))
* test false ([2cd8cbf](https://github.com/defenseunicorns/zarf-package-big-bang/commit/2cd8cbf3462f9e589af780c74e2f6e00c37927d8))
* use release_created ([4728188](https://github.com/defenseunicorns/zarf-package-big-bang/commit/4728188e6c96de40faef07c7d1e38be01947bd45))

## [0.1.2](https://github.com/defenseunicorns/zarf-package-big-bang/compare/v0.1.1...v0.1.2) (2023-06-06)


### Bug Fixes

* add logging ([d821179](https://github.com/defenseunicorns/zarf-package-big-bang/commit/d821179ee166315e605b01047067b3057bd231dd))

## [0.1.1](https://github.com/defenseunicorns/zarf-package-big-bang/compare/v0.1.0...v0.1.1) (2023-06-06)


### Bug Fixes

* add permissions ([7259095](https://github.com/defenseunicorns/zarf-package-big-bang/commit/7259095736d943cfe577b71798f983be96808027))
* correct permissions ([95bcc3a](https://github.com/defenseunicorns/zarf-package-big-bang/commit/95bcc3a8bcaf1c0276ab4eb86678ad14cea77109))
* correct release flag ([afaae42](https://github.com/defenseunicorns/zarf-package-big-bang/commit/afaae4210e50c0ee1f132f3ee052d6fdccaea47b))
* fix echo format ([84e2320](https://github.com/defenseunicorns/zarf-package-big-bang/commit/84e2320ce1e342dbe03c0578cbfbff95d7d5e50d))
* log context ([4096d13](https://github.com/defenseunicorns/zarf-package-big-bang/commit/4096d13edb8905de8b38d91a4d13684a7640d4a9))
* log context ([d6f452b](https://github.com/defenseunicorns/zarf-package-big-bang/commit/d6f452b022992319c889ab42127f5498730b7793))
* logs steps ([6b9c153](https://github.com/defenseunicorns/zarf-package-big-bang/commit/6b9c15318c3b9681df0f8631fae7684fca4a67b3))
* test ([763ae84](https://github.com/defenseunicorns/zarf-package-big-bang/commit/763ae84cc466a767e9343ac2252202f825e7d091))

## [0.1.0](https://github.com/defenseunicorns/zarf-package-big-bang/compare/v0.0.5...v0.1.0) (2023-06-06)


### Features

* add local-dev dubbd package ([66e28b4](https://github.com/defenseunicorns/zarf-package-big-bang/commit/66e28b4a2b4f3038043795f7f54fb87844c3fd28))
* add passthru ingress gw by default ([19ca079](https://github.com/defenseunicorns/zarf-package-big-bang/commit/19ca07944f96abf1594f65d41fccf972a6cc748f))
* set renovate props for bb ver ([6571f9d](https://github.com/defenseunicorns/zarf-package-big-bang/commit/6571f9de084fa73ed3633482a7898b0cdf7af2a4))
* update GH workflows for renovate automation ([93bbe6c](https://github.com/defenseunicorns/zarf-package-big-bang/commit/93bbe6c23107daf987d4232e2b6ebce57ebbf0d0))
* update renovate to bump bb ver ([e78bc6d](https://github.com/defenseunicorns/zarf-package-big-bang/commit/e78bc6d16148952de8fba431122536824c9467f4))


### Bug Fixes

* bump aws-ebs-csi-driver version ([09cd3c6](https://github.com/defenseunicorns/zarf-package-big-bang/commit/09cd3c6df4667a73a33c09c41c57be190624fc38))
* bump eksctl cli version ([b54f76c](https://github.com/defenseunicorns/zarf-package-big-bang/commit/b54f76c7eacc0bee33f20d4b8b3247d8cc795141))
* bump refs to support k8s v1.26 ([b615e58](https://github.com/defenseunicorns/zarf-package-big-bang/commit/b615e5811ce226061db6cfcd39271f9a2dc99ea8))
* cert/key refs and move kyverno hr delete up ([5c89741](https://github.com/defenseunicorns/zarf-package-big-bang/commit/5c89741b1df9926afebb3a065ae35fed67b9c175))
* cleanup cert/keys and assoc scripts ([4f575b1](https://github.com/defenseunicorns/zarf-package-big-bang/commit/4f575b14eeccf64a0feb237d0d4a629b0b8532e7))
* correct workflow branch selection ([933296e](https://github.com/defenseunicorns/zarf-package-big-bang/commit/933296eb7a87767632a2c746179c99ff913e2b7b))
* for local-dev disable neuvector containerd ([ea4ad7e](https://github.com/defenseunicorns/zarf-package-big-bang/commit/ea4ad7e37cd7e26781879bdba4b5e724e6c730bc))
* have aws pipeline force destroy s3 for loki ([c002ef8](https://github.com/defenseunicorns/zarf-package-big-bang/commit/c002ef87fc78fb6e27ad366f7f2f8a9665a3ed06))
* move loki destroy to zarf pkg deploy ([854e4ef](https://github.com/defenseunicorns/zarf-package-big-bang/commit/854e4efb64e37beff213fe4b6209c6274861677b))
* point to updated iac repo module path ([bc053d5](https://github.com/defenseunicorns/zarf-package-big-bang/commit/bc053d517f86ae02d5e33dbb12dfccb3893c540b))
* syntax error in aws pipeline for zarf pkg deploy ([58cdfff](https://github.com/defenseunicorns/zarf-package-big-bang/commit/58cdfffc6e3c270a59c367169a96ef629c3c1b7a))
* update aws zarf tf to allow re-run ([#186](https://github.com/defenseunicorns/zarf-package-big-bang/issues/186)) ([25bc7ef](https://github.com/defenseunicorns/zarf-package-big-bang/commit/25bc7efeb8668ffe36f2d19cdcdce1e32584eba1))
* update deletes and bb version ([f2f8920](https://github.com/defenseunicorns/zarf-package-big-bang/commit/f2f8920c28b15ea542073a07bf5a0a21f001382d))
* update flux reconcile timeout & verbose args ([#198](https://github.com/defenseunicorns/zarf-package-big-bang/issues/198)) ([d63c060](https://github.com/defenseunicorns/zarf-package-big-bang/commit/d63c0607c6bac303fa7839794917bef671f266af))
* updating istio values and config example ([d0c6384](https://github.com/defenseunicorns/zarf-package-big-bang/commit/d0c6384a8777886c35c195d572d124704ac95e7a))
* updating loki module with force_destroy var ([660fb48](https://github.com/defenseunicorns/zarf-package-big-bang/commit/660fb487fea9b7338542aac46fbeef064b1f7f86))
* updating main.tf with force_destroy var ([991391a](https://github.com/defenseunicorns/zarf-package-big-bang/commit/991391ac3cbbca3fdb33a6dc637f0c76a13f3e8c))
