# Suspend the BigBang Helm Release so we don't have a reconcile while cleaning up
zarf tools kubectl patch helmrelease -n bigbang bigbang --type=merge -p '{"spec":{"suspend":true}}'
# Delete Istio to prevent ingress into cluster while cleanup is occuring
zarf tools kubectl delete helmrelease -n bigbang istio --ignore-not-found
# Delete Istio Operator once Istio is cleaned up
zarf tools kubectl delete helmrelease -n bigbang istio-operator --ignore-not-found
# Delete Monitoring
zarf tools kubectl delete helmrelease -n bigbang monitoring --ignore-not-found
zarf tools kubectl delete providers grafana -n monitoring --ignore-not-found
zarf tools kubectl delete alerts grafana -n monitoring --ignore-not-found
# Delete Promtail
zarf tools kubectl delete helmrelease -n bigbang promtail --ignore-not-found
# Delete Loki
zarf tools kubectl delete helmrelease -n bigbang loki --ignore-not-found
# Delete Kiali
zarf tools kubectl delete kiali -n kiali kiali --ignore-not-found
# Delete Tempo
zarf tools kubectl delete helmrelease -n bigbang tempo --ignore-not-found
# Delete NeuVector
zarf tools kubectl delete helmrelease -n bigbang neuvector  --ignore-not-found
# Cleanup NeuVector validatingwebhooks
zarf tools kubectl delete validatingwebhookconfigurations.admissionregistration.k8s.io neuvector-validating-crd-webhook  --ignore-not-found
# Delete kyverno-reporter
zarf tools kubectl delete helmrelease -n bigbang kyverno-reporter --ignore-not-found
# Delete kyverno-policies
zarf tools kubectl delete helmrelease -n bigbang kyverno-policies --ignore-not-found
# Delete kyverno
zarf tools kubectl delete helmrelease -n bigbang kyverno --ignore-not-found
# Cleanup validating webhoooks from kyverno
zarf tools kubectl delete validatingwebhookconfigurations.admissionregistration.k8s.io kyverno-policy-validating-webhook-cfg kyverno-resource-validating-webhook-cfg  --ignore-not-found
zarf tools kubectl delete helmrelease -n bigbang kiali --ignore-not-found
# Delete metrics server
zarf tools kubectl delete helmrelease -n bigbang metrics-server --ignore-not-found
# Delete metrics server api service if owned by Big Bang
zarf tools kubectl delete apiservices.apiregistration.k8s.io -l helm.toolkit.fluxcd.io/namespace=bigbang,helm.toolkit.fluxcd.io/name=metrics-server --ignore-not-found
zarf tools kubectl delete gitrepositories -n bigbang -l app.kubernetes.io/part-of=bigbang
