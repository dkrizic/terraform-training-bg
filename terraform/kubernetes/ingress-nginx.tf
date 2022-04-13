resource "kubernetes_namespace" "ingress-nginx" {
  metadata {
    name = "ingress-nginx"
  }
}

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
