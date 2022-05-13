# Copyright (c) 2022, Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

resource "oci_core_instance_configuration" "instance_configuration" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  defined_tags  = { "Operations.CostCenter" = "42" }
  display_name  = var.instance_configuration_display_name
  freeform_tags = { "Department" = "Finance" }
  instance_details {
    #Required
    instance_type = var.instance_configuration_instance_details_instance_type

    #Optional
    block_volumes {

      #Optional
      attach_details {
        #Required
        type = var.instance_configuration_instance_details_block_volumes_attach_details_type

        #Optional
        device                              = var.instance_configuration_instance_details_block_volumes_attach_details_device
        display_name                        = var.instance_configuration_instance_details_block_volumes_attach_details_display_name
        is_pv_encryption_in_transit_enabled = var.instance_configuration_instance_details_block_volumes_attach_details_is_pv_encryption_in_transit_enabled
        is_read_only                        = var.instance_configuration_instance_details_block_volumes_attach_details_is_read_only
        is_shareable                        = var.instance_configuration_instance_details_block_volumes_attach_details_is_shareable
        use_chap                            = var.instance_configuration_instance_details_block_volumes_attach_details_use_chap
      }
      create_details {

        #Optional
        availability_domain = var.instance_configuration_instance_details_block_volumes_create_details_availability_domain
        backup_policy_id    = data.oci_core_volume_backup_policies.test_volume_backup_policies.volume_backup_policies.0.id
        compartment_id      = var.compartment_id
        defined_tags        = { "Operations.CostCenter" = "42" }
        display_name        = var.instance_configuration_instance_details_block_volumes_create_details_display_name
        freeform_tags       = { "Department" = "Finance" }
        kms_key_id          = oci_kms_key.test_key.id
        size_in_gbs         = var.instance_configuration_instance_details_block_volumes_create_details_size_in_gbs
        source_details {
          #Required
          type = var.instance_configuration_instance_details_block_volumes_create_details_source_details_type

          #Optional
          id = var.instance_configuration_instance_details_block_volumes_create_details_source_details_id
        }
        vpus_per_gb = var.instance_configuration_instance_details_block_volumes_create_details_vpus_per_gb
      }
      volume_id = oci_core_volume.test_volume.id
    }
    launch_details {

      #Optional
      agent_config {

        #Optional
        are_all_plugins_disabled = var.instance_configuration_instance_details_launch_details_agent_config_are_all_plugins_disabled
        is_management_disabled   = var.instance_configuration_instance_details_launch_details_agent_config_is_management_disabled
        is_monitoring_disabled   = var.instance_configuration_instance_details_launch_details_agent_config_is_monitoring_disabled
        plugins_config {
          #Required
          desired_state = var.instance_configuration_instance_details_launch_details_agent_config_plugins_config_desired_state
          name          = var.instance_configuration_instance_details_launch_details_agent_config_plugins_config_name
        }
      }
      availability_config {

        #Optional
        recovery_action = var.instance_configuration_instance_details_launch_details_availability_config_recovery_action
      }
      availability_domain     = var.instance_configuration_instance_details_launch_details_availability_domain
      capacity_reservation_id = oci_core_capacity_reservation.test_capacity_reservation.id
      compartment_id          = var.compartment_id
      create_vnic_details {

        #Optional
        assign_private_dns_record = var.instance_configuration_instance_details_launch_details_create_vnic_details_assign_private_dns_record
        assign_public_ip          = var.instance_configuration_instance_details_launch_details_create_vnic_details_assign_public_ip
        defined_tags              = { "Operations.CostCenter" = "42" }
        display_name              = var.instance_configuration_instance_details_launch_details_create_vnic_details_display_name
        freeform_tags             = { "Department" = "Finance" }
        hostname_label            = var.instance_configuration_instance_details_launch_details_create_vnic_details_hostname_label
        nsg_ids                   = var.instance_configuration_instance_details_launch_details_create_vnic_details_nsg_ids
        private_ip                = var.instance_configuration_instance_details_launch_details_create_vnic_details_private_ip
        skip_source_dest_check    = var.instance_configuration_instance_details_launch_details_create_vnic_details_skip_source_dest_check
        subnet_id                 = oci_core_subnet.test_subnet.id
      }
      dedicated_vm_host_id = oci_core_dedicated_vm_host.test_dedicated_vm_host.id
      defined_tags         = { "Operations.CostCenter" = "42" }
      display_name         = var.instance_configuration_instance_details_launch_details_display_name
      extended_metadata    = var.instance_configuration_instance_details_launch_details_extended_metadata
      fault_domain         = var.instance_configuration_instance_details_launch_details_fault_domain
      freeform_tags        = { "Department" = "Finance" }
      instance_options {

        #Optional
        are_legacy_imds_endpoints_disabled = var.instance_configuration_instance_details_launch_details_instance_options_are_legacy_imds_endpoints_disabled
      }
      ipxe_script                         = var.instance_configuration_instance_details_launch_details_ipxe_script
      is_pv_encryption_in_transit_enabled = var.instance_configuration_instance_details_launch_details_is_pv_encryption_in_transit_enabled
      launch_mode                         = var.instance_configuration_instance_details_launch_details_launch_mode
      launch_options {

        #Optional
        boot_volume_type                    = var.instance_configuration_instance_details_launch_details_launch_options_boot_volume_type
        firmware                            = var.instance_configuration_instance_details_launch_details_launch_options_firmware
        is_consistent_volume_naming_enabled = var.instance_configuration_instance_details_launch_details_launch_options_is_consistent_volume_naming_enabled
        is_pv_encryption_in_transit_enabled = var.instance_configuration_instance_details_launch_details_launch_options_is_pv_encryption_in_transit_enabled
        network_type                        = var.instance_configuration_instance_details_launch_details_launch_options_network_type
        remote_data_volume_type             = var.instance_configuration_instance_details_launch_details_launch_options_remote_data_volume_type
      }
      metadata = var.instance_configuration_instance_details_launch_details_metadata
      platform_config {
        #Required
        type = var.instance_configuration_instance_details_launch_details_platform_config_type

        #Optional
        is_measured_boot_enabled           = var.instance_configuration_instance_details_launch_details_platform_config_is_measured_boot_enabled
        is_secure_boot_enabled             = var.instance_configuration_instance_details_launch_details_platform_config_is_secure_boot_enabled
        is_trusted_platform_module_enabled = var.instance_configuration_instance_details_launch_details_platform_config_is_trusted_platform_module_enabled
        numa_nodes_per_socket              = var.instance_configuration_instance_details_launch_details_platform_config_numa_nodes_per_socket
      }
      preemptible_instance_config {
        #Required
        preemption_action {
          #Required
          type = var.instance_configuration_instance_details_launch_details_preemptible_instance_config_preemption_action_type

          #Optional
          preserve_boot_volume = var.instance_configuration_instance_details_launch_details_preemptible_instance_config_preemption_action_preserve_boot_volume
        }
      }
      preferred_maintenance_action = var.instance_configuration_instance_details_launch_details_preferred_maintenance_action
      shape                        = var.instance_configuration_instance_details_launch_details_shape
      shape_config {

        #Optional
        baseline_ocpu_utilization = var.instance_configuration_instance_details_launch_details_shape_config_baseline_ocpu_utilization
        memory_in_gbs             = var.instance_configuration_instance_details_launch_details_shape_config_memory_in_gbs
        nvmes                     = var.instance_configuration_instance_details_launch_details_shape_config_nvmes
        ocpus                     = var.instance_configuration_instance_details_launch_details_shape_config_ocpus
      }
      source_details {
        #Required
        source_type = var.instance_configuration_instance_details_launch_details_source_details_source_type

        #Optional
        boot_volume_id          = oci_core_boot_volume.test_boot_volume.id
        boot_volume_size_in_gbs = var.instance_configuration_instance_details_launch_details_source_details_boot_volume_size_in_gbs
        image_id                = oci_core_image.test_image.id
      }
    }
    secondary_vnics {

      #Optional
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
  instance_id = oci_core_instance.test_instance.id
  source      = var.instance_configuration_source
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