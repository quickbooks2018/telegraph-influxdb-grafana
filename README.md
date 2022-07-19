# Server + Docker & Docker Host Monitoring

# Telegraf (Agent) ---> Influxdb-Grafana

# Steps

- Docker Installation

```docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

1. Install Packages with build-ami

2. Private Hosted Zone

3. Telegraf Setup with Script

4. Influxdb Grafana Setup with docker compose

5. Import Dashboards

- Telegrad Agent For Windows
- https://portal.influxdata.com/downloads/

```telegraf
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.23.2_windows_amd64.zip
https://dl.influxdata.com/telegraf/releases/telegraf-1.23.2_windows_amd64.zip
cd C:\Program Files\Telegraf
telegraf.exe -service install
net start telegraf
```
- docker influxdb
```influxdb
influx -database 'telegraf' -host 'localhost' -username 'admin'
show databases
```
