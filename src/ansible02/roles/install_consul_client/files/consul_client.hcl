datacenter = "dc1"
data_dir = "/opt/consul"
log_level = "INFO"
server = false
bind_addr = "0.0.0.0"
retry_join = ["192.168.56.13"]
connect {
  enabled = true
}
