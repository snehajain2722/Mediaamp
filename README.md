# DevOps Infra Simulation: Proxmox + Terraform + Jenkins + Prometheus

## 🧩 Components
- Proxmox VE for infrastructure provisioning
- Terraform for VM creation
- Flask App deployed on VM
- CI/CD pipeline using Jenkins
- Monitoring via Prometheus + Node Exporter

## ⚙️ Architecture

1. **Infrastructure Provisioning**
   - A VM is provisioned on **Proxmox VE** using **Terraform**.
   - Optional: Containers (LXC or Docker) can also be provisioned via Terraform or manually.

2. **Networking**
   - VM and Container are configured with **static IPs** on a **virtual bridge** (`vmbr0`).
   - They can **communicate with each other** and access the internet.

3. **Flask Application Deployment**
   - A simple Flask app is deployed inside the VM.
   - It exposes:
     - `/` → returns a greeting.
     - `/compute` → performs a CPU-intensive task.
   - The app is run using **Gunicorn**, reverse-proxied by **Nginx**.
   - A **SystemD service** keeps the app running on VM reboot.

4. **Automation with Crontab**
   - A **cron job** runs every minute to hit the `/compute` endpoint using `curl`.

5. **CI/CD with Jenkins**
   - Jenkins pipeline:
     - Clones the Flask repo.
     - Sets up Python environment.
     - Installs dependencies.
     - Restarts Flask app SystemD service.
     - Verifies deployment via test curl request.

6. **Monitoring with Prometheus**
   - Prometheus collects:
     - **System metrics** via Node Exporter (CPU, memory, disk).
     - **App metrics** via `prometheus_flask_exporter` (request count, latency).
   - Dashboard available at `http://<vm-ip>:9090`.


## 📁 Project Structure
- `flask_app/`: Contains Flask app & systemd config
- `terraform/`: Proxmox VM provisioning
- `jenkins/`: Jenkins pipeline config
- `monitoring/`: Prometheus setup
- `crontab/`: Scheduled curl job to `/compute`

## 📸 Screenshots
- Mediaamp\screenshots
