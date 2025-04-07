provider "proxmox" {
  pm_api_url = "https://<your-proxmox-ip>:8006/api2/json"
  pm_user    = "root@pam"
  pm_password = "your-password"
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ubuntu_vm" {
  name = "ubuntu-vm"
  target_node = "proxmox"
  iso = "local:iso/ubuntu-22.04.iso"
  cores = 2
  memory = 2048
  disk {
    size = "20G"
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
}
