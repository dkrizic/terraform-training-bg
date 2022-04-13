resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

# helm repo add ingress-nginx https://...
# helm -n ingress-nginx upgrade --install ingress-nginx ingress-nginx/ingress-nginx --version 4.0.19 -f helm/ingress-nginx.yaml helm/dev/ingress-nginx.yaml
resource "helm_release" "ingress-nginx" {
  chart = "ingress-nginx"
  repository = local.helm.repository.ingress-nginx
  version = "4.0.19"
  name = "ingress-nginx"
  create_namespace = false
  namespace = kubernetes_namespace.ingress-nginx.id
  wait = true

  values = [
    file("helm/ingress-nginx.yaml"),
    file("helm/${var.stage}/ingress-nginx.yaml")
  ]
}
