// example_datacenter looks up the datacenter where all resources will be
// placed.
data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.compute_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "hosts" {
  count         = length(var.esxi_hosts)
  name          = var.esxi_hosts[count.index]
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
