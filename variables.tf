# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "default_compartment_id" {
  type        = string
  description = "The default compartment OCID to use for resources (unless otherwise specified)."
}

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

            ad                      = string,
            fd = string,
            capacity_reservation_id = string,
            compartment_id          = string,
            dedicated_vm_host_id    = string,
            defined_tags            = map(string),
            freeform_tags           = map(string),
            display_name = string,
            extended_metadata = map(string)

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

            ##### instance_options
          })

        })
      }))
    })
  })
}


# Instance variables
variable "instance_configuration" {
  type = object(
    map(object({
      ad             = number,
      compartment_id = string,
      shape          = string,

      is_monitoring_disabled = bool,

      subnet_id           = string,
      assign_public_ip    = bool,
      vnic_defined_tags   = map(string),
      vnic_display_name   = string,
      vnic_freeform_tags  = map(string),
      nsg_ids             = list(string),
      private_ip          = string,
      skip_src_dest_check = bool,

      defined_tags          = map(string),
      extended_metadata     = map(string),
      fault_domain          = string,
      freeform_tags         = map(string),
      hostname_label        = string,
      ipxe_script           = string,
      pv_encr_trans_enabled = bool,

      ssh_authorized_keys    = list(string),
      ssh_private_keys       = list(string),
      bastion_ip             = string,
      user_data              = string,
      image_name             = string,
      mkp_image_name         = string,
      mkp_image_name_version = string,
      source_id              = string,
      source_type            = string,
      boot_vol_size_gbs      = number,
      kms_key_id             = string,

      preserve_boot_volume = bool,
      instance_timeout     = string,

      sec_vnics = map(object({
        #Required
        subnet_id = string,

        #Optional
        assign_public_ip    = bool,
        defined_tags        = map(string),
        vnic_display_name   = string,
        freeform_tags       = map(string),
        hostname_label      = string,
        nsg_ids             = list(string),
        private_ip          = string,
        skip_src_dest_check = bool,

        #Required
        instance_id = string,

        #Optional
        display_name = string,
        nic_index    = number
      })),

      mount_blk_vols = bool
      block_volumes = list(object({
        volume_id        = string,
        attachment_type  = string,
        volume_mount_dir = string
      })),
      cons_conn_create    = bool,
      cons_conn_def_tags  = map(string),
      cons_conn_free_tags = map(string),

  })))

  description = "Parameters for each instance pool"

  default = null

}