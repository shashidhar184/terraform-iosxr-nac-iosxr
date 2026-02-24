##### EVPN #####

locals {
  evpn = { for device in local.devices : device.name => {
    bgp_rd = try(local.device_config[device.name].evpn.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.bgp.rd, null) != null ? provider::utils::parse_bgp_rd_rt(
      try(local.device_config[device.name].evpn.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.bgp.rd)
    ) : null
    cost_out                                                  = try(local.device_config[device.name].evpn.cost_out, local.defaults.iosxr.devices.configuration.evpn.cost_out, null)
    enforce_mtu_match                                         = try(local.device_config[device.name].evpn.enforce_mtu_match, local.defaults.iosxr.devices.configuration.evpn.enforce_mtu_match, null)
    ethernet_segment_type_one_auto_generation_disable         = try(local.device_config[device.name].evpn.ethernet_segment.type_one_auto_generation_disable, local.defaults.iosxr.devices.configuration.evpn.ethernet_segment.type_one_auto_generation_disable, null)
    host_ipv4_duplicate_detection_disable                     = try(local.device_config[device.name].evpn.host_ipv4_duplicate_detection.disable, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection.disable, null)
    host_ipv4_duplicate_detection_freeze_time                 = try(local.device_config[device.name].evpn.host_ipv4_duplicate_detection.freeze_time, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection.freeze_time, null)
    host_ipv4_duplicate_detection_move_count                  = try(local.device_config[device.name].evpn.host_ipv4_duplicate_detection.move_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection.move_count, null)
    host_ipv4_duplicate_detection_move_interval               = try(local.device_config[device.name].evpn.host_ipv4_duplicate_detection.move_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection.move_interval, null)
    host_ipv4_duplicate_detection_reset_freeze_count_interval = try(local.device_config[device.name].evpn.host_ipv4_duplicate_detection.reset_freeze_count_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection.reset_freeze_count_interval, null)
    host_ipv4_duplicate_detection_retry_count                 = try(local.device_config[device.name].evpn.host_ipv4_duplicate_detection.retry_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv4_duplicate_detection.retry_count, null)
    host_ipv6_duplicate_detection_disable                     = try(local.device_config[device.name].evpn.host_ipv6_duplicate_detection.disable, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection.disable, null)
    host_ipv6_duplicate_detection_freeze_time                 = try(local.device_config[device.name].evpn.host_ipv6_duplicate_detection.freeze_time, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection.freeze_time, null)
    host_ipv6_duplicate_detection_move_count                  = try(local.device_config[device.name].evpn.host_ipv6_duplicate_detection.move_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection.move_count, null)
    host_ipv6_duplicate_detection_move_interval               = try(local.device_config[device.name].evpn.host_ipv6_duplicate_detection.move_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection.move_interval, null)
    host_ipv6_duplicate_detection_reset_freeze_count_interval = try(local.device_config[device.name].evpn.host_ipv6_duplicate_detection.reset_freeze_count_interval, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection.reset_freeze_count_interval, null)
    host_ipv6_duplicate_detection_retry_count                 = try(local.device_config[device.name].evpn.host_ipv6_duplicate_detection.retry_count, local.defaults.iosxr.devices.configuration.evpn.host_ipv6_duplicate_detection.retry_count, null)
    ignore_mtu_mismatch                                       = try(local.device_config[device.name].evpn.ignore_mtu_mismatch, local.defaults.iosxr.devices.configuration.evpn.ignore_mtu_mismatch, null)
    load_balancing_flow_label_static                          = try(local.device_config[device.name].evpn.load_balancing_flow_label_static, local.defaults.iosxr.devices.configuration.evpn.load_balancing_flow_label_static, null)
    logging_df_election                                       = try(local.device_config[device.name].evpn.logging_df_election, local.defaults.iosxr.devices.configuration.evpn.logging_df_election, null)
    source_interface                                          = try(local.device_config[device.name].evpn.source_interface, local.defaults.iosxr.devices.configuration.evpn.source_interface, null)
    srv6                                                      = try(local.device_config[device.name].evpn.srv6, local.defaults.iosxr.devices.configuration.evpn.srv6, null)
    srv6_usid_allocation_wide_local_id_block                  = try(local.device_config[device.name].evpn.srv6_usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.evpn.srv6_usid_allocation_wide_local_id_block, null)
    staggered_bringup_timer                                   = try(local.device_config[device.name].evpn.staggered_bringup_timer, local.defaults.iosxr.devices.configuration.evpn.staggered_bringup_timer, null)
    startup_cost_in                                           = try(local.device_config[device.name].evpn.startup_cost_in, local.defaults.iosxr.devices.configuration.evpn.startup_cost_in, null)
    timers_ac_debounce                                        = try(local.device_config[device.name].evpn.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.timers.ac_debounce, null)
    timers_backup_replacement_delay                           = try(local.device_config[device.name].evpn.timers.backup_replacement_delay, local.defaults.iosxr.devices.configuration.evpn.timers.backup_replacement_delay, null)
    timers_carving                                            = try(local.device_config[device.name].evpn.timers.carving, local.defaults.iosxr.devices.configuration.evpn.timers.carving, null)
    timers_mac_postpone                                       = try(local.device_config[device.name].evpn.timers.mac_postpone, local.defaults.iosxr.devices.configuration.evpn.timers.mac_postpone, null)
    timers_peering                                            = try(local.device_config[device.name].evpn.timers.peering, local.defaults.iosxr.devices.configuration.evpn.timers.peering, null)
    timers_recovery                                           = try(local.device_config[device.name].evpn.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.timers.recovery, null)
    transmit_l2_mtu                                           = try(local.device_config[device.name].evpn.transmit_l2_mtu, local.defaults.iosxr.devices.configuration.evpn.transmit_l2_mtu, null)
    transmit_mtu_zero                                         = try(local.device_config[device.name].evpn.transmit_mtu_zero, local.defaults.iosxr.devices.configuration.evpn.transmit_mtu_zero, null)
    virtual_access_evi_ethernet_segment_bgp_rt = try(
      provider::utils::normalize_mac(
        try(local.device_config[device.name].evpn.virtual_access_evi.ethernet_segment.bgp_rt, local.defaults.iosxr.devices.configuration.evpn.virtual_access_evi.ethernet_segment.bgp_rt),
        "colon"
      ),
      null
    )
    virtual_access_evi_ethernet_segment_esi_zero = try(local.device_config[device.name].evpn.virtual_access_evi.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual_access_evi.ethernet_segment.esi_zero, null)
    groups = try(length(local.device_config[device.name].evpn.groups) == 0, true) ? null : [for group in local.device_config[device.name].evpn.groups : {
      group_id = try(group.group_id, local.defaults.iosxr.devices.configuration.evpn.groups.group_id, null)
      core_interfaces = try(length(group.core_interfaces) == 0, true) ? null : [for core_interface in group.core_interfaces : {
        interface_name = try(core_interface.interface_name, local.defaults.iosxr.devices.configuration.evpn.groups.core_interfaces.interface_name, null)
      }]
    }]
    srv6_locators = try(length(local.device_config[device.name].evpn.srv6_locators) == 0, true) ? null : [for locator in local.device_config[device.name].evpn.srv6_locators : {
      locator_name                        = try(locator.locator_name, local.defaults.iosxr.devices.configuration.evpn.srv6_locators.locator_name, null)
      usid_allocation_wide_local_id_block = try(locator.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.evpn.srv6_locators.usid_allocation_wide_local_id_block, null)
    }]
    virtual_neighbors = try(length(local.device_config[device.name].evpn.virtual_neighbors) == 0, true) ? null : [for neighbor in local.device_config[device.name].evpn.virtual_neighbors : {
      address = try(neighbor.address, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.address, null)
      pw_id   = try(neighbor.pw_id, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.pw_id, null)
      ethernet_segment_bgp_rt = try(
        provider::utils::normalize_mac(
          try(neighbor.ethernet_segment.bgp_rt, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.bgp_rt),
          "colon"
        ),
        null
      )
      ethernet_segment_esi_zero                                       = try(neighbor.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.esi_zero, null)
      ethernet_segment_service_carving_hrw                            = try(neighbor.ethernet_segment.service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_hrw, null)
      ethernet_segment_service_carving_manual_primary                 = try(neighbor.ethernet_segment.service_carving_manual.primary, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_manual.primary, null)
      ethernet_segment_service_carving_manual_secondary               = try(neighbor.ethernet_segment.service_carving_manual.secondary, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_manual.secondary, null)
      ethernet_segment_service_carving_multicast_hrw_g                = try(neighbor.ethernet_segment.service_carving_multicast_hrw_g, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_multicast_hrw_g, null)
      ethernet_segment_service_carving_multicast_hrw_s_g              = try(neighbor.ethernet_segment.service_carving_multicast_hrw_s_g, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_multicast_hrw_s_g, null)
      ethernet_segment_service_carving_preference_based_access_driven = try(neighbor.ethernet_segment.service_carving_preference_based.access_driven, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_preference_based.access_driven, null)
      ethernet_segment_service_carving_preference_based_weight        = try(neighbor.ethernet_segment.service_carving_preference_based.weight, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.ethernet_segment.service_carving_preference_based.weight, null)
      timers_ac_debounce                                              = try(neighbor.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers.ac_debounce, null)
      timers_carving                                                  = try(neighbor.timers.carving, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers.carving, null)
      timers_peering                                                  = try(neighbor.timers.peering, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers.peering, null)
      timers_recovery                                                 = try(neighbor.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.virtual_neighbors.timers.recovery, null)
    }]
    virtual_vfis = try(length(local.device_config[device.name].evpn.virtual_vfis) == 0, true) ? null : [for vfi in local.device_config[device.name].evpn.virtual_vfis : {
      vfi_name = try(vfi.vfi_name, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.vfi_name, null)
      ethernet_segment_bgp_rt = try(
        provider::utils::normalize_mac(
          try(vfi.ethernet_segment.bgp_rt, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.bgp_rt),
          "colon"
        ),
        null
      )
      ethernet_segment_esi_zero                                       = try(vfi.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.esi_zero, null)
      ethernet_segment_service_carving_hrw                            = try(vfi.ethernet_segment.service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.service_carving_hrw, null)
      ethernet_segment_service_carving_manual_primary                 = try(vfi.ethernet_segment.service_carving_manual.primary, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.service_carving_manual.primary, null)
      ethernet_segment_service_carving_manual_secondary               = try(vfi.ethernet_segment.service_carving_manual.secondary, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.service_carving_manual.secondary, null)
      ethernet_segment_service_carving_preference_based_access_driven = try(vfi.ethernet_segment.service_carving_preference_based.access_driven, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.service_carving_preference_based.access_driven, null)
      ethernet_segment_service_carving_preference_based_weight        = try(vfi.ethernet_segment.service_carving_preference_based.weight, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.ethernet_segment.service_carving_preference_based.weight, null)
      timers_ac_debounce                                              = try(vfi.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers.ac_debounce, null)
      timers_carving                                                  = try(vfi.timers.carving, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers.carving, null)
      timers_peering                                                  = try(vfi.timers.peering, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers.peering, null)
      timers_recovery                                                 = try(vfi.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.virtual_vfis.timers.recovery, null)
    }]
  } if try(local.device_config[device.name].evpn, null) != null || try(local.defaults.iosxr.devices.configuration.evpn, null) != null }
}

