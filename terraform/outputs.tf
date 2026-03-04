output "web_server_ips" {
  value = digitalocean_droplet.web.*.ipv4_address
}

output "lb_ip" {
  value = digitalocean_loadbalancer.www-lb.ip
}

output "db_uri" {
  value     = digitalocean_database_cluster.postgres.uri
  sensitive = true
}