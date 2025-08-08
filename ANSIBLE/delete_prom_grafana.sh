
#!/bin/bash
sudo systemctl stop prometheus
sudo apt remove --purge prometheus -y
sudo rm -rf /etc/prometheus /var/lib/prometheus

sudo systemctl stop grafana-server
sudo apt remove --purge grafana -y
sudo rm -rf /etc/grafana /var/lib/grafana
