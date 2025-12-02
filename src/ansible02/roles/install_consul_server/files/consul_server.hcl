datacenter = "dc1"
data_dir = "/opt/consul"
log_level = "INFO"
server = true
bootstrap_expect = 1
bind_addr = "192.168.56.13"
advertise_addr = "192.168.56.13"
client_addr = "0.0.0.0"
retry_join = ["192.168.56.13"]
ui_config {
  enabled = true
}
connect {
  enabled = true
}
