#!/bin/sh

cat <<EOL > /etc/prometheus/prometheus.yaml
global:
  scrape_interval: 15s 

scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']

  - job_name: 'node_exporter'
    static_configs:
      - targets: ['node_exporter:9100']
EOL
