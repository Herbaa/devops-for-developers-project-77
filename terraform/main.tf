resource "digitalocean_droplet" "web" {
  count              = 2
  name               = "web-server-${count.index + 1}"
  image              = "docker-20-04" # Образ с предустановленным Docker
  region             = var.region
  size               = "s-1vcpu-1gb"
  ssh_keys           = [var.ssh_fingerprint]
  tags               = ["web"]
}

resource "digitalocean_database_cluster" "postgres" {
  name       = "db-cluster"
  engine     = "pg"
  version    = "15"
  size       = "db-s-1vcpu-1gb"
  region     = var.region
  node_count = 1
}

resource "digitalocean_loadbalancer" "www-lb" {
  name   = "www-lb"
  region = var.region

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"
    target_port     = 80
    target_protocol = "http"
  }

  forwarding_rule {
    entry_port      = 443
    entry_protocol  = "https"
    target_port      = 80
    target_protocol  = "http"
    # certificate_name = digitalocean_certificate.cert.name 
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = digitalocean_droplet.web.*.id
}