# Changelog

## [0.6.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.5.2...v0.6.0) (2023-08-03)


### Features

* improve neuvector config setup across distros ([#442](https://github.com/defenseunicorns/uds-package-dubbd/issues/442)) ([770d1e0](https://github.com/defenseunicorns/uds-package-dubbd/commit/770d1e0a66e1fd7ca6c0401e8b366aa099d61996))
* initial oscal componenet ([#446](https://github.com/defenseunicorns/uds-package-dubbd/issues/446)) ([7d0dced](https://github.com/defenseunicorns/uds-package-dubbd/commit/7d0dced367d4103b608e5c2c745436d5dcb6e7c0))


### Bug Fixes

* add monitoring resources to zarf.yaml ([#462](https://github.com/defenseunicorns/uds-package-dubbd/issues/462)) ([425d343](https://github.com/defenseunicorns/uds-package-dubbd/commit/425d3436009df6843d2ee8ef2a1d537ffed12fc0))
* avoid conflicts with BB authservice package ([#453](https://github.com/defenseunicorns/uds-package-dubbd/issues/453)) ([6c00497](https://github.com/defenseunicorns/uds-package-dubbd/commit/6c00497870b7bed3ce1b03554705b20dda746c41))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.309 ([#443](https://github.com/defenseunicorns/uds-package-dubbd/issues/443)) ([c71faf7](https://github.com/defenseunicorns/uds-package-dubbd/commit/c71faf789fc771eeb0053618201f284ecee09537))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.313 ([#456](https://github.com/defenseunicorns/uds-package-dubbd/issues/456)) ([cfb5140](https://github.com/defenseunicorns/uds-package-dubbd/commit/cfb5140cb3cf379707287829a30d01609d249908))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.315 ([#464](https://github.com/defenseunicorns/uds-package-dubbd/issues/464)) ([c9c2ea3](https://github.com/defenseunicorns/uds-package-dubbd/commit/c9c2ea3da2994ad30732c83dda8975529b6af151))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.11 ([#444](https://github.com/defenseunicorns/uds-package-dubbd/issues/444)) ([8fd6dcf](https://github.com/defenseunicorns/uds-package-dubbd/commit/8fd6dcfd9df678f33483019dce49f8a41a2b748f))
* updating oscal configs to include neuvector ([#458](https://github.com/defenseunicorns/uds-package-dubbd/issues/458)) ([c0060cc](https://github.com/defenseunicorns/uds-package-dubbd/commit/c0060cc43e26a329a12046170abbe4bc72c8e813))


### Miscellaneous

* **deps:** update gitlab tag big-bang/bigbang to v2.7.0 ([#459](https://github.com/defenseunicorns/uds-package-dubbd/issues/459)) ([46c01d9](https://github.com/defenseunicorns/uds-package-dubbd/commit/46c01d9716f3294e337b1ebc54f984efd669f5ef))
* **deps:** update gitlab tag big-bang/bigbang to v2.7.1 ([#461](https://github.com/defenseunicorns/uds-package-dubbd/issues/461)) ([b3b9fd6](https://github.com/defenseunicorns/uds-package-dubbd/commit/b3b9fd6b9728ac3efd211069cabc1a0eea7714e1))
* release 0.5.3 ([#468](https://github.com/defenseunicorns/uds-package-dubbd/issues/468)) ([b4c61aa](https://github.com/defenseunicorns/uds-package-dubbd/commit/b4c61aaa74abb114d89a3af3be49744364c60955))

## [0.5.2](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.5.1...v0.5.2) (2023-07-26)


### Features

* Adding default backup schedule for monitoring and tempo pvcs ([#440](https://github.com/defenseunicorns/uds-package-dubbd/issues/440)) ([fe1ae19](https://github.com/defenseunicorns/uds-package-dubbd/commit/fe1ae19f290005ffaffce9d41448530014701f8a))


### Bug Fixes

* ci for uds core syntax ([#449](https://github.com/defenseunicorns/uds-package-dubbd/issues/449)) ([813ffc2](https://github.com/defenseunicorns/uds-package-dubbd/commit/813ffc2ad6217f7c5fb421c259a9901f700a8e5c))
* deadend ci-on-pull-request-uds-core-aws job to fire on the never branch so we don't receive github spam ([#448](https://github.com/defenseunicorns/uds-package-dubbd/issues/448)) ([de5d8d4](https://github.com/defenseunicorns/uds-package-dubbd/commit/de5d8d4494cb96d12c76effdc77f3194d4d4217f))

## [0.5.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.5.0...v0.5.1) (2023-07-25)


### Features

* add authservice istio extensionProvider ([#424](https://github.com/defenseunicorns/uds-package-dubbd/issues/424)) ([85c494c](https://github.com/defenseunicorns/uds-package-dubbd/commit/85c494cf40ce8bb43c237891fefd46496563062c))
* add default storage class for DUBBD ([#417](https://github.com/defenseunicorns/uds-package-dubbd/issues/417)) ([7dd37dd](https://github.com/defenseunicorns/uds-package-dubbd/commit/7dd37dd0d68fbca7757268ec6e190b33e990452a))
* add IAC for Velero deployment ([#420](https://github.com/defenseunicorns/uds-package-dubbd/issues/420)) ([1e460f5](https://github.com/defenseunicorns/uds-package-dubbd/commit/1e460f563066badff73b35defaec73e611d2c901))


### Bug Fixes

* Adding kms:GenerateDataKey kms:Decrypt to velero policy ([#428](https://github.com/defenseunicorns/uds-package-dubbd/issues/428)) ([1efe72b](https://github.com/defenseunicorns/uds-package-dubbd/commit/1efe72bf1320d6f76fd1825d8fecc45d8b428999))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.305 ([#416](https://github.com/defenseunicorns/uds-package-dubbd/issues/416)) ([f29519c](https://github.com/defenseunicorns/uds-package-dubbd/commit/f29519c3eff4a15a0cdaf98a2f8264e530ef0cec))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.307 ([#437](https://github.com/defenseunicorns/uds-package-dubbd/issues/437)) ([10902f0](https://github.com/defenseunicorns/uds-package-dubbd/commit/10902f087fc7d62a8462d8f8fd0153503054845a))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.8 ([#375](https://github.com/defenseunicorns/uds-package-dubbd/issues/375)) ([5040605](https://github.com/defenseunicorns/uds-package-dubbd/commit/5040605a8606c0470231166e2acc643bfb4a1ba6))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.9 ([#438](https://github.com/defenseunicorns/uds-package-dubbd/issues/438)) ([57f7607](https://github.com/defenseunicorns/uds-package-dubbd/commit/57f76076717f53ec7b43eba8f8825b34520283bf))


### Miscellaneous

* **deps:** update dependency defenseunicorns/zarf to v0.28.3 ([#421](https://github.com/defenseunicorns/uds-package-dubbd/issues/421)) ([fc32a54](https://github.com/defenseunicorns/uds-package-dubbd/commit/fc32a54e613ede698b3fb934235d96909650ef2f))
* **deps:** update terraform github.com/defenseunicorns/terraform-aws-uds-kms to v0.0.2 ([#415](https://github.com/defenseunicorns/uds-package-dubbd/issues/415)) ([379b979](https://github.com/defenseunicorns/uds-package-dubbd/commit/379b97952b4ddb9a20bea6440bbfa1c852ff17ac))
* update packaging standards, add yamllint in CI ([#414](https://github.com/defenseunicorns/uds-package-dubbd/issues/414)) ([f5c7a73](https://github.com/defenseunicorns/uds-package-dubbd/commit/f5c7a7350b5e54e158725547dda0667746e29c78))

## [0.5.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.4.2...v0.5.0) (2023-07-19)


### Features

* add dubbd pre-upgrade & update refs ([#411](https://github.com/defenseunicorns/uds-package-dubbd/issues/411)) ([675b79a](https://github.com/defenseunicorns/uds-package-dubbd/commit/675b79a1c9fac491f40bd811305cf496f1cae6a3))
* add HPA for Loki ([#419](https://github.com/defenseunicorns/uds-package-dubbd/issues/419)) ([f3d788a](https://github.com/defenseunicorns/uds-package-dubbd/commit/f3d788a6897abbffc7b20b7085026d0a897652ad))


### Bug Fixes

* **deps:** update module github.com/aws/aws-sdk-go to v1.44.300 ([#397](https://github.com/defenseunicorns/uds-package-dubbd/issues/397)) ([1d475e8](https://github.com/defenseunicorns/uds-package-dubbd/commit/1d475e8080b66ea18d5cddf25250bd2f22984a60))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.301 ([#405](https://github.com/defenseunicorns/uds-package-dubbd/issues/405)) ([a4b7267](https://github.com/defenseunicorns/uds-package-dubbd/commit/a4b72674b49202287a26a95966e6cbcb5b9484ac))
* k3d local installation ([#403](https://github.com/defenseunicorns/uds-package-dubbd/issues/403)) ([33cfcff](https://github.com/defenseunicorns/uds-package-dubbd/commit/33cfcff5b5b676d8626e367c19802e0fa7e1f6a6))


### Miscellaneous

* **deps:** update actions/upload-artifact action to v3 ([#350](https://github.com/defenseunicorns/uds-package-dubbd/issues/350)) ([2df824e](https://github.com/defenseunicorns/uds-package-dubbd/commit/2df824e8162520ad5a027c5ff1abab4e29f168e6))
* **deps:** update gitlab tag big-bang/bigbang to v2.6.0 ([#401](https://github.com/defenseunicorns/uds-package-dubbd/issues/401)) ([ae919ef](https://github.com/defenseunicorns/uds-package-dubbd/commit/ae919efab41f4b25ab913cc672e36aaac391603e))

## [0.4.2](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.4.1...v0.4.2) (2023-07-13)


### Features

* add kyverno ns exclude ([#393](https://github.com/defenseunicorns/uds-package-dubbd/issues/393)) ([dc5d924](https://github.com/defenseunicorns/uds-package-dubbd/commit/dc5d9243fe61c4c71cc67764bd008f1e87093c12))


### Bug Fixes

* Add 20 min timeout for bigbang onRemove ([#360](https://github.com/defenseunicorns/uds-package-dubbd/issues/360)) ([5de8134](https://github.com/defenseunicorns/uds-package-dubbd/commit/5de8134ed5f9ac5d7c133a4e9a4c5328446fab52))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.299 ([#386](https://github.com/defenseunicorns/uds-package-dubbd/issues/386)) ([9bea307](https://github.com/defenseunicorns/uds-package-dubbd/commit/9bea307a0d59be451b3a96de591646ab74867f34))
* missing webhook deletion for kyverno ([7b6cf38](https://github.com/defenseunicorns/uds-package-dubbd/commit/7b6cf38937d8926d517608131a9ff1246fcc9ba4))


### Miscellaneous

* **deps:** update dependency defenseunicorns/zarf to v0.28.2 ([#341](https://github.com/defenseunicorns/uds-package-dubbd/issues/341)) ([e616375](https://github.com/defenseunicorns/uds-package-dubbd/commit/e6163755642aacc77ee9574d340560006d607bd0))

## [0.4.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.4.0...v0.4.1) (2023-07-10)


### Features

* add external-dns ([#346](https://github.com/defenseunicorns/uds-package-dubbd/issues/346)) ([3428065](https://github.com/defenseunicorns/uds-package-dubbd/commit/342806501a03f33feb97ba4d351bf6e9c3b69b68))


### Bug Fixes

* **deps:** update module github.com/aws/aws-sdk-go to v1.44.298 ([#349](https://github.com/defenseunicorns/uds-package-dubbd/issues/349)) ([9da2a21](https://github.com/defenseunicorns/uds-package-dubbd/commit/9da2a21d097c48d9fe865a3413f5c4c83fbaa868))


### Miscellaneous

* **deps:** bump google.golang.org/grpc from 1.51.0 to 1.53.0 in /aws/cloudtrail/test ([#361](https://github.com/defenseunicorns/uds-package-dubbd/issues/361)) ([10b202d](https://github.com/defenseunicorns/uds-package-dubbd/commit/10b202de072d03a17ef151b35bf903d7edf04d13))
* **deps:** bump google.golang.org/grpc from 1.51.0 to 1.53.0 in /aws/eks/test ([#362](https://github.com/defenseunicorns/uds-package-dubbd/issues/362)) ([3dc2fd8](https://github.com/defenseunicorns/uds-package-dubbd/commit/3dc2fd8f0abae06cb04eb918ad48e982785a2755))

## [0.4.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.3.0...v0.4.0) (2023-07-06)


### Features

* document local dev env setup and uds iac quick start as an onboarding resource ([#279](https://github.com/defenseunicorns/uds-package-dubbd/issues/279)) ([84d47d2](https://github.com/defenseunicorns/uds-package-dubbd/commit/84d47d23c5de37914465cbae84347ec76d5e1921))
* add cloudtrail ([#339](https://github.com/defenseunicorns/uds-package-dubbd/issues/339)) ([94b771c](https://github.com/defenseunicorns/uds-package-dubbd/commit/94b771c1ce802f9ef62a5ec4084a0e522c0fecd7))
* Adds HPA for istiod, modified HPA for kiali ([#353](https://github.com/defenseunicorns/uds-package-dubbd/issues/353)) ([c5d6732](https://github.com/defenseunicorns/uds-package-dubbd/commit/c5d6732c7e6ffba7c74bdd4645aeef8a486f3392))
* enable auto_scan for neuvector by default ([#319](https://github.com/defenseunicorns/uds-package-dubbd/issues/319)) ([42c44e8](https://github.com/defenseunicorns/uds-package-dubbd/commit/42c44e85962eda61e9f02e2eeb4a9f0e2f6d50d2))


### Bug Fixes

* disable telemetry for neuvector ([#355](https://github.com/defenseunicorns/uds-package-dubbd/issues/355)) ([fca32e0](https://github.com/defenseunicorns/uds-package-dubbd/commit/fca32e0afe010eaa03a8fa40d9f3edf2c79db389))
* make admin ingress configurable ([#316](https://github.com/defenseunicorns/uds-package-dubbd/issues/316)) ([f78f388](https://github.com/defenseunicorns/uds-package-dubbd/commit/f78f388708a86538afa470681e9892354af4819f))
* update conditionals on ingress upgrade to fix syntax ([#309](https://github.com/defenseunicorns/uds-package-dubbd/issues/309)) ([01167a6](https://github.com/defenseunicorns/uds-package-dubbd/commit/01167a69006cd50c1f8c5fd5d84a171ab449567d))
* Update workflow path filters ([#320](https://github.com/defenseunicorns/uds-package-dubbd/issues/320)) ([18c47cd](https://github.com/defenseunicorns/uds-package-dubbd/commit/18c47cd57d60c833e9db9e7fbd25fbf177800516))


### Miscellaneous

* **deps:** update defenseunicorns/uds-aws-ci-k3d action to v0.0.3 ([#344](https://github.com/defenseunicorns/uds-package-dubbd/issues/344)) ([bb04cc2](https://github.com/defenseunicorns/uds-package-dubbd/commit/bb04cc2a9be1e8e727859998d0a3b8c8d589db60))
* **deps:** update docker image quay.io/metallb/controller to v0.13.10 [ci-skip] ([#310](https://github.com/defenseunicorns/uds-package-dubbd/issues/310)) ([702c15a](https://github.com/defenseunicorns/uds-package-dubbd/commit/702c15a98b97d8d864b5b72042f176423f16b611))
* **deps:** update docker image quay.io/metallb/speaker to v0.13.10 [ci-skip] ([#311](https://github.com/defenseunicorns/uds-package-dubbd/issues/311)) ([c86883f](https://github.com/defenseunicorns/uds-package-dubbd/commit/c86883f200d8b2249e42d6d86ee4bcda6d42a85d))
* **deps:** update gitlab tag big-bang/bigbang to v2.5.0 ([#351](https://github.com/defenseunicorns/uds-package-dubbd/issues/351)) ([3369cbe](https://github.com/defenseunicorns/uds-package-dubbd/commit/3369cbef71edc38d9aaa1e18b83230f9221072cc))

## [0.3.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.2.4...v0.3.0) (2023-06-21)


### Features

* allow configuring public/private tenant LB ([#299](https://github.com/defenseunicorns/uds-package-dubbd/issues/299)) ([7863dd0](https://github.com/defenseunicorns/uds-package-dubbd/commit/7863dd0490198ef119a5de4d6e1bc53b4a084e5e))


### Bug Fixes

* Update AWS config in CI to use OIDC auth ([#303](https://github.com/defenseunicorns/uds-package-dubbd/issues/303)) ([2d19a84](https://github.com/defenseunicorns/uds-package-dubbd/commit/2d19a8431b7057cab08a4ced6dc275d5a08fd4b2))
* Update dubbd-aws package name in upgrade job ([#292](https://github.com/defenseunicorns/uds-package-dubbd/issues/292)) ([4b3dc0b](https://github.com/defenseunicorns/uds-package-dubbd/commit/4b3dc0b5bb6f6362e282f907937e2021cd9061e8))


### Miscellaneous Chores

* **deps:** update gitlab tag big-bang/bigbang to v2.4.0 [ci-skip] ([#298](https://github.com/defenseunicorns/uds-package-dubbd/issues/298)) ([2b3f49f](https://github.com/defenseunicorns/uds-package-dubbd/commit/2b3f49f397dd9d61d6c03c3936b9bf06aba62612))

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
