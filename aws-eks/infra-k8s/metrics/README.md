# Prometheus Metrics
Prometheus metrics kubernetes deployment configs

## Architecture Reference
<p align="center">
  <img src="prometheus-arch.png">
</p>

## Deployment Order
```yaml
kubectl apply -f kube-state-metrics/
kubectl apply -f node-exporter/
kubectl apply -f alert-manager/
kubectl apply -f prometheus/
```