resource "iosxr_evpn" "evpn" {
  for_each                                                  = local.evpn
  device                                                    = each.key
  bgp_rd_two_byte_as_number                                 = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_two_byte_as_index                                  = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_four_byte_as_number                                = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_four_byte_as_index                                 = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_ipv4_address                                       = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.ipv4_address : null, null)
  bgp_rd_ipv4_address_index                                 = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.assigned_number : null, null)
  cost_out                                                  = each.value.cost_out
  enforce_mtu_match                                         = each.value.enforce_mtu_match
  ethernet_segment_type_one_auto_generation_disable         = each.value.ethernet_segment_type_one_auto_generation_disable
  host_ipv4_duplicate_detection_disable                     = each.value.host_ipv4_duplicate_detection_disable
  host_ipv4_duplicate_detection_freeze_time                 = each.value.host_ipv4_duplicate_detection_freeze_time
  host_ipv4_duplicate_detection_move_count                  = each.value.host_ipv4_duplicate_detection_move_count
  host_ipv4_duplicate_detection_move_interval               = each.value.host_ipv4_duplicate_detection_move_interval
  host_ipv4_duplicate_detection_reset_freeze_count_interval = each.value.host_ipv4_duplicate_detection_reset_freeze_count_interval
  host_ipv4_duplicate_detection_retry_count                 = each.value.host_ipv4_duplicate_detection_retry_count
  host_ipv6_duplicate_detection_disable                     = each.value.host_ipv6_duplicate_detection_disable
  host_ipv6_duplicate_detection_freeze_time                 = each.value.host_ipv6_duplicate_detection_freeze_time
  host_ipv6_duplicate_detection_move_count                  = each.value.host_ipv6_duplicate_detection_move_count
  host_ipv6_duplicate_detection_move_interval               = each.value.host_ipv6_duplicate_detection_move_interval
  host_ipv6_duplicate_detection_reset_freeze_count_interval = each.value.host_ipv6_duplicate_detection_reset_freeze_count_interval
  host_ipv6_duplicate_detection_retry_count                 = each.value.host_ipv6_duplicate_detection_retry_count
  ignore_mtu_mismatch                                       = each.value.ignore_mtu_mismatch
  load_balancing_flow_label_static                          = each.value.load_balancing_flow_label_static
  logging_df_election                                       = each.value.logging_df_election
  source_interface                                          = each.value.source_interface
  srv6                                                      = each.value.srv6
  srv6_usid_allocation_wide_local_id_block                  = each.value.srv6_usid_allocation_wide_local_id_block
  staggered_bringup_timer                                   = each.value.staggered_bringup_timer
  startup_cost_in                                           = each.value.startup_cost_in
  timers_ac_debounce                                        = each.value.timers_ac_debounce
  timers_backup_replacement_delay                           = each.value.timers_backup_replacement_delay
  timers_carving                                            = each.value.timers_carving
  timers_mac_postpone                                       = each.value.timers_mac_postpone
  timers_peering                                            = each.value.timers_peering
  timers_recovery                                           = each.value.timers_recovery
  transmit_l2_mtu                                           = each.value.transmit_l2_mtu
  transmit_mtu_zero                                         = each.value.transmit_mtu_zero
  virtual_access_evi_ethernet_segment_bgp_rt                = each.value.virtual_access_evi_ethernet_segment_bgp_rt
  virtual_access_evi_ethernet_segment_esi_zero              = each.value.virtual_access_evi_ethernet_segment_esi_zero
  groups                                                    = each.value.groups
  srv6_locators                                             = each.value.srv6_locators
  virtual_neighbors                                         = each.value.virtual_neighbors
  virtual_vfis                                              = each.value.virtual_vfis

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}

