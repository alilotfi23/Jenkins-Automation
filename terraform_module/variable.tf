variable "vsphere_user" {
  type        = string
  description = "vSphere user name"
}

variable "vsphere_password" {
  type        = string
  description = "vSphere password"
}

variable "vsphere_ip_address" {
  type        = string
  description = "vCenter server IP"
}

variable "vsphere_unverified_ssl" {
  type        = bool
  description = "(true/false)"
}

variable "vsphere_datacenter" {
  type        = string
  description = "vSphere datacenter"
}

variable "vsphere_cluster" {
  type        = string
  description = "vSphere cluster"
}

variable "datastore" {
  type        = string
  description = "vSphere datastore"
}

variable "vm_cpu" {
  type        = number
  description = "Number of vCPU for virtual machines"
}

variable "vm_ram" {
  type        = number
  description = "Amount of Memory for virtual machines"
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machines"
}
variable "guest_id" {
  type        = string
  description = "The ID of the guest"
}

variable "path" {
  type        = string
  description = "The path for the CD-ROM"
}

variable "vm_size" {
  type        = number
  description = "The disk size of the virtual machine"
}

variable "vm_network" {
  type        = string
  description = "Name of the VM network"
}

variable "cluster_name" {
  type        = string
  description = "Name of the vSphere cluster"
}
