provider "google" {
  project     = "centering-force-290618"
  region      = "us-central1"
}


resource "google_compute_instance" "default" {
  name         = "myapp"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  tags = ["http", "https"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    env = "dev"
  }

  metadata_startup_script = "curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py --user && sudo python -m pip install ansible && sudo apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - && sudo add-apt-repository \"deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable\" && sudo apt install -y docker-ce && docker pull alshamari/myapp:latest && docker run alshamari/myapp:latest"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