##### EVPN EVI #####

locals {
  evpn_evis = flatten([
    for device in local.devices : [
      for evi in try(local.device_config[device.name].evpn.evis, []) : {
        key                              = format("%s/%s", device.name, evi.vpn_id)
        device_name                      = device.name
        vpn_id                           = try(evi.vpn_id, local.defaults.iosxr.devices.configuration.evpn.evis.vpn_id, null)
        description                      = try(evi.description, local.defaults.iosxr.devices.configuration.evpn.evis.description, null)
        load_balancing                   = try(evi.load_balancing, local.defaults.iosxr.devices.configuration.evpn.evis.load_balancing, null)
        load_balancing_flow_label_static = try(evi.load_balancing_flow_label_static, local.defaults.iosxr.devices.configuration.evpn.evis.load_balancing_flow_label_static, null)
        bgp_rd = try(evi.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.rd, null) != null ? provider::utils::parse_bgp_rd_rt(
          try(evi.bgp.rd, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.rd)
        ) : null
        bgp_route_policy_import = try(evi.bgp.route_policy_import, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_policy_import, null)
        bgp_route_policy_export = try(evi.bgp.route_policy_export, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_policy_export, null)
        bgp_route_target_import = try(evi.bgp.route_target_import, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_import, null) != null ? [
          for rt in try(evi.bgp.route_target_import, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_import) : provider::utils::parse_bgp_rd_rt(rt)
        ] : null
        bgp_route_target_export = try(evi.bgp.route_target_export, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_export, null) != null ? [
          for rt in try(evi.bgp.route_target_export, local.defaults.iosxr.devices.configuration.evpn.evis.bgp.route_target_export) : provider::utils::parse_bgp_rd_rt(rt)
        ] : null
        advertise_mac               = try(evi.advertise_mac, local.defaults.iosxr.devices.configuration.evpn.evis.advertise_mac, null)
        unknown_unicast_suppression = try(evi.unknown_unicast_suppression, local.defaults.iosxr.devices.configuration.evpn.evis.unknown_unicast_suppression, null)
        control_word_disable        = try(evi.control_word_disable, local.defaults.iosxr.devices.configuration.evpn.evis.control_word_disable, null)
        etree                       = try(evi.etree, local.defaults.iosxr.devices.configuration.evpn.evis.etree, null)
        etree_leaf                  = try(evi.etree_leaf, local.defaults.iosxr.devices.configuration.evpn.evis.etree_leaf, null)
        etree_rt_leaf               = try(evi.etree_rt_leaf, local.defaults.iosxr.devices.configuration.evpn.evis.etree_rt_leaf, null)
      }
    ]
  ])
}

