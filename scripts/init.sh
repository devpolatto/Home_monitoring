cat <<EOF > /etc/prometheus/prometheus.yaml
global:
  scrape_interval:     15s # By default, scrape targets every 15 seconds.

  # Attach these labels to any time series or alerts when communicating with
  # external systems (federation, remote storage, Alertmanager).
  # external_labels:
  #  monitor: 'codelab-monitor'

# A scrape configuration containing exactly one endpoint to scrape:
# Here it's Prometheus itself.
scrape_configs:
  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: 'prometheus'
    # Override the global default and scrape targets from this job every 5 seconds.
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']

  # Example job for node_exporter
  # - job_name: 'node_exporter'
  #   static_configs:
  #     - targets: ['node_exporter:9100']

  # Example job for cadvisor
  # - job_name: 'cadvisor'
  #   static_configs:
  #     - targets: ['cadvisor:8080']
EOF

/bin/prometheus --config.file=/etc/prometheus/prometheus.yaml