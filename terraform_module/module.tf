data "vsphere_datacenter" "datacenter" {
    name = var.vsphere_datacenter
}

data "vsphere_network" "network" {
  name          = var.vm_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datacenter" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "null_resource" "run_ansible" {
  triggers = {
    ansible_playbook_path = "Ansible/playbook.yml"
  }

  provisioner "local-exec" {
    command = "ansible-playbook ${path.module}/${triggers.ansible_playbook_path}"
  }
}


resource "vsphere_virtual_machine" "vm" {
  name                 = var.vm_name
  datastore_id         = data.vsphere_datastore.datacenter.id
  resource_pool_id     = data.vsphere_compute_cluster.cluster.resource_pool_id
  guest_id             = var.guest_id
  num_cpus             = var.vm_cpu
  memory               = var.vm_ram

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  cdrom {
    datastore_id = data.vsphere_datastore.datacenter.id
    path         = var.path
  }

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "${var.vm_name}.vmdk"
    size  = var.vm_size
  }

  depends_on = [null_resource.run_ansible]
  provisioner "local-exec" {
    command = "ansible-playbook playbook.yml"
  }

}
