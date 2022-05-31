# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.


instance_pool_config = {
  default_compartment_id = "ocid1.compartment.oc1..aaaaaaaawwhpzd5kxd7dcd56kiuuxeaa46icb44cnu7osq3mbclo2pnv3dpq"
  default_defined_tags   = {}
  default_freeform_tags  = null

  instance_pool = {
    compartment_id = null
    size           = 2
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
          metadata = null
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
            assign_public_ip = false
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
          launch_options = {
            # optional - value in [ISCSI, SCSI, IDE, VFIO, PARAVIRTUALIZED]
            boot_volume_type = "ISCSI"
            #optional - value in [BIOS, UEFI_64]
            firmware = null
            # optional - default = false
            is_consistent_volume_naming_enabled = false,
            # optional - deprecated
            is_pv_encryption_in_transit_enabled = false,
            # optional - value in [E100, VIFO, PARAVIRTUALIZED]
            network_type = null
            # optional - value in [ISCSI, SCSI, IDE, VFIO, PARAVIRTUALIZED]
            remote_data_volume_type = "PARAVIRTUALIZED"
          }
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

  }

}