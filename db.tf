data "ibm_resource_group" "group" {
  name = "default"
}

resource "ibm_database" "database" {
  name              = "tfdb"
  plan              = "standard"
  location          = "us-south"
  resource_group_id = "${data.ibm_resource_group.resource_group.id}

  service = "databases-for-postgresql"
  version = 11

  service_endpoints            = "private"
  adminpassword                = "password"
  members_memory_allocation_mb = 3072
  members_disk_allocation_mb   = 61440

}

resource "ibm_resource_key" "resourceKey" {
  name                 = "tfkey"
  role                 = "Viewer"
  resource_instance_id = "${ibm_database.database.id}
  
  parameters {

     service-endpoints =  "private"
  
  }
}
