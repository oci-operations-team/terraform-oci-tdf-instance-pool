# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


instance_pool_config = {
  default_compartment_id = "ocid1.compartment.oc1..aaaaaaaawwhpzd5kxd7dcd56kiuuxeaa46icb44cnu7osq3mbclo2pnv3dpq"
  default_defined_tags   = {}
  default_freeform_tags  = null

  instance_pool = {
    compartment_id = null
    size           = 1
    defined_tags   = {}
    freeform_tags  = null
    display_name   = "cotud_inst_pool"

    # required
    placements_configurations = {
      # required
      ad = "NoEK:EU-FRANKFURT-1-AD-1"
      # optional
      fd = null
      # required
      primary_subnet_id = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaaxrvqkn3sd4bxzlhpyn2aaw7puroolcwodh3t5wpyb5sowt27baaq"
      #optional
      secondary_vnic_subnets = {}
    }

    # optional
    load_balancers = {}



    instance_configuration = {
      # required
      compartment_id = null

      #optional 
      defined_tags  = {}
      freeform_tags = null
      display_name  = "cotud_inst_config"

      # optional - Default = NONE; Values = ["NONE, INSTANCE"]
      source = "NONE"
      # Required when source=INSTANCE
      instance_id = null
      # required 
      instance_details = {

        # required - The type of instance details. Supported instanceType is compute
        instance_type = "compute"

        # optional
        block_volumes = {}

        # optional
        launch_details = {
          # optional
          ad = "NoEK:EU-FRANKFURT-1-AD-1"
          # optional
          fd = null
          # optional
          capacity_reservation_id = null
          # optional
          compartment_id = null
          # optional
          dedicated_vm_host_id = null
          # optional
          defined_tags = {}
          # optional
          freeform_tags = null
          # optional
          display_name = "cotud_launch_details"
          # optional
          extended_metadata = null
          # optional
          ipxe_script = null
          # optional
          is_pv_encryption_in_transit_enabled = false
          # optional value in [NATIVE, EMULATED, PARAVIRTUALIZED, CUSTOM]
          launch_mode = "NATIVE"
          # optional
          ssh_public_key_path = "/Users/cotudor/my_ssh_keys/cos_key.pub"
          # optional - value in [LIVE_MIGRATE, REBOOT] - default = LIVE_MIGRATE
          preferred_maintenance_action = "LIVE_MIGRATE"
          # optional
          shape = "VM.Standard2.1"
          # optional
          agent_config = null
          # optional
          availability_config = null

          create_vnic_details = {
            # optional
            assign_private_dns_record = false
            # optional
            assign_public_ip = true
            # optional
            defined_tags = {}
            # optional
            freeform_tags = null
            # optional
            display_name = "cotud_instpool_vnic1"
            # optional
            hostname_label = "cotudinstpoll",
            # optional 
            nsg_ids = null
            # optional
            private_ip = null
            # optional
            skip_source_dest_check = true
            # optional
            subnet_id = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaaxrvqkn3sd4bxzlhpyn2aaw7puroolcwodh3t5wpyb5sowt27baaq"
          }

          # optional
          instance_options = null

          # optional
          launch_options = null
          # optional
          platform_config = null

          # optional
          preemptible_instance_config = null

          # optional
          shape_config = null

          # optionals
          source_details = {

            # required - value in [bootvolume, image]
            source_type = "image"
            # optional - Applicable when source_type=bootVolume
            boot_volume_id = null
            # optional - Applicable when source_type=image
            boot_volume_size_in_gbs = 50
            # optional -  Applicable when source_type=image
            image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaawq2h5g4nb6odpdt3rwyvp7bx26fv5pyjpbwzlwnybztss34vuz2q"
          }


        }

        # optional
        secondary_vnics = {}
      }

    }

    auto_scaling_configuration = null

    # optional
    auto_scaling_configuration = {
      auto_scaling_resources = {
        # resource type
        type = "instancePool"
      }
      # required
      compartment_id = null

      #Optional
      cool_down_in_seconds = 300
      defined_tags         = null
      display_name         = "cotud_auto_scaling"
      freeform_tags        = null
      is_enabled           = true

      # required
      policies = {
        # Required value in [scheduled, threshold]
        policy_type = "threshold"
        # optional 
        capacity = {
          #Optional
          initial = 1
          max     = 5
          min     = 1
        }
        # optional 
        display_name = "cotud_auto_scaling_policy"
        # required when policy_type=scheduled
        execution_schedule = null
        # optional
        is_enabled = true
        # required when policy_type=scheduled
        resource_action = null
        # required when policy_type = scheduled
        rules = {
          cotud_rule_1_scale_out = {

            # required when policy_type = scheduled
            action = {

              # required when policy_type = scheduled
              type = "CHANGE_COUNT_BY"
              # required when policy_type = scheduled
              value = 1
            }

            # Required when policy_type=threshold
            display_name = "cotud_rule_1_scale_out"

            # Required when policy_type=threshold
            metric = {

              # Required when policy_type=threshold
              metric_type = "CPU_UTILIZATION"
              # Required when policy_type=threshold
              threshold = {

                # Required when policy_type=threshold
                operator = "GT"
                # Required when policy_type=threshold
                value = "70"
              }
            }
          }

          cotud_rule_1_scale_in = {
            # required when policy_type = scheduled
            action = {

              # required when policy_type = scheduled
              type = "CHANGE_COUNT_BY"
              # required when policy_type = scheduled
              value = -1
            }

            # Required when policy_type=threshold
            display_name = "cotud_rule_1_scale_out"

            # Required when policy_type=threshold
            metric = {

              # Required when policy_type=threshold
              metric_type = "CPU_UTILIZATION"
              # Required when policy_type=threshold
              threshold = {

                # Required when policy_type=threshold
                operator = "LT"
                # Required when policy_type=threshold
                value = "50"
              }
            }
          }
        }
      }
    }
  }
}