resource "iosxr_evpn_evi" "evpn_evi" {
  for_each                         = { for evi in local.evpn_evis : evi.key => evi }
  device                           = each.value.device_name
  vpn_id                           = each.value.vpn_id
  description                      = each.value.description
  load_balancing                   = each.value.load_balancing
  load_balancing_flow_label_static = each.value.load_balancing_flow_label_static
  bgp_rd_two_byte_as_number        = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_two_byte_as_index         = try(each.value.bgp_rd.format == "two_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_four_byte_as_number       = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.as_number : null, null)
  bgp_rd_four_byte_as_index        = try(each.value.bgp_rd.format == "four_byte_as" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_rd_ipv4_address              = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.ipv4_address : null, null)
  bgp_rd_ipv4_address_index        = try(each.value.bgp_rd.format == "ipv4_address" ? each.value.bgp_rd.assigned_number : null, null)
  bgp_route_policy_import          = each.value.bgp_route_policy_import
  bgp_route_policy_export          = each.value.bgp_route_policy_export
  advertise_mac                    = each.value.advertise_mac
  unknown_unicast_suppression      = each.value.unknown_unicast_suppression
  control_word_disable             = each.value.control_word_disable
  etree                            = each.value.etree
  etree_leaf                       = each.value.etree_leaf
  etree_rt_leaf                    = each.value.etree_rt_leaf
  bgp_route_target_import_two_byte_as_format = try(length([for rt in each.value.bgp_route_target_import : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [for rt in each.value.bgp_route_target_import : {
    as_number       = rt.as_number
    assigned_number = rt.assigned_number
  } if rt.format == "two_byte_as"]
  bgp_route_target_import_four_byte_as_format = try(length([for rt in each.value.bgp_route_target_import : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [for rt in each.value.bgp_route_target_import : {
    as_number       = rt.as_number
    assigned_number = rt.assigned_number
  } if rt.format == "four_byte_as"]
  bgp_route_target_import_ipv4_address_format = try(length([for rt in each.value.bgp_route_target_import : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [for rt in each.value.bgp_route_target_import : {
    ipv4_address    = rt.ipv4_address
    assigned_number = rt.assigned_number
  } if rt.format == "ipv4_address"]
  bgp_route_target_export_two_byte_as_format = try(length([for rt in each.value.bgp_route_target_export : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [for rt in each.value.bgp_route_target_export : {
    as_number       = rt.as_number
    assigned_number = rt.assigned_number
  } if rt.format == "two_byte_as"]
  bgp_route_target_export_four_byte_as_format = try(length([for rt in each.value.bgp_route_target_export : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [for rt in each.value.bgp_route_target_export : {
    as_number       = rt.as_number
    assigned_number = rt.assigned_number
  } if rt.format == "four_byte_as"]
  bgp_route_target_export_ipv4_address_format = try(length([for rt in each.value.bgp_route_target_export : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [for rt in each.value.bgp_route_target_export : {
    ipv4_address    = rt.ipv4_address
    assigned_number = rt.assigned_number
  } if rt.format == "ipv4_address"]

  depends_on = [
    iosxr_evpn.evpn
  ]
}

##### EVPN Interface #####

locals {
  evpn_interfaces = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].evpn.interfaces, []) : {
        key                                                             = format("%s/%s", device.name, intf.interface_name)
        device_name                                                     = device.name
        interface_name                                                  = intf.interface_name
        core_isolation_group                                            = try(intf.core_isolation_group, local.defaults.iosxr.devices.configuration.evpn.interfaces.core_isolation_group, null)
        timers_peering                                                  = try(intf.timers.peering, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.peering, null)
        timers_recovery                                                 = try(intf.timers.recovery, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.recovery, null)
        timers_carving                                                  = try(intf.timers.carving, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.carving, null)
        timers_ac_debounce                                              = try(intf.timers.ac_debounce, local.defaults.iosxr.devices.configuration.evpn.interfaces.timers.ac_debounce, null)
        ethernet_segment_esi_zero                                       = try(intf.ethernet_segment.esi_zero, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.esi_zero, null)
        ethernet_segment_load_balancing_mode_all_active                 = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "all-active" ? true : null
        ethernet_segment_load_balancing_mode_port_active                = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "port-active" ? true : null
        ethernet_segment_load_balancing_mode_single_active              = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "single-active" ? true : null
        ethernet_segment_load_balancing_mode_single_flow_active         = try(intf.ethernet_segment.load_balancing_mode, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.load_balancing_mode, null) == "single-flow-active" ? true : null
        ethernet_segment_force_single_homed                             = try(intf.ethernet_segment.force_single_homed, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.force_single_homed, null)
        ethernet_segment_service_carving_hrw                            = try(intf.ethernet_segment.service_carving_hrw, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_hrw, null)
        ethernet_segment_service_carving_manual_primary                 = try(intf.ethernet_segment.service_carving_manual.primary, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_manual.primary, null)
        ethernet_segment_service_carving_manual_secondary               = try(intf.ethernet_segment.service_carving_manual.secondary, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_manual.secondary, null)
        ethernet_segment_service_carving_multicast_hrw_g                = try(intf.ethernet_segment.service_carving_multicast_hrw_g, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_multicast_hrw_g, null)
        ethernet_segment_service_carving_multicast_hrw_s_g              = try(intf.ethernet_segment.service_carving_multicast_hrw_s_g, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_multicast_hrw_s_g, null)
        ethernet_segment_service_carving_preference_based_weight        = try(intf.ethernet_segment.service_carving_preference_based.weight, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_preference_based.weight, null)
        ethernet_segment_service_carving_preference_based_access_driven = try(intf.ethernet_segment.service_carving_preference_based.access_driven, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.service_carving_preference_based.access_driven, null)
        ethernet_segment_bgp_rt = try(
          provider::utils::normalize_mac(
            try(intf.ethernet_segment.bgp_rt, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.bgp_rt),
            "colon"
          ),
          null
        )
        ethernet_segment_convergence_reroute          = try(intf.ethernet_segment.convergence.reroute, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.convergence.reroute, null)
        ethernet_segment_convergence_mac_mobility     = try(intf.ethernet_segment.convergence.mac_mobility, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.convergence.mac_mobility, null)
        ethernet_segment_convergence_nexthop_tracking = try(intf.ethernet_segment.convergence.nexthop_tracking, local.defaults.iosxr.devices.configuration.evpn.interfaces.ethernet_segment.convergence.nexthop_tracking, null)
        access_signal_bundle_down                     = try(intf.access_signal_bundle_down, local.defaults.iosxr.devices.configuration.evpn.interfaces.access_signal_bundle_down, null)
      }
    ]
  ])
}

resource "iosxr_evpn_interface" "evpn_interface" {
  for_each                                                        = { for intf in local.evpn_interfaces : intf.key => intf }
  device                                                          = each.value.device_name
  interface_name                                                  = each.value.interface_name
  core_isolation_group                                            = each.value.core_isolation_group
  timers_peering                                                  = each.value.timers_peering
  timers_recovery                                                 = each.value.timers_recovery
  timers_carving                                                  = each.value.timers_carving
  timers_ac_debounce                                              = each.value.timers_ac_debounce
  ethernet_segment_esi_zero                                       = each.value.ethernet_segment_esi_zero
  ethernet_segment_load_balancing_mode_all_active                 = each.value.ethernet_segment_load_balancing_mode_all_active
  ethernet_segment_load_balancing_mode_port_active                = each.value.ethernet_segment_load_balancing_mode_port_active
  ethernet_segment_load_balancing_mode_single_active              = each.value.ethernet_segment_load_balancing_mode_single_active
  ethernet_segment_load_balancing_mode_single_flow_active         = each.value.ethernet_segment_load_balancing_mode_single_flow_active
  ethernet_segment_force_single_homed                             = each.value.ethernet_segment_force_single_homed
  ethernet_segment_service_carving_hrw                            = each.value.ethernet_segment_service_carving_hrw
  ethernet_segment_service_carving_manual_primary                 = each.value.ethernet_segment_service_carving_manual_primary
  ethernet_segment_service_carving_manual_secondary               = each.value.ethernet_segment_service_carving_manual_secondary
  ethernet_segment_service_carving_multicast_hrw_g                = each.value.ethernet_segment_service_carving_multicast_hrw_g
  ethernet_segment_service_carving_multicast_hrw_s_g              = each.value.ethernet_segment_service_carving_multicast_hrw_s_g
  ethernet_segment_service_carving_preference_based_weight        = each.value.ethernet_segment_service_carving_preference_based_weight
  ethernet_segment_service_carving_preference_based_access_driven = each.value.ethernet_segment_service_carving_preference_based_access_driven
  ethernet_segment_bgp_rt                                         = each.value.ethernet_segment_bgp_rt
  ethernet_segment_convergence_reroute                            = each.value.ethernet_segment_convergence_reroute
  ethernet_segment_convergence_mac_mobility                       = each.value.ethernet_segment_convergence_mac_mobility
  ethernet_segment_convergence_nexthop_tracking                   = each.value.ethernet_segment_convergence_nexthop_tracking
  access_signal_bundle_down                                       = each.value.access_signal_bundle_down

  depends_on = [
    iosxr_evpn.evpn
  ]
}
