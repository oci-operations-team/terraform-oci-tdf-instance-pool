# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.



variable "instance_pool_config" {
  type = object({
    default_compartment_id = string,
    default_defined_tags   = map(string),
    default_freeform_tags  = map(string),

    instance_pool = object({
      compartment_id = string,

      size          = number,
      defined_tags  = map(string),
      freeform_tags = map(string),
      display_name  = map(string),

      placements_configurations = map(object({
        ad                = string,
        fd                = string,
        primary_subnet_id = string,
        secondary_vnic_subnets = map(object({
          subnet_id    = string,
          display_name = string,
        }))
      }))

      load_balancers = map(object({
        load_balancer_id = string,
        backend_set_name = string,
        port             = string,
        vnic_selection   = string
      }))

      instance_configuration = map(object({
        compartment_id = string,
        defined_tags   = map(string),
        freeform_tags  = map(string),
        display_name   = map(string),
        instance_id    = string,
        source         = string,
        instance_id    = string,
        source         = string,

        instance_details = object({
          instance_type = string,


          block_volumes = map(object({
            attach_details = object({
              type                                = string,
              device                              = string,
              display_name                        = string,
              is_pv_encryption_in_transit_enabled = bool,
              is_read_only                        = bool,
              is_shareable                        = bool,
              use_chap                            = bool

            })

            create_details = object({
              ad               = string,
              backup_policy_id = string,
              compartment_id   = string,
              defined_tags     = map(string),
              freeform_tags    = map(string),
              display_name     = map(string),
              kms_key_id       = string,
              size_in_gbs      = number,
              vpus_per_gb      = number,
              source_details = map(object({
                type = string,
                id   = string
              }))
            })

            volume_id = string,
          }))

          launch_details = object({

            ad                                  = string,
            fd                                  = string,
            capacity_reservation_id             = string,
            compartment_id                      = string,
            dedicated_vm_host_id                = string,
            defined_tags                        = map(string),
            freeform_tags                       = map(string),
            display_name                        = string,
            extended_metadata                   = map(string)
            ipxe_script                         = string,
            is_pv_encryption_in_transit_enabled = bool,
            launch_mode                         = string,
            metadata                            = map(string),
            preferred_maintenance_action        = string,
            shape                               = string,



            agent_config = object({
              are_all_plugins_disabled = bool,
              is_management_disabled   = bool,
              is_monitoring_disabled   = bool,
              plugins_config = object({
                desired_state = string,
                name          = string,
              })
            })

            availability_config = object({
              recovery_action = string,

            })

            create_vnic_details = object({
              assign_private_dns_record = bool,
              assign_public_ip          = bool,
              defined_tags              = map(string),
              freeform_tags             = map(string),
              display_name              = string,
              hostname_label            = string,
              nsg_ids                   = list(string),
              private_ip                = string,
              skip_source_dest_check    = bool,
              subnet_id                 = string,
            })

            instance_options = object({
              are_legacy_imds_endpoints_disabled = bool
            })

            launch_options = object({
              boot_volume_type                    = string,
              firmware                            = string,
              is_consistent_volume_naming_enabled = bool,
              is_pv_encryption_in_transit_enabled = bool,
              network_type                        = string,
              remote_data_volume_type             = string
            })

            platform_config = object({
              type                               = string,
              is_measured_boot_enabled           = bool,
              is_secure_boot_enabled             = bool,
              is_trusted_platform_module_enabled = bool,
              numa_nodes_per_socket              = number
            })

            preemptible_instance_config = object({
              preemption_action = object({
                type                 = string
                preserve_boot_volume = bool
              })
            })

            shape_config = object({
              baseline_ocpu_utilization = string,
              memory_in_gbs             = number,
              nvmes                     = number,
              ocpus                     = number
            })

            source_details = object({
              source_type             = string,
              boot_volume_id          = string,
              boot_volume_size_in_gbs = number,
              image_id                = number
            })

            ##### instance_options
          })

          secondary_vnics = object({
            display_name = string,
            nic_index    = number,

            create_vnic_details = object({
              assign_private_dns_record = bool,
              assign_public_ip          = bool,
              defined_tags              = map(string),
              freeform_tags             = map(string),
              display_name              = map(string),
              hostname_label            = string,
              nsg_ids                   = list(string),
              private_ip                = string,
              skip_source_dest_check    = bool,
              subnet_id                 = string
            })
          })

        })
      }))
    })
  })
}