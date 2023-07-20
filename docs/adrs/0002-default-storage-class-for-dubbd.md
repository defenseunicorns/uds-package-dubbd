# 2. Default Storage Class for DUBBD

Date: 2023-07-20

## Status

Accepted

## Context

One of the prerequisites when deploying Big Bang is the presence of a storage class. This is also a prerequisite for using DUBBD, but creating/configuring a storage class can be challenging and have pitfalls (especially related to configuration of a reclaim policy).

## Decision

To ease the configuration burden on end users DUBBD will provide a storage class that is used for all of its components. This storage class will be created and managed by DUBBD, with minimal configuration available to the end user (only an abstracted reclaim policy - set via `ephemeral` value). The DUBBD storage class *will not* be set as the cluster default unless the cluster itself is managed by the same zarf package (i.e. the case for UDS Core).

Each environment specific package (i.e. AWS, on-prem, etc) may have a different implementation of the storage class, but all will take a similar approach to setting up a production ready storage class. The storage class will only be created if the provider/CSI driver is pre-installed on the cluster. As an example, the AWS storage class will be an EBS based storage class, using gp3 volumes, and only created if the EBS CSI driver is already on the cluster.

Due to the immutable nature of the majority of the spec for PVCs and storage classes, DUBBD will not attempt to make any changes to the storage class or PVCs during an upgrade. This decision could be reviewed at a future date when cluster backup/restore capabilities are available.

## Consequences

Using a default storage class for all DUBBD deployments (in a specific environment) will ensure consistency across all users, reducing the complexities with supporting a variety of storage classes. However, by choosing not to deploy the "provider" (CSI Driver) for the storage class we are not guaranteeing 100% consistency depending on the user's cluster setup.

By not making changes on upgrades we are reducing the complexity needed in DUBBD but also, again, not ensuring complete consistency for existing users. This also means that users will be unable to modify the reclaim policy after an initial deployment. As mentioned above this could be reevaluated once cluster backup/restore capabilities are in place.
