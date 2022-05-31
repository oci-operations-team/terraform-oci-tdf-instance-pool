# Copyright (c) 2020, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.



module "instance_pool_module" {

  source = "../../"

  providers = {

    oci = oci
  }

  instance_pool_config = var.instance_pool_config
}
