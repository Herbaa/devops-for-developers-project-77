resource "digitalocean_droplet" "web" {
  count    = 2
  name     = "web-server-${count.index + 1}"
  image    = "docker-20-04" # Образ с предустановленным Docker
  region   = var.region
  size     = "s-1vcpu-1gb"
  ssh_keys = [var.ssh_fingerprint]
  tags     = ["web"]
}

resource "digitalocean_database_cluster" "postgres" {
  name       = "db-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1
}
# Сертификат
resource "digitalocean_certificate" "cert" {
  name    = "devops-cert"
  type    = "lets_encrypt"
  domains = ["devops.herba.ink"]

  depends_on = [digitalocean_domain.default]
}

resource "digitalocean_loadbalancer" "www-lb" {
  name   = "www-lb"
  region = var.region

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "http"
    target_port     = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port       = 443
    entry_protocol   = "https"
    target_port      = 80
    target_protocol  = "http"
    certificate_name = digitalocean_certificate.cert.name
  }

  redirect_http_to_https = true

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}

resource "digitalocean_domain" "default" {
  name = "devops.herba.ink"
}

resource "digitalocean_record" "devops" {
  domain = digitalocean_domain.default.id
  type   = "A"
  name   = "devops"
  value  = digitalocean_loadbalancer.www-lb.ip
}

resource "datadog_monitor" "app_health" {
  name    = "Health check"
  type    = "service check"
  query   = "\"http.can_connect\".over(\"instance:app-check\").by(\"*\").last(2).count_by_status()"
  message = "error"

  monitor_thresholds {
    critical = 1
    warning  = 1
    ok       = 1
  }
}

resource "local_file" "ansible_vars" {
  content  = "web_server_ips: ${jsonencode(digitalocean_droplet.web.*.ipv4_address)}"
  filename = "../ansible/group_vars/all.yml"
}