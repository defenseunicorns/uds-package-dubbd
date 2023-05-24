# Debug output since Zarf prints state after our rollback/deletion
zarf tools kubectl get nodes -o wide
zarf tools kubectl get hr -n bigbang
zarf tools kubectl get gitrepo -n bigbang
zarf tools kubectl get pods -A

if [ "###ZARF_VAR_IS_UPGRADE###" = "true" ]; then
    # Placeholder for rollback tasks
    echo "Failed upgrade"
else
    # Run standard teardown to delete Big Bang packages
    teardown.sh
    # Delete the BB helmrelease
    zarf tools kubectl delete helmrelease -n bigbang bigbang --ignore-not-found
    # TODO: Handle Flux?
fi
