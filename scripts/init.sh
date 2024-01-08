#!/bin/sh

echo "
global:
  scrape_interval:     15s # By default, scrape targets every 15 seconds.
scrape_configs:
  - job_name: 'prometheus'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']

  Example job for node_exporter
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['node_exporter:9100']
" > /etc/prometheus/prometheus.yaml

/bin/prometheus --config.file=/etc/prometheus/prometheus.yaml