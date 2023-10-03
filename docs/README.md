# Docs

## DUBBD AWS

### Components

DUBBD AWS deploys all of the core components from DUBBD along with providing integration with several AWS specific components:

- EBS gp3 Storage Class for all DUBBD components (if EBS provider exists in cluster)
- S3 for Loki log storage
- S3 for Velero backups
- Configurable public/private elastic load balancers for ingress

### Diagram

![DUBBD AWS](./.images/dubbd-aws-architecture.drawio.png)
