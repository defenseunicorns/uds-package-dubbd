for package in kyverno kyverno-policies istio-operator istio monitoring loki metrics-server tempo promtail neuvector kiali kyverno-reporter; do
    zarf tools kubectl patch helmrelease -n bigbang $package --type=merge -p '{"metadata":{"annotations":{"reconcile.fluxcd.io/requestedAt":"'`date '+%F_%H:%M:%S.%s%z'`'"}}}' || true
done
