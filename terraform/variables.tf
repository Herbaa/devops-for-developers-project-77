variable "do_token" {
  description = "Digitalocean api token"
  sensitive   = true
}

variable "ssh_fingerprint" {
  description = "SSH Key fingerprint"
}

variable "region" {
  default = "fra1" 
}