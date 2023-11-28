# How to Contribute

## Get Your Machine Ready

> **NOTE**
>
> Minimum compute requirements for single node deployment are at LEAST 48 GB RAM and 12 virtual CPU threads (preferrably in a VM)

[Prequisite Installs Needed](./docs//prereq-steps.md)

## How to build & deploy DUBBD versions

When working on DUBBD, follow [these steps](./docs/howto-packages.md) for getting registry authentication setup and building / deploying packages.

You can also checkout the [developer-notes.md](./docs//developer-notes.md) for more specifc help on working with certain packages.

## Contribution Flow

### Issues

Check github to see if your issue has already been addressed. If not, then please create an issue detailing, as much as possible, the desired feature or bug to be fixed.

### Branches

The DUBBD team practices trunk-based development with short-lived feature branches. These branches are deleted once they have been merged.

#### Naming

There are no specific branch naming conventions that we follow.

#### External

If you're not a Defense Unicorns DUBBD maintainer, **please fork the DUBBD repo first** and then create a feature branch from that.

### Pre-Commit (Optional)

We have included a [`.pre-commit-config.yaml`](.pre-commit-config.yaml) to make catching common errors easier. To use this feature in development (recommended), follow the [pre-commit](https://pre-commit.com/index.html#install) install guide.

### Draft PR

We recommend creating a draft PR on first commit to your working branch. Understandably there might not be much to show right away, but it allows for the team to better track and see WIP.

- **PR Name** - The PR name (title) should be in the format of a short conventional commit as all commits in a PR branch will be squashed and merged, which defaults the combined commit to the PR name. More details can be provided in the PR through the use of the extended description or comments. See https://www.conventionalcommits.org/en/v1.0.0/#specification for how to do conventional commits.

- **Link PR to Issue** -In the description of your PR, please link your PR to the issue. See https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue for supported keywords.

- **Commit Message** - Please follow the conventional commit message specification (link above) for at least your first commit, if not for all commits. Again, commits will be squashed on merge, which is why it's important at least the first commit follows the specification. This also has implications for how automated releases occur (see [Post Merge Releases](#post-merge-releases))

### Resolve Conflicts

Merge main into your branch and resolve any conflicts.

### Review

Once your PR is ready, you can request a review.

> **Note**
>
> Don't wait too long to get feedback on your work!
>
> If you think the PR is going to take a long time, consider
> how you can break it out into multiple smaller PRs so code is integrated faster.
>
> Remember trunk based development! :smiley:

### Post Merge Releases

Please read through [How to DUBBD Release](./docs/howto-dubbd-release.md) for detailed information on how your merged changes will get incorporated into official releases. Specifically note the `How should I write my commits?` and `How do I add or remove a package to be released?` sections.
