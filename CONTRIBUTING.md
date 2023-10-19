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

### Draft PR

We recommend creating a draft PR on first commit to your working branch. Understandably there might not be much to show right away, but it allows for the team to better track and see WIP.

- **PR Name** - There are no strict rules regarding PR names. Preferrably they're short and descriptive and follow the conventional commit message specification. See https://www.conventionalcommits.org/en/v1.0.0/#specification.

- **Link PR to Issue** - Either in the name or in a comment, please link your PR to the issue. See https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue for supported keywords.

- **Commit Message** - Please follow the conventional commit message specification (link above) for at least your first commit, if not for all commits. Commits will be squashed on merge, which is why it's important at least the first commit follows the specification.

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

## CI and Helpful Hints
