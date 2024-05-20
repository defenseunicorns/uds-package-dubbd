# DUBBD Release

This document provides guidance on how to create DUBBD releases, address release issues, and other helpful tips.

## Creating releases

This project uses [release-please-action](https://github.com/googleapis/release-please-action) for versioning and releasing OCI packages.

### How should I write my commits?

Release Please assumes you are using [Conventional Commit messages](https://www.conventionalcommits.org/).

The most important prefixes you should have in mind are:

- `fix:` which represents bug fixes, and correlates to a [SemVer](https://semver.org/)
  patch.
- `feat:` which represents a new feature, and correlates to a SemVer minor.
- `feat!:`,  or `fix!:`, `refactor!:`, etc., which represent a breaking change
  (indicated by the `!`) and will result in a SemVer major.

When changes are merged to the `main` branch, the Release Please will evaluate all commits since the previous release to calculate what changes are included and will create another PR to increase the version and tag a new release (per the Release Please design [documentation](https://github.com/googleapis/release-please/blob/main/docs/design.md#lifecycle-of-a-release)). This will also automatically generate a new set of packages in the OCI registry.

> TIP: Merging a PR should be done via a branch **"Squash and merge"**; this means that the commit message seen on this PR merge is what Release Please will use to determine a version bump.

### How do I add or remove a package to be released?

For zarf packages Release Please should be configured to update the `metadata.version` field in zarf.yaml to the same version number that is used for the release tag. To make this work, the `version` field for any package must be surrounded by Release Please's annotations, like this:

```yaml
  # x-release-please-start-version
  version: "0.2.1"
  # x-release-please-end
```

Any package that contains the Release Please annotations must also be included in the `extra-files` section of the [release-please-config.json](release-please-config.json) file to be included in the Release Please generated release PR (along with updating the CI workflow that publishes the OCI artifact).

More information on this can be found in [Release Please's documentation](https://github.com/googleapis/release-please/blob/main/docs/customizing.md#updating-arbitrary-files).

### How can I influence the version number for a release?

There are some cases when the proposed Release Please calculated version is not desired and must be overridden. This must be done on some merge to `main` **prior** to merging the Release Please automatically generated PR. Upon doing so, Release Please will rerun and update the PR with the provided version.

Here are two ways to override the Release Please calculated version and specify your own:

- Empty commit on PR branch method
  - Prior to merging some PR into to `main`, make an empty commit to this PR branch with the desired version
  - Then click "Squash and merge" and "Confirm squash and merge" for the PR
  - Wait for the Release Please pipeline to re-run and update the release PR
  - EXAMPLE BELOW: Empty commit to set the version to `0.11.0`

```console
git commit --allow-empty -m "chore: release 0.11.0" -m "Release-As: 0.11.0"
```

- Extended commit message on PR merge method
  - When merging in some PR to `main`, click the "Squash and merge" button
  - Prior to clicking "Confirm squash and merge", enter the desired version in the extended commit message
  - EXAMPLE BELOW: Extended commit message to set the version to `0.11.0`

```sh
Release-As: 0.11.0
```

More information on this can be found in [Release Please's documentation](https://github.com/googleapis/release-please/tree/main#how-do-i-change-the-version-number).

### How to create a release when there is a new version of Big Bang?

Below is the set of steps typically followed for updating DUBBD to use a new release of Big Bang.

- [ ] [Renovate](https://github.com/renovatebot/renovate#renovate) should detect the new Big Bang version and create a corresponding PR
- [ ] All CI workflows must pass and validate functionality works
  - If any CI workflow fails, after confirming there are no CI-specific issues (like cloud infrastructure problems), branch off of the `main` branch
    - Incorporate the same changes Renovate proposed in the Big Bang upgrade PR
    - Make any additional changes necessary to the branch to get tests passing
    - Create a new PR using the same name (example: `chore(deps) update gitlab tag big-bang/bigbang to v2.10.0`) and top-portion of the PR description (specifically the section that contains the table with the "Package" and changes)
    - If all workflows pass, squash and merge the PR while bumping the minor version using the **extended commit message** method [here](#how-can-i-influence-the-version-number-for-a-release)
  - If all workflows pass, use the Renovate PR as is, squash and merge the PR while bumping the minor version using the **extended commit message** method [here](#how-can-i-influence-the-version-number-for-a-release)
- [ ] In a follow up PR (new branch), update any [OSCAL references](.github/workflows/oscal) in the components sections of the OSCAL templates
  - These should match the [Big Bang references](https://repo1.dso.mil/big-bang/bigbang/-/releases) in the new release
  - After updating and pushing these changes to the branch, the OSCAL CI job will likely generate updated OSCAL files from these templates and commit to the branch
  - Squash and merge this PR
- [ ] Follow the Release Please workflow to create a release
  - Ensure the CHANGELOG looks correct - should match what is in the Release Please PR description, which is used for the GitHub Release Notes
  - Ensure that all version numbers look correct - all desired files have been changed to the proper new versions
  - Squash and Merge the PR
  - CI workflows should then build and publish the OCI packages

### How do I fix a release issue?

There are some different ways that something could go wrong with a release, below are some example scenarios and how to fix them.

#### CHANGELOG file or release notes doesn't have the correct information

If a CHANGELOG section (and the associated Release Notes) for a specific release needs to be modified in any way after a release, it must be updated through methods available in Release Please.

- The CHANGELOG file is influenced by the configuration in the [release-please-config.json](release-please-config.json) file, and if a desired section is missing, confirm that it is properly included in the configuration
- If the [release-please-config.json](release-please-config.json) file, looks correct and there is a typo or some undesired content
  - Update the already merged PR's extended commit message with an [override](https://github.com/googleapis/release-please/tree/main#how-can-i-fix-release-notes), which will replace the CHANGELOG for that release, after the CI run of Release Please
  - Manually modify the GitHub release to match the newly updated CHANGELOG section for the release

#### A release is "broken" and should not be used

Rather than removing a release that is deemed to be broken in some fashion, it should be noted as a broken release in the release notes as soon as possible, and a new release created that fixes the issue(s).

The CHANGELOG is not required to be updated, only the release notes must be updated either manually or with CI automation.

- Manual approach: Find the impacted release, edit the release notes, and put this warning at the top:

```md
>[!WARNING]
>PLEASE USE A NEWER VERSION (there are known issues with this release)
```

- CI automated approach: In the GitHub UI under `Actions` >  `Update Release Info from Tag` > `Run workflow` dropdown
  - Provide the `GitHub tag name`
  - Check the box for the field `Select this option if there is an issue with the release` (this adds a warning message header on the release)
  - Optionally add some content in field for the bottom of the release with more details like so: `---\n### Known Issues\n\n*provide-details-here*`
  - Click `Run workflow` button

#### Other issues and helpful tips

- Confirm that the Release Please configuration is valid by checking the [schema](https://github.com/googleapis/release-please/blob/main/schemas/config.json) and/or using the CLI

```sh
release-please debug-config --dry-run --trace --repo-url https://github.com/defenseunicorns/uds-package-dubbd
```

- The GitHub CI Release Please workflow should be configured to be [manifest driven](https://github.com/googleapis/release-please/blob/main/docs/manifest-releaser.md) and **all** configuration defined in the [release-please-config.json](release-please-config.json) file (none should be provided in the CI yaml)

- Check [Github Issues for Release Please](https://github.com/googleapis/release-please/issues)
