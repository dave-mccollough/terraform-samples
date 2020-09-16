provider "digitalocean" {
  token = "ADD_TOKEN_HERE"
}

resource "digitalocean_droplet" "davesdroplet" {
  image  = "ubuntu-18-04-x64"
  name   = "web-1"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
}