## [Velero](https://velero.io)
Velero is a backup service installed by default with the UDS DUBBD-AWS package.   
As a part of the UDS install a default schedule to backup the Prometheus and Tempo `PersistentVolumes` and `PersistentVolumeClaims` is included.

The `backup` data and `restore` logs are persisted in an S3 bucket with the following naming convention, `<cluster name>-velero-<date>`.



### Key Resources to Consider

When a Velero CR is added to the cluster the appropriate controllers workflow is executed.  
> This detail implies that the manifest can be created/edited manually or with the `velero` cli


#### `backups.velero.io`
Use the `Backup`  API type to request the Velero server to perform a backup. Once created, the Velero Server immediately starts the backup process.   
* [`backups` API Definition](https://velero.io/docs/main/api-types/backup/)   
* [`backups` Reference](https://velero.io/docs/main/backup-reference/)
* [`backups` Workflow](https://velero.io/docs/v1.11/how-velero-works/#backup-workflow)

#### `schedules.velero.io`
The Schedule API type is used as a repeatable request for the Velero server to perform a backup for a given cron notation. Once created, the Velero Server will start the backup process. It will then wait for the next valid point of the given cron expression and execute the backup process on a repeating basis.  It can also be used as a template for on-demand backups.   
* [`schedules` API Definition](https://velero.io/docs/main/api-types/schedule/)   
* [`schedules` Reference](https://velero.io/docs/main/backup-reference/#schedule-a-backup)

#### `restore.velero.io`
The `restore` API type is used as a request for the Velero server to perform a Restore. Once created, the Velero Server immediately starts the Restore process.   
Velero's default restore policy is configured to be non-destructive during restore and never overwrite existing data in the cluster.
* [`restore` API Definition](https://velero.io/docs/main/api-types/restore/)
* [`restore` Reference](https://velero.io/docs/main/restore-reference/)
* [`restore` Workflow](https://velero.io/docs/main/restore-reference/#detailed-restore-workflow)

#### Resource Filtering
Resource Filtering can be applied to both `backups` and `restores`. This allows users to include and/or exclude resources from being backed up or when resources are being restored.   
> By default, Velero includes all objects in a backup or restore when no filtering options are used.

* [Include Filtering](https://velero.io/docs/v1.11/resource-filtering/#includes)
* [Exclude Filtering](https://velero.io/docs/v1.11/resource-filtering/#includes)
* [Resource Policy Filtering](https://velero.io/docs/v1.11/resource-filtering/#resource-policies)

### [Adding a New Backup](https://velero.io/docs/main/backup-reference/)

A backup can be created 
* Automatically on an interval from a `schedule` in the cluster
* On-demand from a `schedule` in the cluster
* On-demand as a stand alone request

The schedule can be found here
```
$ kubectl -n velero get schedule

NAME                      STATUS    SCHEDULE    LASTBACKUP   AGE   PAUSED
velero-velero-udsbackup   Enabled   0 3 * * *   20h          29h
```

An on-demand backup from the default schedule can be executed as
```
$ velero create backup --from-schedule=velero-velero-udsbackup

Backup request "velero-velero-udsbackup-20230727232605" submitted successfully.
Run `velero backup describe velero-velero-udsbackup-20230727232605` or `velero backup logs velero-velero-udsbackup-20230727232605` for more details.
```

An example of an on-demand backup with custom arguments 
```
$velero backup create adhocname --include-cluster-resources=true --include-namespaces=tempo,monitoring

Backup request "adhocname" submitted successfully.
Run `velero backup describe adhocname` or `velero backup logs adhocname` for more details.
```


### Restoring `persistentVolume`/`persistentVolumeClaim`
PVs will not terminate when bound by a PVC, and PVCs will not terminate while referenced by pods. 
This means there is an easy way and less easy way to restore volumes.

##### Note: You can simulate an environment to overlay with a restore by 
  * Suspend Flux `helmrelease` 
  * Delete the `deployment`/`statefulset`/`daemonset` workload
  * Delete `pvc`, `pv`
  * Verify all resources are removed
  * Resume your Flux `helmRelease`
  * Note new volume names 


#### The easy way
  * Suspend Flux `helmRelease` 
  * Delete the `deployment`/`statefulset`/`daemonset` workload
  * Delete `pvc`, `pv`
  * Verify all resources are removed
  * Perform Velero restore
  * Verify all resources are created and bound
  * Resume your Flux `helmRelease`

#### The hard way
  * Note the current `pv`/`pvc` volumeName(they should be the same) 
  * Perform Velero restore
    * The current `pv` will remain with the restored `pv` as a sibling 
    * Both the existing and restored `pv` have the correct `claimRef`, but the restored `pv` is missing the `pvc` uid and that `pvc` is going to change
  * Delete the `pvc`
  * Delete current `pv`
  * Edit the restored `pv` and remove the `claimRef`
  * Delete the `pods`
  * Cross fingers
  * Verify all resources are created and bound

### Do's 
* If possible work from a clean slate 
  * Suspend your `helmReleases`
  * Delete your workload

### Don't
* Don't delete the S3 bucket where your backups live
  * Velero data is stored in an S3 bucket named <cluster name>-velero-<date>0 with corresponding `restores` and `backups` folders
* Trust but verify
  * Test your backup/restore process before you need it


