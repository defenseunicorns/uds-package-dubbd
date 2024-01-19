# Changelog

## [0.17.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.17.0...v0.17.0) (2024-01-19)


### ci

* update oscal for bb 2.9.0 ([#544](https://github.com/defenseunicorns/uds-package-dubbd/issues/544)) ([8fcfb08](https://github.com/defenseunicorns/uds-package-dubbd/commit/8fcfb085e905845005b10fddf4f462664b0f8562))


### Features

* 119 document local dev env setup and uds iac quick start as an onboarding resource ([#279](https://github.com/defenseunicorns/uds-package-dubbd/issues/279)) ([84d47d2](https://github.com/defenseunicorns/uds-package-dubbd/commit/84d47d23c5de37914465cbae84347ec76d5e1921))
* add authservice istio extensionProvider ([#424](https://github.com/defenseunicorns/uds-package-dubbd/issues/424)) ([85c494c](https://github.com/defenseunicorns/uds-package-dubbd/commit/85c494cf40ce8bb43c237891fefd46496563062c))
* add automation & docs to support releases ([#569](https://github.com/defenseunicorns/uds-package-dubbd/issues/569)) ([89d9afd](https://github.com/defenseunicorns/uds-package-dubbd/commit/89d9afdfb9fdb8cb1c4bd19e8518b4f259da374b))
* add base on-prem package for rke2 ([#455](https://github.com/defenseunicorns/uds-package-dubbd/issues/455)) ([8f42f5b](https://github.com/defenseunicorns/uds-package-dubbd/commit/8f42f5b3e765ddcba4b72eaf01682b88f22013ee))
* add cloudtrail ([#339](https://github.com/defenseunicorns/uds-package-dubbd/issues/339)) ([94b771c](https://github.com/defenseunicorns/uds-package-dubbd/commit/94b771c1ce802f9ef62a5ec4084a0e522c0fecd7))
* Add COMPLIANCE.md ([#557](https://github.com/defenseunicorns/uds-package-dubbd/issues/557)) ([aff9bab](https://github.com/defenseunicorns/uds-package-dubbd/commit/aff9babea1c7f2e1369bfab0fa1e636e2b4aced0))
* add default storage class for DUBBD ([#417](https://github.com/defenseunicorns/uds-package-dubbd/issues/417)) ([7dd37dd](https://github.com/defenseunicorns/uds-package-dubbd/commit/7dd37dd0d68fbca7757268ec6e190b33e990452a))
* add dubbd pre-upgrade & update refs ([#411](https://github.com/defenseunicorns/uds-package-dubbd/issues/411)) ([675b79a](https://github.com/defenseunicorns/uds-package-dubbd/commit/675b79a1c9fac491f40bd811305cf496f1cae6a3))
* add external-dns ([#346](https://github.com/defenseunicorns/uds-package-dubbd/issues/346)) ([3428065](https://github.com/defenseunicorns/uds-package-dubbd/commit/342806501a03f33feb97ba4d351bf6e9c3b69b68))
* add HPA for Loki ([#419](https://github.com/defenseunicorns/uds-package-dubbd/issues/419)) ([f3d788a](https://github.com/defenseunicorns/uds-package-dubbd/commit/f3d788a6897abbffc7b20b7085026d0a897652ad))
* add IAC for Velero deployment ([#420](https://github.com/defenseunicorns/uds-package-dubbd/issues/420)) ([1e460f5](https://github.com/defenseunicorns/uds-package-dubbd/commit/1e460f563066badff73b35defaec73e611d2c901))
* add kyverno ns exclude ([#393](https://github.com/defenseunicorns/uds-package-dubbd/issues/393)) ([dc5d924](https://github.com/defenseunicorns/uds-package-dubbd/commit/dc5d9243fe61c4c71cc67764bd008f1e87093c12))
* add local-dev dubbd package ([66e28b4](https://github.com/defenseunicorns/uds-package-dubbd/commit/66e28b4a2b4f3038043795f7f54fb87844c3fd28))
* add more preflight checks ([#517](https://github.com/defenseunicorns/uds-package-dubbd/issues/517)) ([2745eb4](https://github.com/defenseunicorns/uds-package-dubbd/commit/2745eb4d2b1b278a2f12afd23f7f4c53146e3e3f))
* add passthru ingress gw by default ([19ca079](https://github.com/defenseunicorns/uds-package-dubbd/commit/19ca07944f96abf1594f65d41fccf972a6cc748f))
* add velero for rke2 by default ([d59ff4e](https://github.com/defenseunicorns/uds-package-dubbd/commit/d59ff4ea625fa8d2c3abd8eab3a6af906b461d80))
* Added variable for approved registries ([#212](https://github.com/defenseunicorns/uds-package-dubbd/issues/212)) ([ab21ef3](https://github.com/defenseunicorns/uds-package-dubbd/commit/ab21ef3dd2c5ae42a16891b163a0cdca94fdf208))
* Adding default backup schedule for monitoring and tempo pvcs ([#440](https://github.com/defenseunicorns/uds-package-dubbd/issues/440)) ([fe1ae19](https://github.com/defenseunicorns/uds-package-dubbd/commit/fe1ae19f290005ffaffce9d41448530014701f8a))
* additional dubbd helm values via zarf var ([#511](https://github.com/defenseunicorns/uds-package-dubbd/issues/511)) ([6beb477](https://github.com/defenseunicorns/uds-package-dubbd/commit/6beb47735a753120c2559783d07ecd0e4e674741))
* Adds HPA for istiod, modified HPA for kiali ([#353](https://github.com/defenseunicorns/uds-package-dubbd/issues/353)) ([c5d6732](https://github.com/defenseunicorns/uds-package-dubbd/commit/c5d6732c7e6ffba7c74bdd4645aeef8a486f3392))
* allow configuring public/private tenant LB ([#299](https://github.com/defenseunicorns/uds-package-dubbd/issues/299)) ([7863dd0](https://github.com/defenseunicorns/uds-package-dubbd/commit/7863dd0490198ef119a5de4d6e1bc53b4a084e5e))
* allow specifying istio admin domain & certs ([#567](https://github.com/defenseunicorns/uds-package-dubbd/issues/567)) ([bc883fd](https://github.com/defenseunicorns/uds-package-dubbd/commit/bc883fd2c41f25144441b55cfd243d37acf0e4de))
* create separate dubbd-iac-aws pkg ([#531](https://github.com/defenseunicorns/uds-package-dubbd/issues/531)) ([3fc0bc0](https://github.com/defenseunicorns/uds-package-dubbd/commit/3fc0bc07795b91a4b660f893c625f5c2109c457f))
* enable auto_scan for neuvector by default ([#319](https://github.com/defenseunicorns/uds-package-dubbd/issues/319)) ([42c44e8](https://github.com/defenseunicorns/uds-package-dubbd/commit/42c44e85962eda61e9f02e2eeb4a9f0e2f6d50d2))
* improve neuvector config setup across distros ([#442](https://github.com/defenseunicorns/uds-package-dubbd/issues/442)) ([770d1e0](https://github.com/defenseunicorns/uds-package-dubbd/commit/770d1e0a66e1fd7ca6c0401e8b366aa099d61996))
* increase kyverno requests/limits ([#499](https://github.com/defenseunicorns/uds-package-dubbd/issues/499)) ([bb70341](https://github.com/defenseunicorns/uds-package-dubbd/commit/bb7034148b37e8793c4a4bbf530d2ffce73ccae5))
* initial oscal componenet ([#446](https://github.com/defenseunicorns/uds-package-dubbd/issues/446)) ([7d0dced](https://github.com/defenseunicorns/uds-package-dubbd/commit/7d0dced367d4103b608e5c2c745436d5dcb6e7c0))
* non default creds for admin interfaces ([#472](https://github.com/defenseunicorns/uds-package-dubbd/issues/472)) ([e22e87c](https://github.com/defenseunicorns/uds-package-dubbd/commit/e22e87c635ba6b5a976a4df2184780d29d49946c))
* rm external-dns from zarf pkg ([#587](https://github.com/defenseunicorns/uds-package-dubbd/issues/587)) ([ccca626](https://github.com/defenseunicorns/uds-package-dubbd/commit/ccca626e1c9141d9a78436714ae3b8b15c34f9d8))
* update DUBBD to handle custom zarf init package. ([#611](https://github.com/defenseunicorns/uds-package-dubbd/issues/611)) ([4acec87](https://github.com/defenseunicorns/uds-package-dubbd/commit/4acec8749b9e69ffd925f8824b10e7a1b255bad4))
* update GH workflows for renovate automation ([93bbe6c](https://github.com/defenseunicorns/uds-package-dubbd/commit/93bbe6c23107daf987d4232e2b6ebce57ebbf0d0))


### Bug Fixes

* Add 20 min timeout for bigbang onRemove ([#360](https://github.com/defenseunicorns/uds-package-dubbd/issues/360)) ([5de8134](https://github.com/defenseunicorns/uds-package-dubbd/commit/5de8134ed5f9ac5d7c133a4e9a4c5328446fab52))
* Add AWS LB annotations ([#272](https://github.com/defenseunicorns/uds-package-dubbd/issues/272)) ([b8cdcb5](https://github.com/defenseunicorns/uds-package-dubbd/commit/b8cdcb56a920ba4d24a9fee4a75ee33f5e9fef0d))
* add logging ([d821179](https://github.com/defenseunicorns/uds-package-dubbd/commit/d821179ee166315e605b01047067b3057bd231dd))
* add monitoring resources to zarf.yaml ([#462](https://github.com/defenseunicorns/uds-package-dubbd/issues/462)) ([425d343](https://github.com/defenseunicorns/uds-package-dubbd/commit/425d3436009df6843d2ee8ef2a1d537ffed12fc0))
* add permissions ([7259095](https://github.com/defenseunicorns/uds-package-dubbd/commit/7259095736d943cfe577b71798f983be96808027))
* Adding kms:GenerateDataKey kms:Decrypt to velero policy ([#428](https://github.com/defenseunicorns/uds-package-dubbd/issues/428)) ([1efe72b](https://github.com/defenseunicorns/uds-package-dubbd/commit/1efe72bf1320d6f76fd1825d8fecc45d8b428999))
* adjust semver to not bump major version ([#274](https://github.com/defenseunicorns/uds-package-dubbd/issues/274)) ([f25bfa3](https://github.com/defenseunicorns/uds-package-dubbd/commit/f25bfa353d6d75ce0c36cfb0c1717d9e1325ff24))
* avoid conflicts with BB authservice package ([#453](https://github.com/defenseunicorns/uds-package-dubbd/issues/453)) ([6c00497](https://github.com/defenseunicorns/uds-package-dubbd/commit/6c00497870b7bed3ce1b03554705b20dda746c41))
* bump aws-ebs-csi-driver version ([09cd3c6](https://github.com/defenseunicorns/uds-package-dubbd/commit/09cd3c6df4667a73a33c09c41c57be190624fc38))
* bump eksctl cli version ([b54f76c](https://github.com/defenseunicorns/uds-package-dubbd/commit/b54f76c7eacc0bee33f20d4b8b3247d8cc795141))
* bump flux resources requests & limits via patch ([#586](https://github.com/defenseunicorns/uds-package-dubbd/issues/586)) ([b69c5d7](https://github.com/defenseunicorns/uds-package-dubbd/commit/b69c5d780efffeb3570c4e1131d9fe6650d12891))
* bump refs to support k8s v1.26 ([b615e58](https://github.com/defenseunicorns/uds-package-dubbd/commit/b615e5811ce226061db6cfcd39271f9a2dc99ea8))
* change flag type ([f121897](https://github.com/defenseunicorns/uds-package-dubbd/commit/f12189702d72e719cbf1c4d73916553fd28342f9))
* ci for uds core syntax ([#449](https://github.com/defenseunicorns/uds-package-dubbd/issues/449)) ([813ffc2](https://github.com/defenseunicorns/uds-package-dubbd/commit/813ffc2ad6217f7c5fb421c259a9901f700a8e5c))
* correct permissions ([95bcc3a](https://github.com/defenseunicorns/uds-package-dubbd/commit/95bcc3a8bcaf1c0276ab4eb86678ad14cea77109))
* correct release flag ([afaae42](https://github.com/defenseunicorns/uds-package-dubbd/commit/afaae4210e50c0ee1f132f3ee052d6fdccaea47b))
* correct workflow branch selection ([933296e](https://github.com/defenseunicorns/uds-package-dubbd/commit/933296eb7a87767632a2c746179c99ff913e2b7b))
* create default false ([0cdff1d](https://github.com/defenseunicorns/uds-package-dubbd/commit/0cdff1d7d8d50d677f01eccc4aff08f8ae5edea5))
* deadend ci-on-pull-request-uds-core-aws job to fire on the never branch so we don't receive github spam ([#448](https://github.com/defenseunicorns/uds-package-dubbd/issues/448)) ([de5d8d4](https://github.com/defenseunicorns/uds-package-dubbd/commit/de5d8d4494cb96d12c76effdc77f3194d4d4217f))
* define default ([765c450](https://github.com/defenseunicorns/uds-package-dubbd/commit/765c450f1e30d7472340eb53b06b476ed5858cb6))
* delete grafana onRemove ([#476](https://github.com/defenseunicorns/uds-package-dubbd/issues/476)) ([24d47fa](https://github.com/defenseunicorns/uds-package-dubbd/commit/24d47faf84a8e2e5300c658ebefdf4414dff1192))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.298 ([#349](https://github.com/defenseunicorns/uds-package-dubbd/issues/349)) ([9da2a21](https://github.com/defenseunicorns/uds-package-dubbd/commit/9da2a21d097c48d9fe865a3413f5c4c83fbaa868))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.299 ([#386](https://github.com/defenseunicorns/uds-package-dubbd/issues/386)) ([9bea307](https://github.com/defenseunicorns/uds-package-dubbd/commit/9bea307a0d59be451b3a96de591646ab74867f34))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.300 ([#397](https://github.com/defenseunicorns/uds-package-dubbd/issues/397)) ([1d475e8](https://github.com/defenseunicorns/uds-package-dubbd/commit/1d475e8080b66ea18d5cddf25250bd2f22984a60))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.301 ([#405](https://github.com/defenseunicorns/uds-package-dubbd/issues/405)) ([a4b7267](https://github.com/defenseunicorns/uds-package-dubbd/commit/a4b72674b49202287a26a95966e6cbcb5b9484ac))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.305 ([#416](https://github.com/defenseunicorns/uds-package-dubbd/issues/416)) ([f29519c](https://github.com/defenseunicorns/uds-package-dubbd/commit/f29519c3eff4a15a0cdaf98a2f8264e530ef0cec))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.307 ([#437](https://github.com/defenseunicorns/uds-package-dubbd/issues/437)) ([10902f0](https://github.com/defenseunicorns/uds-package-dubbd/commit/10902f087fc7d62a8462d8f8fd0153503054845a))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.309 ([#443](https://github.com/defenseunicorns/uds-package-dubbd/issues/443)) ([c71faf7](https://github.com/defenseunicorns/uds-package-dubbd/commit/c71faf789fc771eeb0053618201f284ecee09537))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.313 ([#456](https://github.com/defenseunicorns/uds-package-dubbd/issues/456)) ([cfb5140](https://github.com/defenseunicorns/uds-package-dubbd/commit/cfb5140cb3cf379707287829a30d01609d249908))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.315 ([#464](https://github.com/defenseunicorns/uds-package-dubbd/issues/464)) ([c9c2ea3](https://github.com/defenseunicorns/uds-package-dubbd/commit/c9c2ea3da2994ad30732c83dda8975529b6af151))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.316 ([#470](https://github.com/defenseunicorns/uds-package-dubbd/issues/470)) ([6271438](https://github.com/defenseunicorns/uds-package-dubbd/commit/6271438e32eca94b124757026de721b65a1dbaf9))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.317 ([#477](https://github.com/defenseunicorns/uds-package-dubbd/issues/477)) ([c7958fe](https://github.com/defenseunicorns/uds-package-dubbd/commit/c7958fe1b38793361567bbc5dbcfaaf23a23f60c))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.318 ([#483](https://github.com/defenseunicorns/uds-package-dubbd/issues/483)) ([05fb99e](https://github.com/defenseunicorns/uds-package-dubbd/commit/05fb99ed35837713ee50b59226569a89d9126ab5))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.319 ([#489](https://github.com/defenseunicorns/uds-package-dubbd/issues/489)) ([6fb48cd](https://github.com/defenseunicorns/uds-package-dubbd/commit/6fb48cd01421065835da335d7e314fbc36c23440))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.320 ([#492](https://github.com/defenseunicorns/uds-package-dubbd/issues/492)) ([03c86cd](https://github.com/defenseunicorns/uds-package-dubbd/commit/03c86cd2bf09eeb230e813f0e7f759103b2d6d80))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.321 ([#494](https://github.com/defenseunicorns/uds-package-dubbd/issues/494)) ([adba6db](https://github.com/defenseunicorns/uds-package-dubbd/commit/adba6dbad64f2cf49f36ddbd671a6fb7e183b14d))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.324 ([#498](https://github.com/defenseunicorns/uds-package-dubbd/issues/498)) ([7b8afc9](https://github.com/defenseunicorns/uds-package-dubbd/commit/7b8afc9d6782a3f394ed1d6dc175d58a623cf061))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.325 ([#506](https://github.com/defenseunicorns/uds-package-dubbd/issues/506)) ([36d60b8](https://github.com/defenseunicorns/uds-package-dubbd/commit/36d60b8fc4517b9136bba19337012fdb57738de9))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.326 ([#509](https://github.com/defenseunicorns/uds-package-dubbd/issues/509)) ([eda11d1](https://github.com/defenseunicorns/uds-package-dubbd/commit/eda11d118b3aee688dbadb995c3cb6b2508f3ef4))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.327 ([#512](https://github.com/defenseunicorns/uds-package-dubbd/issues/512)) ([e6077d3](https://github.com/defenseunicorns/uds-package-dubbd/commit/e6077d36198249eac22238033273d4afec1aed6d))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.328 ([#515](https://github.com/defenseunicorns/uds-package-dubbd/issues/515)) ([f6831f3](https://github.com/defenseunicorns/uds-package-dubbd/commit/f6831f314c7974f65eaff8d10adc1eac2a338afd))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.329 ([#520](https://github.com/defenseunicorns/uds-package-dubbd/issues/520)) ([9159a42](https://github.com/defenseunicorns/uds-package-dubbd/commit/9159a42a42d69b94dd9f1907b427b56b7ab9ea2c))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.331 ([#524](https://github.com/defenseunicorns/uds-package-dubbd/issues/524)) ([5485372](https://github.com/defenseunicorns/uds-package-dubbd/commit/548537262eaf03d9e2d81387b283b7cb7d88d9ed))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.332 ([#535](https://github.com/defenseunicorns/uds-package-dubbd/issues/535)) ([f5f2d5c](https://github.com/defenseunicorns/uds-package-dubbd/commit/f5f2d5c10edb7b20931041c7bbdd26f0e6192983))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.333 ([#538](https://github.com/defenseunicorns/uds-package-dubbd/issues/538)) ([b7e9e5f](https://github.com/defenseunicorns/uds-package-dubbd/commit/b7e9e5f49467a3e451e4d3d5365d3126fedb98cd))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.334 ([#540](https://github.com/defenseunicorns/uds-package-dubbd/issues/540)) ([2e97274](https://github.com/defenseunicorns/uds-package-dubbd/commit/2e97274176f25be6b29996771af03d4d47c08399))
* **deps:** update module github.com/aws/aws-sdk-go to v1.45.0 ([#542](https://github.com/defenseunicorns/uds-package-dubbd/issues/542)) ([d9115e8](https://github.com/defenseunicorns/uds-package-dubbd/commit/d9115e82ba13a4c33849553156f80947e7711e49))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.11 ([#444](https://github.com/defenseunicorns/uds-package-dubbd/issues/444)) ([8fd6dcf](https://github.com/defenseunicorns/uds-package-dubbd/commit/8fd6dcfd9df678f33483019dce49f8a41a2b748f))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.12 ([#497](https://github.com/defenseunicorns/uds-package-dubbd/issues/497)) ([ad426ee](https://github.com/defenseunicorns/uds-package-dubbd/commit/ad426ee666d92bff0d281928eedc8ca7d9035593))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.13 ([#536](https://github.com/defenseunicorns/uds-package-dubbd/issues/536)) ([be2a30b](https://github.com/defenseunicorns/uds-package-dubbd/commit/be2a30b8cc5635fb02b1fd1ab99b337cadea037f))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.6 ([#345](https://github.com/defenseunicorns/uds-package-dubbd/issues/345)) ([95c99d0](https://github.com/defenseunicorns/uds-package-dubbd/commit/95c99d06c3162365abd1fec8f6365f4f11d20f96))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.8 ([#375](https://github.com/defenseunicorns/uds-package-dubbd/issues/375)) ([5040605](https://github.com/defenseunicorns/uds-package-dubbd/commit/5040605a8606c0470231166e2acc643bfb4a1ba6))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.9 ([#438](https://github.com/defenseunicorns/uds-package-dubbd/issues/438)) ([57f7607](https://github.com/defenseunicorns/uds-package-dubbd/commit/57f76076717f53ec7b43eba8f8825b34520283bf))
* disable telemetry for neuvector ([#355](https://github.com/defenseunicorns/uds-package-dubbd/issues/355)) ([fca32e0](https://github.com/defenseunicorns/uds-package-dubbd/commit/fca32e0afe010eaa03a8fa40d9f3edf2c79db389))
* fix echo format ([84e2320](https://github.com/defenseunicorns/uds-package-dubbd/commit/84e2320ce1e342dbe03c0578cbfbff95d7d5e50d))
* for local-dev disable neuvector containerd ([ea4ad7e](https://github.com/defenseunicorns/uds-package-dubbd/commit/ea4ad7e37cd7e26781879bdba4b5e724e6c730bc))
* have aws pipeline force destroy s3 for loki ([c002ef8](https://github.com/defenseunicorns/uds-package-dubbd/commit/c002ef87fc78fb6e27ad366f7f2f8a9665a3ed06))
* imports for rke2 ([#575](https://github.com/defenseunicorns/uds-package-dubbd/issues/575)) ([89a8ea2](https://github.com/defenseunicorns/uds-package-dubbd/commit/89a8ea216ffe3f14526ac67f83e95396ae3e7aa9))
* k3d local installation ([#403](https://github.com/defenseunicorns/uds-package-dubbd/issues/403)) ([33cfcff](https://github.com/defenseunicorns/uds-package-dubbd/commit/33cfcff5b5b676d8626e367c19802e0fa7e1f6a6))
* kiali operator memory bump to fix OOM kill ([#513](https://github.com/defenseunicorns/uds-package-dubbd/issues/513)) ([7fa28df](https://github.com/defenseunicorns/uds-package-dubbd/commit/7fa28df65b6cc536ddbd6ca23d090c51cd562ea4))
* kyverno args fixes ([#579](https://github.com/defenseunicorns/uds-package-dubbd/issues/579)) ([fd1cf63](https://github.com/defenseunicorns/uds-package-dubbd/commit/fd1cf63aeceff70f03a8d622dcdc3cb0ffe56308))
* kyverno image registry policy exception ([#607](https://github.com/defenseunicorns/uds-package-dubbd/issues/607)) ([1e16ade](https://github.com/defenseunicorns/uds-package-dubbd/commit/1e16ade27d61997ad290437a52a9c573aa874c3f))
* local component-generator bug ([#605](https://github.com/defenseunicorns/uds-package-dubbd/issues/605)) ([dad8e5c](https://github.com/defenseunicorns/uds-package-dubbd/commit/dad8e5c5049675735831fc7288eae8f67f81b7ff))
* log context ([4096d13](https://github.com/defenseunicorns/uds-package-dubbd/commit/4096d13edb8905de8b38d91a4d13684a7640d4a9))
* log context ([d6f452b](https://github.com/defenseunicorns/uds-package-dubbd/commit/d6f452b022992319c889ab42127f5498730b7793))
* logs steps ([6b9c153](https://github.com/defenseunicorns/uds-package-dubbd/commit/6b9c15318c3b9681df0f8631fae7684fca4a67b3))
* make admin ingress configurable ([#316](https://github.com/defenseunicorns/uds-package-dubbd/issues/316)) ([f78f388](https://github.com/defenseunicorns/uds-package-dubbd/commit/f78f388708a86538afa470681e9892354af4819f))
* misplaced files in zarf.yaml ([#283](https://github.com/defenseunicorns/uds-package-dubbd/issues/283)) ([48d3744](https://github.com/defenseunicorns/uds-package-dubbd/commit/48d37447c937c9d11cfa05511ca4d285497ca496))
* missing webhook deletion for kyverno ([7b6cf38](https://github.com/defenseunicorns/uds-package-dubbd/commit/7b6cf38937d8926d517608131a9ff1246fcc9ba4))
* more logging ([d271958](https://github.com/defenseunicorns/uds-package-dubbd/commit/d2719589e38f67fdd3945856bb10fb377051c258))
* move loki destroy to zarf pkg deploy ([854e4ef](https://github.com/defenseunicorns/uds-package-dubbd/commit/854e4efb64e37beff213fe4b6209c6274861677b))
* move teardown back to zarf.yaml ([#241](https://github.com/defenseunicorns/uds-package-dubbd/issues/241)) ([da61fd0](https://github.com/defenseunicorns/uds-package-dubbd/commit/da61fd028fa2bfbd6bc597f9c238a27cc42ce084))
* Only run tests on merge to main for versioning and not for tagging ([c85cac6](https://github.com/defenseunicorns/uds-package-dubbd/commit/c85cac693e753f5e69a83831cab9ca6b36e312c8))
* ostype not recognized ([#610](https://github.com/defenseunicorns/uds-package-dubbd/issues/610)) ([d6177f3](https://github.com/defenseunicorns/uds-package-dubbd/commit/d6177f371ea4d9e9ffff27ea9b16935ba295c221))
* paramater type mismatch ([29e86bf](https://github.com/defenseunicorns/uds-package-dubbd/commit/29e86bf49c378771aa9ebb520d4ad79e755772ab))
* point to updated iac repo module path ([bc053d5](https://github.com/defenseunicorns/uds-package-dubbd/commit/bc053d517f86ae02d5e33dbb12dfccb3893c540b))
* Propagate region variable from Zarf to Terraform. ([#522](https://github.com/defenseunicorns/uds-package-dubbd/issues/522)) ([92d531d](https://github.com/defenseunicorns/uds-package-dubbd/commit/92d531d5a56b5388297ed3e1e03e088da825e71f))
* release flag ([b23ecad](https://github.com/defenseunicorns/uds-package-dubbd/commit/b23ecad45433b233a225882fe3b602757e5af43c))
* release-please to use inline comments ([#236](https://github.com/defenseunicorns/uds-package-dubbd/issues/236)) ([c1c435e](https://github.com/defenseunicorns/uds-package-dubbd/commit/c1c435e89d414a1d2a70cc995d7e29a824e6670e))
* remove *.md exclusion from PR flow ([88f6c59](https://github.com/defenseunicorns/uds-package-dubbd/commit/88f6c59b49eb619d03cd92064e634e8a009d66fb))
* remove kyverno exception ns boundary ([#614](https://github.com/defenseunicorns/uds-package-dubbd/issues/614)) ([31a659e](https://github.com/defenseunicorns/uds-package-dubbd/commit/31a659e3c6c2d0c60075cf59ac5e6168445411ac))
* remove md exclusion from release workflow ([f8c792f](https://github.com/defenseunicorns/uds-package-dubbd/commit/f8c792f9b95623e9aa3a8f29205b8796d619cb2d))
* revert Kiali fix now present in BB v2.10.0 ([#563](https://github.com/defenseunicorns/uds-package-dubbd/issues/563)) ([7d8a3e1](https://github.com/defenseunicorns/uds-package-dubbd/commit/7d8a3e160c45709f5f5cb58925190dfd0e6e0541))
* set min tls version at gateway ([#252](https://github.com/defenseunicorns/uds-package-dubbd/issues/252)) ([6ebe6fd](https://github.com/defenseunicorns/uds-package-dubbd/commit/6ebe6fddac8aee854d656142d8b121b03cf59e03))
* syntax error in aws pipeline for zarf pkg deploy ([58cdfff](https://github.com/defenseunicorns/uds-package-dubbd/commit/58cdfffc6e3c270a59c367169a96ef629c3c1b7a))
* temp fix to secret used by kiali for grafana ([#554](https://github.com/defenseunicorns/uds-package-dubbd/issues/554)) ([45cc935](https://github.com/defenseunicorns/uds-package-dubbd/commit/45cc935923b0ace254b1bfd625119910147c1b3f))
* test ([763ae84](https://github.com/defenseunicorns/uds-package-dubbd/commit/763ae84cc466a767e9343ac2252202f825e7d091))
* test false ([2cd8cbf](https://github.com/defenseunicorns/uds-package-dubbd/commit/2cd8cbf3462f9e589af780c74e2f6e00c37927d8))
* Update AWS config in CI to use OIDC auth ([#303](https://github.com/defenseunicorns/uds-package-dubbd/issues/303)) ([2d19a84](https://github.com/defenseunicorns/uds-package-dubbd/commit/2d19a8431b7057cab08a4ced6dc275d5a08fd4b2))
* update aws zarf tf to allow re-run ([#186](https://github.com/defenseunicorns/uds-package-dubbd/issues/186)) ([25bc7ef](https://github.com/defenseunicorns/uds-package-dubbd/commit/25bc7efeb8668ffe36f2d19cdcdce1e32584eba1))
* update conditionals on ingress upgrade to fix syntax ([#309](https://github.com/defenseunicorns/uds-package-dubbd/issues/309)) ([01167a6](https://github.com/defenseunicorns/uds-package-dubbd/commit/01167a69006cd50c1f8c5fd5d84a171ab449567d))
* update deletes and bb version ([f2f8920](https://github.com/defenseunicorns/uds-package-dubbd/commit/f2f8920c28b15ea542073a07bf5a0a21f001382d))
* Update dubbd-aws package name in upgrade job ([#292](https://github.com/defenseunicorns/uds-package-dubbd/issues/292)) ([4b3dc0b](https://github.com/defenseunicorns/uds-package-dubbd/commit/4b3dc0b5bb6f6362e282f907937e2021cd9061e8))
* update flux reconcile timeout & verbose args ([#198](https://github.com/defenseunicorns/uds-package-dubbd/issues/198)) ([d63c060](https://github.com/defenseunicorns/uds-package-dubbd/commit/d63c0607c6bac303fa7839794917bef671f266af))
* update kyverno image reg policy for pods only ([#599](https://github.com/defenseunicorns/uds-package-dubbd/issues/599)) ([2397137](https://github.com/defenseunicorns/uds-package-dubbd/commit/2397137cdaca2253cd0f3681541a3a39927b2626))
* update OSCAL version ([#593](https://github.com/defenseunicorns/uds-package-dubbd/issues/593)) ([d4f1026](https://github.com/defenseunicorns/uds-package-dubbd/commit/d4f102612602f0e42e83ec0876df7384facc658d))
* update preflight to remove deprecated arg ([#577](https://github.com/defenseunicorns/uds-package-dubbd/issues/577)) ([dadfbb8](https://github.com/defenseunicorns/uds-package-dubbd/commit/dadfbb87ba9c1bf1b7a4355f56585cbb150b9769))
* Update Release Please docs in README ([#263](https://github.com/defenseunicorns/uds-package-dubbd/issues/263)) ([d4f34b3](https://github.com/defenseunicorns/uds-package-dubbd/commit/d4f34b354bc89f5dcef2d1876a27bd31baed838a))
* Update workflow path filters ([#320](https://github.com/defenseunicorns/uds-package-dubbd/issues/320)) ([18c47cd](https://github.com/defenseunicorns/uds-package-dubbd/commit/18c47cd57d60c833e9db9e7fbd25fbf177800516))
* updating istio values and config example ([d0c6384](https://github.com/defenseunicorns/uds-package-dubbd/commit/d0c6384a8777886c35c195d572d124704ac95e7a))
* updating loki module with force_destroy var ([660fb48](https://github.com/defenseunicorns/uds-package-dubbd/commit/660fb487fea9b7338542aac46fbeef064b1f7f86))
* updating main.tf with force_destroy var ([991391a](https://github.com/defenseunicorns/uds-package-dubbd/commit/991391ac3cbbca3fdb33a6dc637f0c76a13f3e8c))
* updating oscal configs to include neuvector ([#458](https://github.com/defenseunicorns/uds-package-dubbd/issues/458)) ([c0060cc](https://github.com/defenseunicorns/uds-package-dubbd/commit/c0060cc43e26a329a12046170abbe4bc72c8e813))
* use release_created ([4728188](https://github.com/defenseunicorns/uds-package-dubbd/commit/4728188e6c96de40faef07c7d1e38be01947bd45))
* whitespace ([c927380](https://github.com/defenseunicorns/uds-package-dubbd/commit/c9273803e3af08d477511086b35d335e9b2fd419))


### Miscellaneous

* bumps dubbd and dubbd-aws versions to 0.2.2 ([#264](https://github.com/defenseunicorns/uds-package-dubbd/issues/264)) ([1401bb3](https://github.com/defenseunicorns/uds-package-dubbd/commit/1401bb3186e40e97ae1421f5a31fd19f49b06cfb))
* **deps:** bump google.golang.org/grpc from 1.51.0 to 1.53.0 in /aws/cloudtrail/test ([#361](https://github.com/defenseunicorns/uds-package-dubbd/issues/361)) ([10b202d](https://github.com/defenseunicorns/uds-package-dubbd/commit/10b202de072d03a17ef151b35bf903d7edf04d13))
* **deps:** bump google.golang.org/grpc from 1.51.0 to 1.53.0 in /aws/eks/test ([#362](https://github.com/defenseunicorns/uds-package-dubbd/issues/362)) ([3dc2fd8](https://github.com/defenseunicorns/uds-package-dubbd/commit/3dc2fd8f0abae06cb04eb918ad48e982785a2755))
* **deps:** update actions/checkout action to v3 ([#475](https://github.com/defenseunicorns/uds-package-dubbd/issues/475)) ([c4a8433](https://github.com/defenseunicorns/uds-package-dubbd/commit/c4a843360fb9b1b84313ef0829a5009289a79dbb))
* **deps:** update actions/checkout action to v3 [ci-skip] ([b19936a](https://github.com/defenseunicorns/uds-package-dubbd/commit/b19936a90e105b61f0e983da635bf40f82d38b95))
* **deps:** update actions/checkout action to v4 ([#545](https://github.com/defenseunicorns/uds-package-dubbd/issues/545)) ([bbd205a](https://github.com/defenseunicorns/uds-package-dubbd/commit/bbd205a435b848920b285eb5f9ebd1ffd40c084a))
* **deps:** update actions/checkout action to v4 ([#571](https://github.com/defenseunicorns/uds-package-dubbd/issues/571)) ([5ed2b18](https://github.com/defenseunicorns/uds-package-dubbd/commit/5ed2b18ebb9f679f3fbb662137bf204f4f5911d4))
* **deps:** update actions/checkout action to v4 ([#630](https://github.com/defenseunicorns/uds-package-dubbd/issues/630)) ([016b09e](https://github.com/defenseunicorns/uds-package-dubbd/commit/016b09ec888da8e1816811adbb6f9977a2f0827e))
* **deps:** update actions/setup-node action to v4 ([#604](https://github.com/defenseunicorns/uds-package-dubbd/issues/604)) ([a05e613](https://github.com/defenseunicorns/uds-package-dubbd/commit/a05e6135c9d96f432cd8bc0b4ff43e9b05fc9851))
* **deps:** update actions/upload-artifact action to v3 ([#350](https://github.com/defenseunicorns/uds-package-dubbd/issues/350)) ([2df824e](https://github.com/defenseunicorns/uds-package-dubbd/commit/2df824e8162520ad5a027c5ff1abab4e29f168e6))
* **deps:** update aws-actions/configure-aws-credentials action to v2 [ci-skip] ([e5986e6](https://github.com/defenseunicorns/uds-package-dubbd/commit/e5986e6c7501f8459568424e3440b6cc27442af4))
* **deps:** update aws-actions/configure-aws-credentials action to v3 ([#525](https://github.com/defenseunicorns/uds-package-dubbd/issues/525)) ([9257db2](https://github.com/defenseunicorns/uds-package-dubbd/commit/9257db2b19902a76290ea5ba7d2e90a24700e19b))
* **deps:** update aws-actions/configure-aws-credentials action to v4 ([#564](https://github.com/defenseunicorns/uds-package-dubbd/issues/564)) ([2af60f6](https://github.com/defenseunicorns/uds-package-dubbd/commit/2af60f6778afc5dac92ab319158be3f2eb921582))
* **deps:** update aws-actions/configure-aws-credentials action to v4 ([#664](https://github.com/defenseunicorns/uds-package-dubbd/issues/664)) ([642e948](https://github.com/defenseunicorns/uds-package-dubbd/commit/642e948ebdc67952d00ed6dfeb8088f326d9e863))
* **deps:** update defenseunicorns/uds-aws-ci-k3d action to v0.0.3 ([#344](https://github.com/defenseunicorns/uds-package-dubbd/issues/344)) ([bb04cc2](https://github.com/defenseunicorns/uds-package-dubbd/commit/bb04cc2a9be1e8e727859998d0a3b8c8d589db60))
* **deps:** update dependency defenseunicorns/zarf to v0.26.0 [ci-skip] ([d1cda0e](https://github.com/defenseunicorns/uds-package-dubbd/commit/d1cda0e03ee13ec37f9db7895d5621da7af8f508))
* **deps:** update dependency defenseunicorns/zarf to v0.26.2 [ci-skip] ([df0c12b](https://github.com/defenseunicorns/uds-package-dubbd/commit/df0c12b3cdd2cd97be22882fa4654ad5d9c7da7e))
* **deps:** update dependency defenseunicorns/zarf to v0.27.0 [ci-skip] ([#191](https://github.com/defenseunicorns/uds-package-dubbd/issues/191)) ([b2112fb](https://github.com/defenseunicorns/uds-package-dubbd/commit/b2112fbee5d36a19051e545ed8cdc6079c8752e3))
* **deps:** update dependency defenseunicorns/zarf to v0.27.1 [ci-skip] ([#225](https://github.com/defenseunicorns/uds-package-dubbd/issues/225)) ([97adacc](https://github.com/defenseunicorns/uds-package-dubbd/commit/97adaccb357794b15af3eb9c7b6e80352724216a))
* **deps:** update dependency defenseunicorns/zarf to v0.28.2 ([#341](https://github.com/defenseunicorns/uds-package-dubbd/issues/341)) ([e616375](https://github.com/defenseunicorns/uds-package-dubbd/commit/e6163755642aacc77ee9574d340560006d607bd0))
* **deps:** update dependency defenseunicorns/zarf to v0.28.3 ([#421](https://github.com/defenseunicorns/uds-package-dubbd/issues/421)) ([fc32a54](https://github.com/defenseunicorns/uds-package-dubbd/commit/fc32a54e613ede698b3fb934235d96909650ef2f))
* **deps:** update dependency defenseunicorns/zarf to v0.28.4 ([#474](https://github.com/defenseunicorns/uds-package-dubbd/issues/474)) ([53fdbd5](https://github.com/defenseunicorns/uds-package-dubbd/commit/53fdbd562d783d6f119b9a980df7669892522db8))
* **deps:** update dependency defenseunicorns/zarf to v0.29.0 ([#501](https://github.com/defenseunicorns/uds-package-dubbd/issues/501)) ([b923ca5](https://github.com/defenseunicorns/uds-package-dubbd/commit/b923ca5621612ae2059ba5083496b31a5f60dd0d))
* **deps:** update dependency defenseunicorns/zarf to v0.29.1 ([#539](https://github.com/defenseunicorns/uds-package-dubbd/issues/539)) ([10000d2](https://github.com/defenseunicorns/uds-package-dubbd/commit/10000d2cb77fbd0a7c05e1b6ef3c0f3e7e7eda0b))
* **deps:** update dependency defenseunicorns/zarf to v0.29.2 ([#560](https://github.com/defenseunicorns/uds-package-dubbd/issues/560)) ([404d769](https://github.com/defenseunicorns/uds-package-dubbd/commit/404d76907604ec961c5e3c6fe491a842e1d300fa))
* **deps:** update dependency defenseunicorns/zarf to v0.30.1 ([#589](https://github.com/defenseunicorns/uds-package-dubbd/issues/589)) ([b7f7a40](https://github.com/defenseunicorns/uds-package-dubbd/commit/b7f7a40b955ef18f2b7cf3472a5663d044afb8bd))
* **deps:** update dependency defenseunicorns/zarf to v0.31.3 ([#613](https://github.com/defenseunicorns/uds-package-dubbd/issues/613)) ([b4b79d4](https://github.com/defenseunicorns/uds-package-dubbd/commit/b4b79d40eee76ce4ef75c9b6703dc5462bebcdd4))
* **deps:** update dependency defenseunicorns/zarf to v0.31.4 ([#646](https://github.com/defenseunicorns/uds-package-dubbd/issues/646)) ([d85e047](https://github.com/defenseunicorns/uds-package-dubbd/commit/d85e047c745288e07189e2e181daa6d01926ccb1))
* **deps:** update dependency defenseunicorns/zarf to v0.32.1 ([#659](https://github.com/defenseunicorns/uds-package-dubbd/issues/659)) ([858fd57](https://github.com/defenseunicorns/uds-package-dubbd/commit/858fd57f273426ea4712411822471de58cf973af))
* **deps:** update docker image quay.io/metallb/controller to v0.13.10 [ci-skip] ([#310](https://github.com/defenseunicorns/uds-package-dubbd/issues/310)) ([702c15a](https://github.com/defenseunicorns/uds-package-dubbd/commit/702c15a98b97d8d864b5b72042f176423f16b611))
* **deps:** update docker image quay.io/metallb/speaker to v0.13.10 [ci-skip] ([#311](https://github.com/defenseunicorns/uds-package-dubbd/issues/311)) ([c86883f](https://github.com/defenseunicorns/uds-package-dubbd/commit/c86883f200d8b2249e42d6d86ee4bcda6d42a85d))
* **deps:** update docker/login-action action to v2 [ci-skip] ([b6e3cd9](https://github.com/defenseunicorns/uds-package-dubbd/commit/b6e3cd9b5dab39d9a2e8caa70a102324aa5b438c))
* **deps:** update docker/login-action action to v3 ([#565](https://github.com/defenseunicorns/uds-package-dubbd/issues/565)) ([fc07a42](https://github.com/defenseunicorns/uds-package-dubbd/commit/fc07a42aad27dc15b9ac2f57bebf68cab366cc72))
* **deps:** update gitlab tag big-bang/bigbang to v1.57.1 [ci-skip] ([1739fd4](https://github.com/defenseunicorns/uds-package-dubbd/commit/1739fd459f13995f28b7a8e261b0f64cce0a5aab))
* **deps:** update gitlab tag big-bang/bigbang to v2 [ci-skip] ([a088979](https://github.com/defenseunicorns/uds-package-dubbd/commit/a0889796661c2da2b35d2b679feffb99082cb513))
* **deps:** update gitlab tag big-bang/bigbang to v2 [ci-skip] ([683d4ca](https://github.com/defenseunicorns/uds-package-dubbd/commit/683d4ca01363d2db256540077cf96d6850ac904a))
* **deps:** update gitlab tag big-bang/bigbang to v2.1.0 [ci-skip] ([bd3a132](https://github.com/defenseunicorns/uds-package-dubbd/commit/bd3a132637ef1ad26fbf2fcb4e3b832b39606002))
* **deps:** update gitlab tag big-bang/bigbang to v2.1.0 [ci-skip] ([f9e7379](https://github.com/defenseunicorns/uds-package-dubbd/commit/f9e73791b52ff9398f1cd078379886405db10957))
* **deps:** update gitlab tag big-bang/bigbang to v2.10.0 ([#559](https://github.com/defenseunicorns/uds-package-dubbd/issues/559)) ([03df8e5](https://github.com/defenseunicorns/uds-package-dubbd/commit/03df8e501f217af8cb8b835707c11a8014405453))
* **deps:** update gitlab tag big-bang/bigbang to v2.11.1 ([#576](https://github.com/defenseunicorns/uds-package-dubbd/issues/576)) ([32f5e58](https://github.com/defenseunicorns/uds-package-dubbd/commit/32f5e588bfb3ad73008fd4a89a9c0a4f572dca80))
* **deps:** update gitlab tag big-bang/bigbang to v2.12.0 ([#591](https://github.com/defenseunicorns/uds-package-dubbd/issues/591)) ([7a6e08e](https://github.com/defenseunicorns/uds-package-dubbd/commit/7a6e08ec25becf5531333d52a47b1455f8582aac))
* **deps:** update gitlab tag big-bang/bigbang to v2.13.1 ([#600](https://github.com/defenseunicorns/uds-package-dubbd/issues/600)) ([e5810c7](https://github.com/defenseunicorns/uds-package-dubbd/commit/e5810c7270d4a4fcbf6b5e8780589e1173df5071))
* **deps:** update gitlab tag big-bang/bigbang to v2.14.0 ([#616](https://github.com/defenseunicorns/uds-package-dubbd/issues/616)) ([ba5afbf](https://github.com/defenseunicorns/uds-package-dubbd/commit/ba5afbf7119e589588858c0f7b09de600a213d21))
* **deps:** update gitlab tag big-bang/bigbang to v2.15.1 ([#625](https://github.com/defenseunicorns/uds-package-dubbd/issues/625)) ([7e84727](https://github.com/defenseunicorns/uds-package-dubbd/commit/7e84727ad701a991dd5adc4f5cab9c28f9eee57c))
* **deps:** update gitlab tag big-bang/bigbang to v2.16.0 ([#642](https://github.com/defenseunicorns/uds-package-dubbd/issues/642)) ([d47c7aa](https://github.com/defenseunicorns/uds-package-dubbd/commit/d47c7aab947088c22079f40add2973bd89f7b18a))
* **deps:** update gitlab tag big-bang/bigbang to v2.17.0 ([#658](https://github.com/defenseunicorns/uds-package-dubbd/issues/658)) ([935cc84](https://github.com/defenseunicorns/uds-package-dubbd/commit/935cc84e3eaf96e039cf56fd0b81f7e6db504589))
* **deps:** update gitlab tag big-bang/bigbang to v2.18.0 ([#666](https://github.com/defenseunicorns/uds-package-dubbd/issues/666)) ([bb3b651](https://github.com/defenseunicorns/uds-package-dubbd/commit/bb3b65108540ff6254b2292103548b4d6d86d85e))
* **deps:** update gitlab tag big-bang/bigbang to v2.2.0 [ci-skip] ([#190](https://github.com/defenseunicorns/uds-package-dubbd/issues/190)) ([5e4c185](https://github.com/defenseunicorns/uds-package-dubbd/commit/5e4c18517ea04711e1e8ad67fa801fc8825a5ca0))
* **deps:** update gitlab tag big-bang/bigbang to v2.3.0 [ci-skip] ([#207](https://github.com/defenseunicorns/uds-package-dubbd/issues/207)) ([54341bd](https://github.com/defenseunicorns/uds-package-dubbd/commit/54341bdc29874139a1637e1c2b79e882ccf2361e))
* **deps:** update gitlab tag big-bang/bigbang to v2.4.0 [ci-skip] ([#298](https://github.com/defenseunicorns/uds-package-dubbd/issues/298)) ([2b3f49f](https://github.com/defenseunicorns/uds-package-dubbd/commit/2b3f49f397dd9d61d6c03c3936b9bf06aba62612))
* **deps:** update gitlab tag big-bang/bigbang to v2.4.1 ([#328](https://github.com/defenseunicorns/uds-package-dubbd/issues/328)) ([a55e3c1](https://github.com/defenseunicorns/uds-package-dubbd/commit/a55e3c1dddaa5919d813e042ade20ad5533d3036))
* **deps:** update gitlab tag big-bang/bigbang to v2.5.0 ([#351](https://github.com/defenseunicorns/uds-package-dubbd/issues/351)) ([3369cbe](https://github.com/defenseunicorns/uds-package-dubbd/commit/3369cbef71edc38d9aaa1e18b83230f9221072cc))
* **deps:** update gitlab tag big-bang/bigbang to v2.6.0 ([#401](https://github.com/defenseunicorns/uds-package-dubbd/issues/401)) ([ae919ef](https://github.com/defenseunicorns/uds-package-dubbd/commit/ae919efab41f4b25ab913cc672e36aaac391603e))
* **deps:** update gitlab tag big-bang/bigbang to v2.7.0 ([#459](https://github.com/defenseunicorns/uds-package-dubbd/issues/459)) ([46c01d9](https://github.com/defenseunicorns/uds-package-dubbd/commit/46c01d9716f3294e337b1ebc54f984efd669f5ef))
* **deps:** update gitlab tag big-bang/bigbang to v2.7.1 ([#461](https://github.com/defenseunicorns/uds-package-dubbd/issues/461)) ([b3b9fd6](https://github.com/defenseunicorns/uds-package-dubbd/commit/b3b9fd6b9728ac3efd211069cabc1a0eea7714e1))
* **deps:** update gitlab tag big-bang/bigbang to v2.8.0 ([#521](https://github.com/defenseunicorns/uds-package-dubbd/issues/521)) ([1ee1b98](https://github.com/defenseunicorns/uds-package-dubbd/commit/1ee1b98f33b7caee924c7b764454dc5a8eaa39cb))
* **deps:** update gitlab tag big-bang/bigbang to v2.9.0 ([#495](https://github.com/defenseunicorns/uds-package-dubbd/issues/495)) ([cdc4066](https://github.com/defenseunicorns/uds-package-dubbd/commit/cdc40665ff46f11b0e5062e0f4b06fa7ac20dce9))
* **deps:** update google-github-actions/release-please-action action to v4 ([#641](https://github.com/defenseunicorns/uds-package-dubbd/issues/641)) ([7a44bee](https://github.com/defenseunicorns/uds-package-dubbd/commit/7a44beece46e787f27c1924d41c1e273c48d33a0))
* **deps:** update hashicorp/setup-terraform action to v3 ([#631](https://github.com/defenseunicorns/uds-package-dubbd/issues/631)) ([042f3bb](https://github.com/defenseunicorns/uds-package-dubbd/commit/042f3bbf449c3b5cd3212795e8ceaafc3f695101))
* **deps:** update helm chart external-dns to v1.13.1 ([#556](https://github.com/defenseunicorns/uds-package-dubbd/issues/556)) ([8ef35ab](https://github.com/defenseunicorns/uds-package-dubbd/commit/8ef35abe27f207a283f42ff39d641d26e2600c4d))
* **deps:** update stefanzweifel/git-auto-commit-action action to v5 ([#592](https://github.com/defenseunicorns/uds-package-dubbd/issues/592)) ([92f2b67](https://github.com/defenseunicorns/uds-package-dubbd/commit/92f2b6754bf1e2b23cd25d4a98529cfeac7eda83))
* **deps:** update terraform github.com/defenseunicorns/terraform-aws-uds-kms to v0.0.2 ([#415](https://github.com/defenseunicorns/uds-package-dubbd/issues/415)) ([379b979](https://github.com/defenseunicorns/uds-package-dubbd/commit/379b97952b4ddb9a20bea6440bbfa1c852ff17ac))
* **deps:** update terraform github.com/defenseunicorns/terraform-aws-uds-s3 to v0.0.6 ([#516](https://github.com/defenseunicorns/uds-package-dubbd/issues/516)) ([1b960a1](https://github.com/defenseunicorns/uds-package-dubbd/commit/1b960a194992e9c5c7a447f74084366b297ed132))
* **deps:** update terraform github.com/rancherfederal/rke2-aws-tf to v2.4.0 ([#490](https://github.com/defenseunicorns/uds-package-dubbd/issues/490)) ([a9e2d9f](https://github.com/defenseunicorns/uds-package-dubbd/commit/a9e2d9f954f1b1d076a8104cc573da18d039f138))
* **deps:** update terraform null to v3.2.2 ([#628](https://github.com/defenseunicorns/uds-package-dubbd/issues/628)) ([898e8a1](https://github.com/defenseunicorns/uds-package-dubbd/commit/898e8a1e859e14ba356468724780e2a43dd4897a))
* **deps:** update terraform-linters/setup-tflint action to v4 ([#633](https://github.com/defenseunicorns/uds-package-dubbd/issues/633)) ([d0f36f3](https://github.com/defenseunicorns/uds-package-dubbd/commit/d0f36f33ec3d1c16048632e24200eee7bbe1a647))
* **main:** release 0.1.0 ([caa3697](https://github.com/defenseunicorns/uds-package-dubbd/commit/caa36978aac8db90f1207c6f5c1e799f2c8435d5))
* **main:** release 0.1.1 ([9b15469](https://github.com/defenseunicorns/uds-package-dubbd/commit/9b15469374c7ac995a8fee733541c93457d5f0a1))
* **main:** release 0.1.2 ([129e199](https://github.com/defenseunicorns/uds-package-dubbd/commit/129e199b0522cc48ab98e72a8c1f426e9e3511d8))
* **main:** release 0.1.3 ([6d78ecd](https://github.com/defenseunicorns/uds-package-dubbd/commit/6d78ecdf05780e60d6ef226bcfb9d664e144e06a))
* **main:** release 0.10.0 ([#572](https://github.com/defenseunicorns/uds-package-dubbd/issues/572)) ([d9decd0](https://github.com/defenseunicorns/uds-package-dubbd/commit/d9decd0093ee745577e2916906b0772401da1ecf))
* **main:** release 0.10.1 ([#580](https://github.com/defenseunicorns/uds-package-dubbd/issues/580)) ([5783984](https://github.com/defenseunicorns/uds-package-dubbd/commit/5783984839c740ec29c81c9776738abe840d6588))
* **main:** release 0.11.0 ([#588](https://github.com/defenseunicorns/uds-package-dubbd/issues/588)) ([e2db40e](https://github.com/defenseunicorns/uds-package-dubbd/commit/e2db40ea4b7a05a4d3f17a00d06d5e67035c2847))
* **main:** release 0.11.1 ([#594](https://github.com/defenseunicorns/uds-package-dubbd/issues/594)) ([50e190f](https://github.com/defenseunicorns/uds-package-dubbd/commit/50e190f020f7b6788b78b4f25d7160b71f4274d4))
* **main:** release 0.12.0 ([#601](https://github.com/defenseunicorns/uds-package-dubbd/issues/601)) ([66bdefd](https://github.com/defenseunicorns/uds-package-dubbd/commit/66bdefd89812ced52c970a83cba29ecc66276c10))
* **main:** release 0.12.1 ([#615](https://github.com/defenseunicorns/uds-package-dubbd/issues/615)) ([0de829c](https://github.com/defenseunicorns/uds-package-dubbd/commit/0de829c4f3a2cf68ac67338ac1bfe4326ce75bb0))
* **main:** release 0.13.0 ([#617](https://github.com/defenseunicorns/uds-package-dubbd/issues/617)) ([e2e27d6](https://github.com/defenseunicorns/uds-package-dubbd/commit/e2e27d6af64adb60c584e0d0d96f2fb0a0ab2f0c))
* **main:** release 0.14.0 ([#626](https://github.com/defenseunicorns/uds-package-dubbd/issues/626)) ([0207e16](https://github.com/defenseunicorns/uds-package-dubbd/commit/0207e1649209b4c94284632fc7fff31fa955ac45))
* **main:** release 0.15.0 ([#640](https://github.com/defenseunicorns/uds-package-dubbd/issues/640)) ([ed879fe](https://github.com/defenseunicorns/uds-package-dubbd/commit/ed879fe99b62eb0484d56d57dda0b15ade1f1ab2))
* **main:** release 0.16.0 ([#651](https://github.com/defenseunicorns/uds-package-dubbd/issues/651)) ([512d413](https://github.com/defenseunicorns/uds-package-dubbd/commit/512d413658e90b8216da396f99ccde2ed608e762))
* **main:** release 0.17.0 ([#660](https://github.com/defenseunicorns/uds-package-dubbd/issues/660)) ([18fb204](https://github.com/defenseunicorns/uds-package-dubbd/commit/18fb204a23b4828f80535e9703fbf452aa1a9c65))
* **main:** release 0.2.0 ([37427d2](https://github.com/defenseunicorns/uds-package-dubbd/commit/37427d2c36db38947a084e93dea9be729980a5f6))
* **main:** release 0.2.1 ([#237](https://github.com/defenseunicorns/uds-package-dubbd/issues/237)) ([f54a283](https://github.com/defenseunicorns/uds-package-dubbd/commit/f54a283cbbc8947e0af4020c4814c83f991eac1b))
* **main:** release 0.2.3 ([#261](https://github.com/defenseunicorns/uds-package-dubbd/issues/261)) ([b61f207](https://github.com/defenseunicorns/uds-package-dubbd/commit/b61f20729c61fa10138ab181e8d7be3ac6abc198))
* **main:** release 0.2.4 ([#286](https://github.com/defenseunicorns/uds-package-dubbd/issues/286)) ([633ec80](https://github.com/defenseunicorns/uds-package-dubbd/commit/633ec801ac6a2580c482b3d0122686e004faf94b))
* **main:** release 0.3.0 ([#293](https://github.com/defenseunicorns/uds-package-dubbd/issues/293)) ([254312e](https://github.com/defenseunicorns/uds-package-dubbd/commit/254312e3e74a31f5be6383b6c56ccc95444f210e))
* **main:** release 0.4.0 ([#312](https://github.com/defenseunicorns/uds-package-dubbd/issues/312)) ([39b3a3b](https://github.com/defenseunicorns/uds-package-dubbd/commit/39b3a3bb009255951c7116ec858d73d8904c3a6e))
* **main:** release 0.4.1 ([#372](https://github.com/defenseunicorns/uds-package-dubbd/issues/372)) ([6ef4230](https://github.com/defenseunicorns/uds-package-dubbd/commit/6ef423085bf506de9008d92136009e9101b4e0e1))
* **main:** release 0.4.2 ([#387](https://github.com/defenseunicorns/uds-package-dubbd/issues/387)) ([03b6f23](https://github.com/defenseunicorns/uds-package-dubbd/commit/03b6f23b9ee5e907d20c3af544e22ad9a2862da0))
* **main:** release 0.5.0 ([#400](https://github.com/defenseunicorns/uds-package-dubbd/issues/400)) ([5a5bed6](https://github.com/defenseunicorns/uds-package-dubbd/commit/5a5bed6f916913b56b4a96b9107c7b5dc8d1913f))
* **main:** release 0.5.1 ([#426](https://github.com/defenseunicorns/uds-package-dubbd/issues/426)) ([0e188b2](https://github.com/defenseunicorns/uds-package-dubbd/commit/0e188b29f1327adeb147441a9158908c9a0bb1b6))
* **main:** release 0.5.2 ([#445](https://github.com/defenseunicorns/uds-package-dubbd/issues/445)) ([a80e899](https://github.com/defenseunicorns/uds-package-dubbd/commit/a80e8998085c1113d417f603207112a6362b9550))
* **main:** release 0.6.0 ([#450](https://github.com/defenseunicorns/uds-package-dubbd/issues/450)) ([6e974d9](https://github.com/defenseunicorns/uds-package-dubbd/commit/6e974d95181e48d12bf39a889ac986bd42d4342f))
* **main:** release 0.6.1 ([#471](https://github.com/defenseunicorns/uds-package-dubbd/issues/471)) ([12fe4c8](https://github.com/defenseunicorns/uds-package-dubbd/commit/12fe4c824620baa9745e569483a61f3c55e31d24))
* **main:** release 0.6.2 ([#479](https://github.com/defenseunicorns/uds-package-dubbd/issues/479)) ([0bf56bb](https://github.com/defenseunicorns/uds-package-dubbd/commit/0bf56bbc041d43c5fe526b68ab255d8bb0248a01))
* **main:** release 0.7.0 ([#507](https://github.com/defenseunicorns/uds-package-dubbd/issues/507)) ([d1a819e](https://github.com/defenseunicorns/uds-package-dubbd/commit/d1a819e17d99eb5625d5754a67576bc320ef229b))
* **main:** release 0.8.0 ([#532](https://github.com/defenseunicorns/uds-package-dubbd/issues/532)) ([92b8181](https://github.com/defenseunicorns/uds-package-dubbd/commit/92b81811a1889c3e15cab3efcb96dff8da90fa62))
* **main:** release 0.8.1 ([#552](https://github.com/defenseunicorns/uds-package-dubbd/issues/552)) ([46e11d6](https://github.com/defenseunicorns/uds-package-dubbd/commit/46e11d6b03720385182cc4f7dfd0b42cbe4475a5))
* **main:** release 0.9.0 ([#561](https://github.com/defenseunicorns/uds-package-dubbd/issues/561)) ([8b7ff9f](https://github.com/defenseunicorns/uds-package-dubbd/commit/8b7ff9f95fa3151cc19810a64ff2d3a46b8e3970))
* **main:** release 0.9.1 ([#566](https://github.com/defenseunicorns/uds-package-dubbd/issues/566)) ([d455877](https://github.com/defenseunicorns/uds-package-dubbd/commit/d45587716617e440deb2fe9094374c5cc9a1f0b5))
* publish skeleton packages and DUBBD core package ([e92b255](https://github.com/defenseunicorns/uds-package-dubbd/commit/e92b255eef1b6247287dea0132ab96b1718a38d9))
* refactor dubbd-k3d ci to use the uds task runner ([#644](https://github.com/defenseunicorns/uds-package-dubbd/issues/644)) ([1a1e381](https://github.com/defenseunicorns/uds-package-dubbd/commit/1a1e3811b7d84196a7c4c7ef81ab630e1760ba16))
* refactor dubbd-k3d to use uds-k3d ([#619](https://github.com/defenseunicorns/uds-package-dubbd/issues/619)) ([dd4c2e9](https://github.com/defenseunicorns/uds-package-dubbd/commit/dd4c2e94a4c555587f318e56581602a29c882009))
* release 0.17.0 ([#668](https://github.com/defenseunicorns/uds-package-dubbd/issues/668)) ([e7e435f](https://github.com/defenseunicorns/uds-package-dubbd/commit/e7e435f1f1cf17161f0a0b0b86a24b71a3764399))
* release 0.4.0 ([#365](https://github.com/defenseunicorns/uds-package-dubbd/issues/365)) ([bbb8e58](https://github.com/defenseunicorns/uds-package-dubbd/commit/bbb8e58a221a5e1290188f003681645c8f1083ca))
* release 0.5.3 ([#468](https://github.com/defenseunicorns/uds-package-dubbd/issues/468)) ([b4c61aa](https://github.com/defenseunicorns/uds-package-dubbd/commit/b4c61aaa74abb114d89a3af3be49744364c60955))
* remove dead variables from DUBBD ([#510](https://github.com/defenseunicorns/uds-package-dubbd/issues/510)) ([cc127d7](https://github.com/defenseunicorns/uds-package-dubbd/commit/cc127d7d389bfa9035b7ae593fc5889624b1d903))
* set tf version in publish.dubbd.package.yaml ([#637](https://github.com/defenseunicorns/uds-package-dubbd/issues/637)) ([d2d50ca](https://github.com/defenseunicorns/uds-package-dubbd/commit/d2d50ca5793a3d08900fadc71421562e56ea7ffe))
* standardize workflow rules with paths-ignore ([#338](https://github.com/defenseunicorns/uds-package-dubbd/issues/338)) ([07ff428](https://github.com/defenseunicorns/uds-package-dubbd/commit/07ff4286b2d2aac246d1ae50a21c2f3b21886afb))
* switch rke2 CI to uds-ami ([#508](https://github.com/defenseunicorns/uds-package-dubbd/issues/508)) ([6a48b77](https://github.com/defenseunicorns/uds-package-dubbd/commit/6a48b77cbbdceb246445dfbbeb5a25f44c02ec92))
* update bigbang.dev cert ([#503](https://github.com/defenseunicorns/uds-package-dubbd/issues/503)) ([e5b7754](https://github.com/defenseunicorns/uds-package-dubbd/commit/e5b7754c0f70095313637ce7ed458286a669edd7))
* Update Changelog ([#281](https://github.com/defenseunicorns/uds-package-dubbd/issues/281)) ([07b56ad](https://github.com/defenseunicorns/uds-package-dubbd/commit/07b56ad884e1e7ea3180874f45bfa55836422e77))
* update docs ([bce3b40](https://github.com/defenseunicorns/uds-package-dubbd/commit/bce3b4009f0bb38c7083e0b7c8336969c7dddaab))
* update flux version, cert, and oscal ([#618](https://github.com/defenseunicorns/uds-package-dubbd/issues/618)) ([0096e00](https://github.com/defenseunicorns/uds-package-dubbd/commit/0096e00d0f85c5218612eed9db9f1eeffe3b2224))
* update k8s from 1.26 to 1.27 ([#639](https://github.com/defenseunicorns/uds-package-dubbd/issues/639)) ([cd6997c](https://github.com/defenseunicorns/uds-package-dubbd/commit/cd6997c6d1979c074320d438747c86a2c57be7da))
* update packaging standards, add yamllint in CI ([#414](https://github.com/defenseunicorns/uds-package-dubbd/issues/414)) ([f5c7a73](https://github.com/defenseunicorns/uds-package-dubbd/commit/f5c7a7350b5e54e158725547dda0667746e29c78))
* update PUBLIC_{KEY,CERT}_FILE references to {KEY,CERT}_FILE ([#251](https://github.com/defenseunicorns/uds-package-dubbd/issues/251)) ([d4984ee](https://github.com/defenseunicorns/uds-package-dubbd/commit/d4984eeae3371bb64c68be1526136b62f1ba7313))
* update versions for oscal ([#523](https://github.com/defenseunicorns/uds-package-dubbd/issues/523)) ([ebd254b](https://github.com/defenseunicorns/uds-package-dubbd/commit/ebd254baaf38bf5ea699865473d5834a1c17c7f7))
* updated docs and readmes ([#598](https://github.com/defenseunicorns/uds-package-dubbd/issues/598)) ([7650cd3](https://github.com/defenseunicorns/uds-package-dubbd/commit/7650cd3d439f6fe3d993acb77183378f60cf4dcd))
* updates repo name to uds-package-dubbd ([#247](https://github.com/defenseunicorns/uds-package-dubbd/issues/247)) ([12d61ba](https://github.com/defenseunicorns/uds-package-dubbd/commit/12d61ba67f6aa5ca5b3396b54b68c946b1e91a6c))

## [0.17.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.16.0...v0.17.0) (2024-01-19)


### Miscellaneous

* **deps:** update actions/setup-node action to v4 ([#604](https://github.com/defenseunicorns/uds-package-dubbd/issues/604)) ([a05e613](https://github.com/defenseunicorns/uds-package-dubbd/commit/a05e6135c9d96f432cd8bc0b4ff43e9b05fc9851))
* **deps:** update aws-actions/configure-aws-credentials action to v4 ([#664](https://github.com/defenseunicorns/uds-package-dubbd/issues/664)) ([642e948](https://github.com/defenseunicorns/uds-package-dubbd/commit/642e948ebdc67952d00ed6dfeb8088f326d9e863))
* **deps:** update dependency defenseunicorns/zarf to v0.32.1 ([#659](https://github.com/defenseunicorns/uds-package-dubbd/issues/659)) ([858fd57](https://github.com/defenseunicorns/uds-package-dubbd/commit/858fd57f273426ea4712411822471de58cf973af))
* **deps:** update gitlab tag big-bang/bigbang to v2.18.0 ([#666](https://github.com/defenseunicorns/uds-package-dubbd/issues/666)) ([bb3b651](https://github.com/defenseunicorns/uds-package-dubbd/commit/bb3b65108540ff6254b2292103548b4d6d86d85e))
* **deps:** update terraform null to v3.2.2 ([#628](https://github.com/defenseunicorns/uds-package-dubbd/issues/628)) ([898e8a1](https://github.com/defenseunicorns/uds-package-dubbd/commit/898e8a1e859e14ba356468724780e2a43dd4897a))
* release 0.17.0 ([#668](https://github.com/defenseunicorns/uds-package-dubbd/issues/668)) ([e7e435f](https://github.com/defenseunicorns/uds-package-dubbd/commit/e7e435f1f1cf17161f0a0b0b86a24b71a3764399))

## [0.16.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.15.0...v0.16.0) (2023-12-19)


### Miscellaneous

* **deps:** update dependency defenseunicorns/zarf to v0.31.4 ([#646](https://github.com/defenseunicorns/uds-package-dubbd/issues/646)) ([d85e047](https://github.com/defenseunicorns/uds-package-dubbd/commit/d85e047c745288e07189e2e181daa6d01926ccb1))
* **deps:** update gitlab tag big-bang/bigbang to v2.17.0 ([#658](https://github.com/defenseunicorns/uds-package-dubbd/issues/658)) ([935cc84](https://github.com/defenseunicorns/uds-package-dubbd/commit/935cc84e3eaf96e039cf56fd0b81f7e6db504589))
* **deps:** update google-github-actions/release-please-action action to v4 ([#641](https://github.com/defenseunicorns/uds-package-dubbd/issues/641)) ([7a44bee](https://github.com/defenseunicorns/uds-package-dubbd/commit/7a44beece46e787f27c1924d41c1e273c48d33a0))
* **deps:** update terraform-linters/setup-tflint action to v4 ([#633](https://github.com/defenseunicorns/uds-package-dubbd/issues/633)) ([d0f36f3](https://github.com/defenseunicorns/uds-package-dubbd/commit/d0f36f33ec3d1c16048632e24200eee7bbe1a647))
* refactor dubbd-k3d ci to use the uds task runner ([#644](https://github.com/defenseunicorns/uds-package-dubbd/issues/644)) ([1a1e381](https://github.com/defenseunicorns/uds-package-dubbd/commit/1a1e3811b7d84196a7c4c7ef81ab630e1760ba16))
* update k8s from 1.26 to 1.27 ([#639](https://github.com/defenseunicorns/uds-package-dubbd/issues/639)) ([cd6997c](https://github.com/defenseunicorns/uds-package-dubbd/commit/cd6997c6d1979c074320d438747c86a2c57be7da))

## [0.15.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.14.0...v0.15.0) (2023-12-11)


### Features

* add velero for rke2 by default ([d59ff4e](https://github.com/defenseunicorns/uds-package-dubbd/commit/d59ff4ea625fa8d2c3abd8eab3a6af906b461d80))


### Miscellaneous

* **deps:** update actions/checkout action to v4 ([#630](https://github.com/defenseunicorns/uds-package-dubbd/issues/630)) ([016b09e](https://github.com/defenseunicorns/uds-package-dubbd/commit/016b09ec888da8e1816811adbb6f9977a2f0827e))
* **deps:** update dependency defenseunicorns/zarf to v0.31.3 ([#613](https://github.com/defenseunicorns/uds-package-dubbd/issues/613)) ([b4b79d4](https://github.com/defenseunicorns/uds-package-dubbd/commit/b4b79d40eee76ce4ef75c9b6703dc5462bebcdd4))
* **deps:** update gitlab tag big-bang/bigbang to v2.16.0 ([#642](https://github.com/defenseunicorns/uds-package-dubbd/issues/642)) ([d47c7aa](https://github.com/defenseunicorns/uds-package-dubbd/commit/d47c7aab947088c22079f40add2973bd89f7b18a))
* **deps:** update hashicorp/setup-terraform action to v3 ([#631](https://github.com/defenseunicorns/uds-package-dubbd/issues/631)) ([042f3bb](https://github.com/defenseunicorns/uds-package-dubbd/commit/042f3bbf449c3b5cd3212795e8ceaafc3f695101))
* set tf version in publish.dubbd.package.yaml ([#637](https://github.com/defenseunicorns/uds-package-dubbd/issues/637)) ([d2d50ca](https://github.com/defenseunicorns/uds-package-dubbd/commit/d2d50ca5793a3d08900fadc71421562e56ea7ffe))

## [0.14.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.13.0...v0.14.0) (2023-11-28)


### Miscellaneous

* **deps:** update gitlab tag big-bang/bigbang to v2.15.1 ([#625](https://github.com/defenseunicorns/uds-package-dubbd/issues/625)) ([7e84727](https://github.com/defenseunicorns/uds-package-dubbd/commit/7e84727ad701a991dd5adc4f5cab9c28f9eee57c))
* refactor dubbd-k3d to use uds-k3d ([#619](https://github.com/defenseunicorns/uds-package-dubbd/issues/619)) ([dd4c2e9](https://github.com/defenseunicorns/uds-package-dubbd/commit/dd4c2e94a4c555587f318e56581602a29c882009))

## [0.13.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.12.1...v0.13.0) (2023-11-14)


### Miscellaneous

* **deps:** update gitlab tag big-bang/bigbang to v2.14.0 ([#616](https://github.com/defenseunicorns/uds-package-dubbd/issues/616)) ([ba5afbf](https://github.com/defenseunicorns/uds-package-dubbd/commit/ba5afbf7119e589588858c0f7b09de600a213d21))
* update flux version, cert, and oscal ([#618](https://github.com/defenseunicorns/uds-package-dubbd/issues/618)) ([0096e00](https://github.com/defenseunicorns/uds-package-dubbd/commit/0096e00d0f85c5218612eed9db9f1eeffe3b2224))

## [0.12.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.12.0...v0.12.1) (2023-11-03)


### Features

* update DUBBD to handle custom zarf init package. ([#611](https://github.com/defenseunicorns/uds-package-dubbd/issues/611)) ([4acec87](https://github.com/defenseunicorns/uds-package-dubbd/commit/4acec8749b9e69ffd925f8824b10e7a1b255bad4))


### Bug Fixes

* remove kyverno exception ns boundary ([#614](https://github.com/defenseunicorns/uds-package-dubbd/issues/614)) ([31a659e](https://github.com/defenseunicorns/uds-package-dubbd/commit/31a659e3c6c2d0c60075cf59ac5e6168445411ac))

## [0.12.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.11.1...v0.12.0) (2023-10-31)


### Bug Fixes

* kyverno image registry policy exception ([#607](https://github.com/defenseunicorns/uds-package-dubbd/issues/607)) ([1e16ade](https://github.com/defenseunicorns/uds-package-dubbd/commit/1e16ade27d61997ad290437a52a9c573aa874c3f))
* local component-generator bug ([#605](https://github.com/defenseunicorns/uds-package-dubbd/issues/605)) ([dad8e5c](https://github.com/defenseunicorns/uds-package-dubbd/commit/dad8e5c5049675735831fc7288eae8f67f81b7ff))
* ostype not recognized ([#610](https://github.com/defenseunicorns/uds-package-dubbd/issues/610)) ([d6177f3](https://github.com/defenseunicorns/uds-package-dubbd/commit/d6177f371ea4d9e9ffff27ea9b16935ba295c221))


### Miscellaneous

* **deps:** update gitlab tag big-bang/bigbang to v2.13.1 ([#600](https://github.com/defenseunicorns/uds-package-dubbd/issues/600)) ([e5810c7](https://github.com/defenseunicorns/uds-package-dubbd/commit/e5810c7270d4a4fcbf6b5e8780589e1173df5071))
* updated docs and readmes ([#598](https://github.com/defenseunicorns/uds-package-dubbd/issues/598)) ([7650cd3](https://github.com/defenseunicorns/uds-package-dubbd/commit/7650cd3d439f6fe3d993acb77183378f60cf4dcd))

## [0.11.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.11.0...v0.11.1) (2023-10-18)


### Bug Fixes

* bump flux resources requests & limits via patch ([#586](https://github.com/defenseunicorns/uds-package-dubbd/issues/586)) ([b69c5d7](https://github.com/defenseunicorns/uds-package-dubbd/commit/b69c5d780efffeb3570c4e1131d9fe6650d12891))
* update kyverno image reg policy for pods only ([#599](https://github.com/defenseunicorns/uds-package-dubbd/issues/599)) ([2397137](https://github.com/defenseunicorns/uds-package-dubbd/commit/2397137cdaca2253cd0f3681541a3a39927b2626))
* update OSCAL version ([#593](https://github.com/defenseunicorns/uds-package-dubbd/issues/593)) ([d4f1026](https://github.com/defenseunicorns/uds-package-dubbd/commit/d4f102612602f0e42e83ec0876df7384facc658d))


### Miscellaneous

* **deps:** update dependency defenseunicorns/zarf to v0.30.1 ([#589](https://github.com/defenseunicorns/uds-package-dubbd/issues/589)) ([b7f7a40](https://github.com/defenseunicorns/uds-package-dubbd/commit/b7f7a40b955ef18f2b7cf3472a5663d044afb8bd))
* **deps:** update stefanzweifel/git-auto-commit-action action to v5 ([#592](https://github.com/defenseunicorns/uds-package-dubbd/issues/592)) ([92f2b67](https://github.com/defenseunicorns/uds-package-dubbd/commit/92f2b6754bf1e2b23cd25d4a98529cfeac7eda83))

## [0.11.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.10.1...v0.11.0) (2023-10-10)


### Features

* rm external-dns from zarf pkg ([#587](https://github.com/defenseunicorns/uds-package-dubbd/issues/587)) ([ccca626](https://github.com/defenseunicorns/uds-package-dubbd/commit/ccca626e1c9141d9a78436714ae3b8b15c34f9d8))


### Miscellaneous

* **deps:** update gitlab tag big-bang/bigbang to v2.12.0 ([#591](https://github.com/defenseunicorns/uds-package-dubbd/issues/591)) ([7a6e08e](https://github.com/defenseunicorns/uds-package-dubbd/commit/7a6e08ec25becf5531333d52a47b1455f8582aac))

## [0.10.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.10.0...v0.10.1) (2023-09-29)


### Bug Fixes

* kyverno args fixes ([#579](https://github.com/defenseunicorns/uds-package-dubbd/issues/579)) ([fd1cf63](https://github.com/defenseunicorns/uds-package-dubbd/commit/fd1cf63aeceff70f03a8d622dcdc3cb0ffe56308))

## [0.10.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.9.1...v0.10.0) (2023-09-27)


### Features

* add automation & docs to support releases ([#569](https://github.com/defenseunicorns/uds-package-dubbd/issues/569)) ([89d9afd](https://github.com/defenseunicorns/uds-package-dubbd/commit/89d9afdfb9fdb8cb1c4bd19e8518b4f259da374b))


### Bug Fixes

* imports for rke2 ([#575](https://github.com/defenseunicorns/uds-package-dubbd/issues/575)) ([89a8ea2](https://github.com/defenseunicorns/uds-package-dubbd/commit/89a8ea216ffe3f14526ac67f83e95396ae3e7aa9))
* update preflight to remove deprecated arg ([#577](https://github.com/defenseunicorns/uds-package-dubbd/issues/577)) ([dadfbb8](https://github.com/defenseunicorns/uds-package-dubbd/commit/dadfbb87ba9c1bf1b7a4355f56585cbb150b9769))


### Miscellaneous

* **deps:** update actions/checkout action to v4 ([#571](https://github.com/defenseunicorns/uds-package-dubbd/issues/571)) ([5ed2b18](https://github.com/defenseunicorns/uds-package-dubbd/commit/5ed2b18ebb9f679f3fbb662137bf204f4f5911d4))
* **deps:** update gitlab tag big-bang/bigbang to v2.11.1 ([#576](https://github.com/defenseunicorns/uds-package-dubbd/issues/576)) ([32f5e58](https://github.com/defenseunicorns/uds-package-dubbd/commit/32f5e588bfb3ad73008fd4a89a9c0a4f572dca80))

## [0.9.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.9.0...v0.9.1) (2023-09-15)


### Features

* allow specifying istio admin domain & certs ([#567](https://github.com/defenseunicorns/uds-package-dubbd/issues/567)) ([bc883fd](https://github.com/defenseunicorns/uds-package-dubbd/commit/bc883fd2c41f25144441b55cfd243d37acf0e4de))


### Miscellaneous

* **deps:** update aws-actions/configure-aws-credentials action to v4 ([#564](https://github.com/defenseunicorns/uds-package-dubbd/issues/564)) ([2af60f6](https://github.com/defenseunicorns/uds-package-dubbd/commit/2af60f6778afc5dac92ab319158be3f2eb921582))
* **deps:** update docker/login-action action to v3 ([#565](https://github.com/defenseunicorns/uds-package-dubbd/issues/565)) ([fc07a42](https://github.com/defenseunicorns/uds-package-dubbd/commit/fc07a42aad27dc15b9ac2f57bebf68cab366cc72))

## [0.9.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.8.1...v0.9.0) (2023-09-12)


### Features

* Add COMPLIANCE.md ([#557](https://github.com/defenseunicorns/uds-package-dubbd/issues/557)) ([aff9bab](https://github.com/defenseunicorns/uds-package-dubbd/commit/aff9babea1c7f2e1369bfab0fa1e636e2b4aced0))


### Bug Fixes

* revert Kiali fix now present in BB v2.10.0 ([#563](https://github.com/defenseunicorns/uds-package-dubbd/issues/563)) ([7d8a3e1](https://github.com/defenseunicorns/uds-package-dubbd/commit/7d8a3e160c45709f5f5cb58925190dfd0e6e0541))


### Miscellaneous

* **deps:** update dependency defenseunicorns/zarf to v0.29.2 ([#560](https://github.com/defenseunicorns/uds-package-dubbd/issues/560)) ([404d769](https://github.com/defenseunicorns/uds-package-dubbd/commit/404d76907604ec961c5e3c6fe491a842e1d300fa))
* **deps:** update gitlab tag big-bang/bigbang to v2.10.0 ([#559](https://github.com/defenseunicorns/uds-package-dubbd/issues/559)) ([03df8e5](https://github.com/defenseunicorns/uds-package-dubbd/commit/03df8e501f217af8cb8b835707c11a8014405453))
* **deps:** update helm chart external-dns to v1.13.1 ([#556](https://github.com/defenseunicorns/uds-package-dubbd/issues/556)) ([8ef35ab](https://github.com/defenseunicorns/uds-package-dubbd/commit/8ef35abe27f207a283f42ff39d641d26e2600c4d))

## [0.8.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.8.0...v0.8.1) (2023-09-07)


### Bug Fixes

* temp fix to secret used by kiali for grafana ([#554](https://github.com/defenseunicorns/uds-package-dubbd/issues/554)) ([45cc935](https://github.com/defenseunicorns/uds-package-dubbd/commit/45cc935923b0ace254b1bfd625119910147c1b3f))


### Miscellaneous

* **deps:** update actions/checkout action to v4 ([#545](https://github.com/defenseunicorns/uds-package-dubbd/issues/545)) ([bbd205a](https://github.com/defenseunicorns/uds-package-dubbd/commit/bbd205a435b848920b285eb5f9ebd1ffd40c084a))
* **deps:** update dependency defenseunicorns/zarf to v0.29.1 ([#539](https://github.com/defenseunicorns/uds-package-dubbd/issues/539)) ([10000d2](https://github.com/defenseunicorns/uds-package-dubbd/commit/10000d2cb77fbd0a7c05e1b6ef3c0f3e7e7eda0b))

## [0.8.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.7.0...v0.8.0) (2023-09-01)


### Features

* create separate dubbd-iac-aws pkg ([#531](https://github.com/defenseunicorns/uds-package-dubbd/issues/531)) ([3fc0bc0](https://github.com/defenseunicorns/uds-package-dubbd/commit/3fc0bc07795b91a4b660f893c625f5c2109c457f))


### Bug Fixes

* **deps:** update module github.com/aws/aws-sdk-go to v1.44.331 ([#524](https://github.com/defenseunicorns/uds-package-dubbd/issues/524)) ([5485372](https://github.com/defenseunicorns/uds-package-dubbd/commit/548537262eaf03d9e2d81387b283b7cb7d88d9ed))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.332 ([#535](https://github.com/defenseunicorns/uds-package-dubbd/issues/535)) ([f5f2d5c](https://github.com/defenseunicorns/uds-package-dubbd/commit/f5f2d5c10edb7b20931041c7bbdd26f0e6192983))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.333 ([#538](https://github.com/defenseunicorns/uds-package-dubbd/issues/538)) ([b7e9e5f](https://github.com/defenseunicorns/uds-package-dubbd/commit/b7e9e5f49467a3e451e4d3d5365d3126fedb98cd))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.334 ([#540](https://github.com/defenseunicorns/uds-package-dubbd/issues/540)) ([2e97274](https://github.com/defenseunicorns/uds-package-dubbd/commit/2e97274176f25be6b29996771af03d4d47c08399))
* **deps:** update module github.com/aws/aws-sdk-go to v1.45.0 ([#542](https://github.com/defenseunicorns/uds-package-dubbd/issues/542)) ([d9115e8](https://github.com/defenseunicorns/uds-package-dubbd/commit/d9115e82ba13a4c33849553156f80947e7711e49))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.13 ([#536](https://github.com/defenseunicorns/uds-package-dubbd/issues/536)) ([be2a30b](https://github.com/defenseunicorns/uds-package-dubbd/commit/be2a30b8cc5635fb02b1fd1ab99b337cadea037f))


### Miscellaneous

* **deps:** update aws-actions/configure-aws-credentials action to v3 ([#525](https://github.com/defenseunicorns/uds-package-dubbd/issues/525)) ([9257db2](https://github.com/defenseunicorns/uds-package-dubbd/commit/9257db2b19902a76290ea5ba7d2e90a24700e19b))
* **deps:** update gitlab tag big-bang/bigbang to v2.9.0 ([#495](https://github.com/defenseunicorns/uds-package-dubbd/issues/495)) ([cdc4066](https://github.com/defenseunicorns/uds-package-dubbd/commit/cdc40665ff46f11b0e5062e0f4b06fa7ac20dce9))

## [0.7.0](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.6.2...v0.7.0) (2023-08-23)


### Features

* add more preflight checks ([#517](https://github.com/defenseunicorns/uds-package-dubbd/issues/517)) ([2745eb4](https://github.com/defenseunicorns/uds-package-dubbd/commit/2745eb4d2b1b278a2f12afd23f7f4c53146e3e3f))
* additional dubbd helm values via zarf var ([#511](https://github.com/defenseunicorns/uds-package-dubbd/issues/511)) ([6beb477](https://github.com/defenseunicorns/uds-package-dubbd/commit/6beb47735a753120c2559783d07ecd0e4e674741))


### Bug Fixes

* **deps:** update module github.com/aws/aws-sdk-go to v1.44.325 ([#506](https://github.com/defenseunicorns/uds-package-dubbd/issues/506)) ([36d60b8](https://github.com/defenseunicorns/uds-package-dubbd/commit/36d60b8fc4517b9136bba19337012fdb57738de9))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.326 ([#509](https://github.com/defenseunicorns/uds-package-dubbd/issues/509)) ([eda11d1](https://github.com/defenseunicorns/uds-package-dubbd/commit/eda11d118b3aee688dbadb995c3cb6b2508f3ef4))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.327 ([#512](https://github.com/defenseunicorns/uds-package-dubbd/issues/512)) ([e6077d3](https://github.com/defenseunicorns/uds-package-dubbd/commit/e6077d36198249eac22238033273d4afec1aed6d))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.328 ([#515](https://github.com/defenseunicorns/uds-package-dubbd/issues/515)) ([f6831f3](https://github.com/defenseunicorns/uds-package-dubbd/commit/f6831f314c7974f65eaff8d10adc1eac2a338afd))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.329 ([#520](https://github.com/defenseunicorns/uds-package-dubbd/issues/520)) ([9159a42](https://github.com/defenseunicorns/uds-package-dubbd/commit/9159a42a42d69b94dd9f1907b427b56b7ab9ea2c))
* kiali operator memory bump to fix OOM kill ([#513](https://github.com/defenseunicorns/uds-package-dubbd/issues/513)) ([7fa28df](https://github.com/defenseunicorns/uds-package-dubbd/commit/7fa28df65b6cc536ddbd6ca23d090c51cd562ea4))
* Propagate region variable from Zarf to Terraform. ([#522](https://github.com/defenseunicorns/uds-package-dubbd/issues/522)) ([92d531d](https://github.com/defenseunicorns/uds-package-dubbd/commit/92d531d5a56b5388297ed3e1e03e088da825e71f))


### Miscellaneous

* **deps:** update gitlab tag big-bang/bigbang to v2.8.0 ([#521](https://github.com/defenseunicorns/uds-package-dubbd/issues/521)) ([1ee1b98](https://github.com/defenseunicorns/uds-package-dubbd/commit/1ee1b98f33b7caee924c7b764454dc5a8eaa39cb))
* **deps:** update terraform github.com/defenseunicorns/terraform-aws-uds-s3 to v0.0.6 ([#516](https://github.com/defenseunicorns/uds-package-dubbd/issues/516)) ([1b960a1](https://github.com/defenseunicorns/uds-package-dubbd/commit/1b960a194992e9c5c7a447f74084366b297ed132))
* remove dead variables from DUBBD ([#510](https://github.com/defenseunicorns/uds-package-dubbd/issues/510)) ([cc127d7](https://github.com/defenseunicorns/uds-package-dubbd/commit/cc127d7d389bfa9035b7ae593fc5889624b1d903))
* switch rke2 CI to uds-ami ([#508](https://github.com/defenseunicorns/uds-package-dubbd/issues/508)) ([6a48b77](https://github.com/defenseunicorns/uds-package-dubbd/commit/6a48b77cbbdceb246445dfbbeb5a25f44c02ec92))
* update versions for oscal ([#523](https://github.com/defenseunicorns/uds-package-dubbd/issues/523)) ([ebd254b](https://github.com/defenseunicorns/uds-package-dubbd/commit/ebd254baaf38bf5ea699865473d5834a1c17c7f7))

## [0.6.2](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.6.1...v0.6.2) (2023-08-16)


### Features

* add base on-prem package for rke2 ([#455](https://github.com/defenseunicorns/uds-package-dubbd/issues/455)) ([8f42f5b](https://github.com/defenseunicorns/uds-package-dubbd/commit/8f42f5b3e765ddcba4b72eaf01682b88f22013ee))
* increase kyverno requests/limits ([#499](https://github.com/defenseunicorns/uds-package-dubbd/issues/499)) ([bb70341](https://github.com/defenseunicorns/uds-package-dubbd/commit/bb7034148b37e8793c4a4bbf530d2ffce73ccae5))
* non default creds for admin interfaces ([#472](https://github.com/defenseunicorns/uds-package-dubbd/issues/472)) ([e22e87c](https://github.com/defenseunicorns/uds-package-dubbd/commit/e22e87c635ba6b5a976a4df2184780d29d49946c))


### Bug Fixes

* **deps:** update module github.com/aws/aws-sdk-go to v1.44.317 ([#477](https://github.com/defenseunicorns/uds-package-dubbd/issues/477)) ([c7958fe](https://github.com/defenseunicorns/uds-package-dubbd/commit/c7958fe1b38793361567bbc5dbcfaaf23a23f60c))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.318 ([#483](https://github.com/defenseunicorns/uds-package-dubbd/issues/483)) ([05fb99e](https://github.com/defenseunicorns/uds-package-dubbd/commit/05fb99ed35837713ee50b59226569a89d9126ab5))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.319 ([#489](https://github.com/defenseunicorns/uds-package-dubbd/issues/489)) ([6fb48cd](https://github.com/defenseunicorns/uds-package-dubbd/commit/6fb48cd01421065835da335d7e314fbc36c23440))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.320 ([#492](https://github.com/defenseunicorns/uds-package-dubbd/issues/492)) ([03c86cd](https://github.com/defenseunicorns/uds-package-dubbd/commit/03c86cd2bf09eeb230e813f0e7f759103b2d6d80))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.321 ([#494](https://github.com/defenseunicorns/uds-package-dubbd/issues/494)) ([adba6db](https://github.com/defenseunicorns/uds-package-dubbd/commit/adba6dbad64f2cf49f36ddbd671a6fb7e183b14d))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.324 ([#498](https://github.com/defenseunicorns/uds-package-dubbd/issues/498)) ([7b8afc9](https://github.com/defenseunicorns/uds-package-dubbd/commit/7b8afc9d6782a3f394ed1d6dc175d58a623cf061))
* **deps:** update module github.com/gruntwork-io/terratest to v0.43.12 ([#497](https://github.com/defenseunicorns/uds-package-dubbd/issues/497)) ([ad426ee](https://github.com/defenseunicorns/uds-package-dubbd/commit/ad426ee666d92bff0d281928eedc8ca7d9035593))


### Miscellaneous

* **deps:** update dependency defenseunicorns/zarf to v0.28.4 ([#474](https://github.com/defenseunicorns/uds-package-dubbd/issues/474)) ([53fdbd5](https://github.com/defenseunicorns/uds-package-dubbd/commit/53fdbd562d783d6f119b9a980df7669892522db8))
* **deps:** update dependency defenseunicorns/zarf to v0.29.0 ([#501](https://github.com/defenseunicorns/uds-package-dubbd/issues/501)) ([b923ca5](https://github.com/defenseunicorns/uds-package-dubbd/commit/b923ca5621612ae2059ba5083496b31a5f60dd0d))
* **deps:** update terraform github.com/rancherfederal/rke2-aws-tf to v2.4.0 ([#490](https://github.com/defenseunicorns/uds-package-dubbd/issues/490)) ([a9e2d9f](https://github.com/defenseunicorns/uds-package-dubbd/commit/a9e2d9f954f1b1d076a8104cc573da18d039f138))
* update bigbang.dev cert ([#503](https://github.com/defenseunicorns/uds-package-dubbd/issues/503)) ([e5b7754](https://github.com/defenseunicorns/uds-package-dubbd/commit/e5b7754c0f70095313637ce7ed458286a669edd7))

## [0.6.1](https://github.com/defenseunicorns/uds-package-dubbd/compare/v0.6.0...v0.6.1) (2023-08-04)


### Bug Fixes

* delete grafana onRemove ([#476](https://github.com/defenseunicorns/uds-package-dubbd/issues/476)) ([24d47fa](https://github.com/defenseunicorns/uds-package-dubbd/commit/24d47faf84a8e2e5300c658ebefdf4414dff1192))
* **deps:** update module github.com/aws/aws-sdk-go to v1.44.316 ([#470](https://github.com/defenseunicorns/uds-package-dubbd/issues/470)) ([6271438](https://github.com/defenseunicorns/uds-package-dubbd/commit/6271438e32eca94b124757026de721b65a1dbaf9))


### Miscellaneous

* **deps:** update actions/checkout action to v3 ([#475](https://github.com/defenseunicorns/uds-package-dubbd/issues/475)) ([c4a8433](https://github.com/defenseunicorns/uds-package-dubbd/commit/c4a843360fb9b1b84313ef0829a5009289a79dbb))

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
