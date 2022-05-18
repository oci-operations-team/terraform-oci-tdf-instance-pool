# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_core_instance_configuration" "instance_configuration" {

  count = (var.instance_pool_config.instance_pool != null && var.instance_pool_config.instance_pool != {}) ? 1 : 0

  #Required
  compartment_id = var.instance_pool_config.instance_pool.instance_configuration.compartment_id != null ? var.instance_pool_config.instance_pool.instance_configuration.compartment_id : var.instance_pool_config.default_compartment_id

  #Optional
  defined_tags  = var.instance_pool_config.instance_pool.instance_configuration.defined_tags != null ? var.instance_pool_config.instance_pool.instance_configuration.defined_tags : var.instance_pool_config.default_defined_tags
  display_name  = var.instance_pool_config.instance_pool.instance_configuration.display_name
  freeform_tags = var.instance_pool_config.instance_pool.instance_configuration.freeform_tags != null ? var.instance_pool_config.instance_pool.instance_configuration.freeform_tags : var.instance_pool_config.default_freeform_tags

  # optional - Default = NONE; Values = ["NONE, INSTANCE"]
  source = var.instance_pool_config.instance_pool.instance_configuration.source

  # Required when source=INSTANCE
  instance_id = var.instance_pool_config.instance_pool.instance_configuration.instance_id

  #required
  instance_details {
    # required - The type of instance details. Supported instanceType is compute
    instance_type = var.instance_pool_config.instance_pool.instance_configuration.instance_details.instance_type

    # Optional
    dynamic "block_volumes" {
      for_each = var.instance_pool_config.instance_pool.instance_configuration.instance_details.block_volumes
      content {
        # optional
        attach_details {
          # required; values = [iscsi, paravirtualized]
          type = block_volumes.attach_details.type
          # required - applicable when type = isci - default = false
          use_chap = block_volumes.attach_details.use_chap

          #optional 
          device                              = block_volumes.attach_details.device
          display_name                        = block_volumes.attach_details.display_name
          is_pv_encryption_in_transit_enabled = block_volumes.attach_details.is_pv_encryption_in_transit_enabled
          is_read_only                        = block_volumes.attach_details.is_read_only
          is_shareable                        = block_volumes.attach_details.is_shareable
        }

        # optional - creates a new block volume
        create_details {
          #Optional
          availability_domain = block_volumes.create_details.ad
          backup_policy_id    = block_volumes.create_details.backup_policy_id
          # optional - The OCID of the compartment that contains the volume.
          compartment_id = block_volumes.create_details.compartment_id != null ? block_volumes.create_details.compartment_id : var.instance_pool_config.default_compartment_id
          defined_tags   = block_volumes.create_details.defined_tags != null ? block_volumes.create_details.defined_tags : var.instance_pool_config.default_defined_tags
          display_name   = block_volumes.create_details.display_name
          freeform_tags  = block_volumes.create_details.freeform_tags != null ? block_volumes.create_details.freeform_tags : var.instance_pool_config.default_freeform_tags
          kms_key_id     = block_volumes.create_details.id
          size_in_gbs    = block_volumes.create_details.size_in_gbs
          volume_id      = block_volumes.create_details.volume_id
          # optional - value in [0(lower cost), 10(balanced option), 20(high performance), 30(ultra high performance)]
          vpus_per_gb = block_volumes.create_details.vpus_per_gb

          # optional
          source_details {
            # Required - value in [volume, volumeBackup]
            type = block_volumes.create_details.source_details.type

            # Optional
            id = block_volumes.create_details.source_details.id
          }
        }
      }
    }


    launch_details {

      # Optional
      agent_config {

        # Optional - default = false
        are_all_plugins_disabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.agent_config.are_all_plugins_disabled
        # optional - default = false
        is_management_disabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.agent_config.is_management_disabled
        # optional - default = false
        is_monitoring_disabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.agent_config.is_monitoring_disabled
        # optional
        plugins_config {
          # required - value in [ENABLE, DISABLED]
          desired_state = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.agent_config.is_monitoring_disabled.plugins_config.desired_state
          # required - plugin name
          name = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.agent_config.is_monitoring_disabled.plugins_config.name
        }
      }

      # optional
      availability_config {

        # optional - value in [RESTORE_INSTANCE, STOP_INSTANCE]
        recovery_action = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.availability_config.recovery_action
      }
      # optional
      availability_domain = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.ad
      # optional
      capacity_reservation_id = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.capacity_reservation_id
      # optional
      compartment_id = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.compartment_id != null ? var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.compartment_id : var.instance_pool_config.default_compartment_id

      # optional
      create_vnic_details {

        # Optional
        assign_private_dns_record = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.assign_private_dns_record
        # optional
        assign_public_ip = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.assign_public_ip
        # optional
        defined_tags = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.defined_tags != null ? var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.defined_tags : var.instance_pool_config.default_defined_tags
        # optional
        display_name = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.display_name
        # optional
        freeform_tags = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.freeform_tags != null ? var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.freeform_tags : var.instance_pool_config.freeform_tags
        # optional
        hostname_label = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.hostname_label
        # optional
        nsg_ids = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.nsg_ids
        # optional 
        private_ip = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.private_ip
        # optional
        skip_source_dest_check = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.skip_source_dest_check
        #optional
        subnet_id = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.create_vnic_details.subnet_id
      }

      # optional
      dedicated_vm_host_id = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.dedicated_vm_host_id
      defined_tags         = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.defined_tags != null ? var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.defined_tags : var.instance_pool_config.default_defined_tags
      display_name         = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.display_name
      extended_metadata    = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.extended_metadata
      fault_domain         = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.fd
      freeform_tags        = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.freeform_tags != null ? var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.freeform_tags : var.instance_pool_config.default_defined_tags

      # optional
      instance_options {
        # optional - default = false
        are_legacy_imds_endpoints_disabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.instance_options.are_legacy_imds_endpoints_disabled
      }

      # optional
      ipxe_script = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.ipxe_script
      # optional
      is_pv_encryption_in_transit_enabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.is_pv_encryption_in_transit_enabled
      # optional value in [NATIVE, EMULATED, PARAVIRTUALIZED, CUSTOM]
      launch_mode = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_mode

      # optional
      launch_options {

        # optional - value in [ISCSI, SCSI, IDE, VFIO, PARAVIRTUALIZED]
        boot_volume_type = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_options.boot_volume_type
        # optional - value in [BIOS, UEFI_64]
        firmware = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_options.firmware
        # optional - default = false
        is_consistent_volume_naming_enabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_options.is_consistent_volume_naming_enabled
        # optional - deprecated
        is_pv_encryption_in_transit_enabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_options.is_pv_encryption_in_transit_enabled
        # optional - value in [E100, VIFO, PARAVIRTUALIZED]
        network_type = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_options.network_type
        # optional - value in [ISCSI, SCSI, IDE, VFIO, PARAVIRTUALIZED]
        remote_data_volume_type = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.launch_options.remote_data_volume_type
      }
      # optional
      metadata = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.metadata

      # optional
      platform_config {
        #Required
        type = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.platform_config.type

        # optional applicable when instance_type = compute
        is_measured_boot_enabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.platform_config.is_measured_boot_enabled
        # optional - applicable when instance_type = compute
        is_secure_boot_enabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.platform_config.is_secure_boot_enabled
        # optional - applicable when instance_type = compute
        is_trusted_platform_module_enabled = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.platform_config.is_trusted_platform_module_enabled
        # optional - applicable when type = Applicable when type=AMD_MILAN_BM
        numa_nodes_per_socket = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.platform_config.numa_nodes_per_socket
      }

      # optional
      preemptible_instance_config {
        # Required
        preemption_action {
          #Required
          type = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.preemptible_instance_config.preemption_action.type

          #Optional
          preserve_boot_volume = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.preemptible_instance_config.preemption_action.preserve_boot_volume
        }
      }
      # optional - value in [LIVE_MIGRATE, REBOOT] - default = LIVE_MIGRATE
      preferred_maintenance_action = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.preferred_maintenance_action
      # optional
      shape = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.shape

      # optional
      shape_config {

        # optional - value in [BASELINE_1_8, BASELINE_1_2, BASELINE_1_1]. 
        baseline_ocpu_utilization = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.shape_config.baseline_ocpu_utilization
        # optional
        memory_in_gbs = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.shape_config.memory_in_gbs
        # optional
        nvmes = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.shape_config.nvmes
        # optional
        ocpus = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.shape_config.ocpus
      }

      # optionals
      source_details {
        #Required
        source_type = var.instance_configuration_instance_details_launch_details_source_details_source_type

        # optional - Applicable when source_type=bootVolume
        boot_volume_id = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.source_details.boot_volume_id
        # optional - Applicable when source_type=image
        boot_volume_size_in_gbs = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.boot_volume_size_in_gbs
        # optional -  Applicable when source_type=image
        image_id = var.instance_pool_config.instance_pool.instance_configuration.instance_details.launch_details.image_id
      }
    }

    # optional
    dynamic "secondary_vnics" {
      for_each = var.instance_pool_config.instance_pool.instance_configuration.instance_details.
      # Optional
      create_vnic_details {

        #Optional
        assign_private_dns_record = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_assign_private_dns_record
        assign_public_ip          = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_assign_public_ip
        defined_tags              = { "Operations.CostCenter" = "42" }
        display_name              = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_display_name
        freeform_tags             = { "Department" = "Finance" }
        hostname_label            = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_hostname_label
        nsg_ids                   = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_nsg_ids
        private_ip                = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_private_ip
        skip_source_dest_check    = var.instance_configuration_instance_details_secondary_vnics_create_vnic_details_skip_source_dest_check
        subnet_id                 = oci_core_subnet.test_subnet.id
      }
      display_name = var.instance_configuration_instance_details_secondary_vnics_display_name
      nic_index    = var.instance_configuration_instance_details_secondary_vnics_nic_index
    }
  }

}

resource "oci_core_instance_pool" "instance_pool" {
  #Required
  compartment_id            = var.compartment_id
  instance_configuration_id = oci_core_instance_configuration.instance_configuration.id
  placement_configurations {
    #Required
    availability_domain = var.instance_pool_placement_configurations_availability_domain
    primary_subnet_id   = oci_core_subnet.test_subnet.id

    #Optional
    fault_domains = var.instance_pool_placement_configurations_fault_domains
    secondary_vnic_subnets {
      #Required
      subnet_id = oci_core_subnet.test_subnet.id

      #Optional
      display_name = var.instance_pool_placement_configurations_secondary_vnic_subnets_display_name
    }
  }
  size = var.instance_pool_size

  #Optional
  defined_tags  = { "Operations.CostCenter" = "42" }
  display_name  = var.instance_pool_display_name
  freeform_tags = { "Department" = "Finance" }
  load_balancers {
    #Required
    backend_set_name = oci_load_balancer_backend_set.test_backend_set.name
    load_balancer_id = oci_load_balancer_load_balancer.test_load_balancer.id
    port             = var.instance_pool_load_balancers_port
    vnic_selection   = var.instance_pool_load_balancers_vnic_selection
  }
}