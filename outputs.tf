# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

output "instance_pool" {
  description = "The instance pool and instance configuration details"
  value = {
    instance_configuration = oci_core_instance_configuration.instance_configuration[0]
    instance_pool          = oci_core_instance_pool.instance_pool[0],
    auto_scaling           = oci_autoscaling_auto_scaling_configuration.auto_scaling_configuration[0]
  }
}

