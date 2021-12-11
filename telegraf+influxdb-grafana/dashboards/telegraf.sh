#!/bin/bash
# https://hub.docker.com/_/telegraf

HOST_IP="Docker-Django-QA"

# Telegraf Setup
cat << EOF > telegraf.conf
 [global_tags]
[agent]
  interval = "60s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  precision = ""
  hostname = "$HOST_IP"
  omit_hostname = false
[[outputs.influxdb]]
  urls = ["http://monitoring.docker.local:8086"]
  database = "influx"
  timeout = "5s"
  username = "telegraf"
  password = "metricsmetricsmetricsmetrics"
[[inputs.cpu]]
  percpu = true
  totalcpu = true
  collect_cpu_time = false
  report_active = false
[[inputs.disk]]
  ignore_fs = ["tmpfs", "devtmpfs", "devfs", "iso9660", "overlay", "aufs", "squashfs"]
[[inputs.docker]]  
 endpoint = "unix:///var/run/docker.sock"
container_name_include = []
container_name_exclude = []
[[inputs.diskio]]
[[inputs.kernel]]
[[inputs.mem]]
[[inputs.processes]]
[[inputs.swap]]
[[inputs.system]]
EOF


chmod 666 /var/run/docker.sock

docker run --name telegraf -v /var/run/docker.sock:/var/run/docker.sock -v $PWD/telegraf.conf:/etc/telegraf/telegraf.conf:ro --restart unless-stopped -id telegraf:latest


# End
