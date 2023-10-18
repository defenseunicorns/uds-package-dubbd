# How to Contribute

## Get Your Machine Ready

> **Warning**
> machine requirements ...knowledge needed

[Prequisite Installs Needed](./docs//prereq-steps.md)

## How to build & deploy DUBBD versions

When working on DUBBD, follow [these steps](./docs/building-package.md) for getting registry authentication setup and building / deploying packages.

You can also checkout the [developer-notes.md](./docs//developer-notes.md) for more specifc help on working with certain packages.

## Contribution Flow

### Issues

Check github to see if your issue has already been addressed. If not, then please create an issue detailing, as much as possible, the desired feature or bug to be fixed.

### Branches

The DUBBD team practices trunk-based development with short-lived feature branches. These branches are deleted once they have been merged.

### Draft PR

We recommend creating a draft PR on first commit to your working branch. Understandably there might not be much to show right away, but it allows for the team to better track and see WIP.

- **PR Name** - There are no strict rules regarding PR names. Preferrably they're short and descriptive, but it's ok if they need to be longer in order to be descriptive.

- **Link PR to Issue** - Either in the name or in a comment, please link your PR to the issue. Checkout https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue.

- **Commit Message** - Please follow the conventional commit pattern for at least your first commit, if not for all commits. Commits will be squashed on merge, which is why it's important at least the first commit follows the specification. Checkout https://www.conventionalcommits.org/en/v1.0.0/#specification

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
