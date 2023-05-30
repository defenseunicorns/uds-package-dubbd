# Placeholder for rollback tasks
if [ "###ZARF_VAR_IS_UPGRADE###" = "true" ]; then
    echo "Failed upgrade"
else
    echo "Failed install"
fi

# This will grab any helmreleases with a failed condition
state=$(zarf tools kubectl get helmrelease -n bigbang -o go-template='{{range $items,$contents := .items}}{{printf "HR %s" $contents.metadata.name}}{{printf " status is %s\n" (index $contents.status.conditions 0).reason}}{{end}}')
failed=$(echo "${state}" | grep "Failed")
failed_hrs=$(echo "{$failed}" | awk  '{print $2}')
for hr in $failed_hrs; do
    zarf tools kubectl describe helmrelease -n bigbang $hr
done
