locals {
  device_l2vpn_bridge_group_bridge_domains = flatten([
    for device in local.devices : [
      for bridge_domain in try(local.device_config[device.name].l2vpn_bridge_group_bridge_domain, []) : {
        device_name                        = device.name
        bridge_group_name                  = bridge_domain.bridge_group_name
        bridge_domain_name                 = bridge_domain.bridge_domain_name
        key                                = "${device.name}-${bridge_domain.bridge_group_name}-${bridge_domain.bridge_domain_name}"
        delete_mode                        = try(bridge_domain.delete_mode, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_delete_mode, null)
        mtu                                = try(bridge_domain.mtu, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_mtu, null)
        storm_control_broadcast_kbps       = try(bridge_domain.storm_control_broadcast_kbps, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_storm_control_broadcast_kbps, null)
        storm_control_broadcast_pps        = try(bridge_domain.storm_control_broadcast_pps, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_storm_control_broadcast_pps, null)
        storm_control_multicast_kbps       = try(bridge_domain.storm_control_multicast_kbps, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_storm_control_multicast_kbps, null)
        storm_control_multicast_pps        = try(bridge_domain.storm_control_multicast_pps, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_storm_control_multicast_pps, null)
        storm_control_unknown_unicast_kbps = try(bridge_domain.storm_control_unknown_unicast_kbps, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_storm_control_unknown_unicast_kbps, null)
        storm_control_unknown_unicast_pps  = try(bridge_domain.storm_control_unknown_unicast_pps, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_storm_control_unknown_unicast_pps, null)
        evis                               = try(bridge_domain.evis, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_evis, [])
        interfaces                         = try(bridge_domain.interfaces, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_interfaces, [])
        segment_routing_srv6_evis          = try(bridge_domain.segment_routing_srv6_evis, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_segment_routing_srv6_evis, [])
        vnis                               = try(bridge_domain.vnis, local.defaults.iosxr.configuration.l2vpn_bridge_group_bridge_domain_vnis, [])
      }
    ]
  ])
}

resource "iosxr_l2vpn_bridge_group_bridge_domain" "l2vpn_bridge_group_bridge_domain" {
  for_each = { for bridge_domain in local.device_l2vpn_bridge_group_bridge_domains : bridge_domain.key => bridge_domain }

  device                             = each.value.device_name
  bridge_group_name                  = each.value.bridge_group_name
  bridge_domain_name                 = each.value.bridge_domain_name
  delete_mode                        = each.value.delete_mode
  mtu                                = each.value.mtu
  storm_control_broadcast_kbps       = each.value.storm_control_broadcast_kbps
  storm_control_broadcast_pps        = each.value.storm_control_broadcast_pps
  storm_control_multicast_kbps       = each.value.storm_control_multicast_kbps
  storm_control_multicast_pps        = each.value.storm_control_multicast_pps
  storm_control_unknown_unicast_kbps = each.value.storm_control_unknown_unicast_kbps
  storm_control_unknown_unicast_pps  = each.value.storm_control_unknown_unicast_pps
  evis                               = each.value.evis
  interfaces                         = each.value.interfaces
  segment_routing_srv6_evis          = each.value.segment_routing_srv6_evis
  vnis                               = each.value.vnis
}