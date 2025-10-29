locals {
  l2vpn_xconnect_group_p2p = flatten([
    for device in local.devices : [
      for xconnect in try(local.device_config[device.name].l2vpn_xconnect_group_p2p, []) : {
        key               = format("%s/%s/%s", device.name, xconnect.group_name, xconnect.p2p_xconnect_name)
        device_name       = device.name
        group_name        = xconnect.group_name
        p2p_xconnect_name = xconnect.p2p_xconnect_name
        description       = try(xconnect.description, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.description, null)
        interfaces = try(length(xconnect.interfaces) == 0, true) ? null : [for interface in xconnect.interfaces : {
          interface_name = try(interface.interface_name, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.interfaces.interface_name, null)
          }
        ]
        evpn_service_neighbors = try(length(xconnect.evpn_service_neighbors) == 0, true) ? null : [for neighbor in xconnect.evpn_service_neighbors : {
          service_id = try(neighbor.service_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_service_neighbors.service_id, null)
          vpn_id     = try(neighbor.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_service_neighbors.vpn_id, null)
          pw_class   = try(neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_service_neighbors.pw_class, null)
          }
        ]
        evpn_target_neighbors = try(length(xconnect.evpn_target_neighbors) == 0, true) ? null : [for neighbor in xconnect.evpn_target_neighbors : {
          remote_ac_id = try(neighbor.remote_ac_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_target_neighbors.remote_ac_id, null)
          source       = try(neighbor.source, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_target_neighbors.source, null)
          vpn_id       = try(neighbor.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_target_neighbors.vpn_id, null)
          pw_class     = try(neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.evpn_target_neighbors.pw_class, null)
          }
        ]
        ipv4_neighbors = try(length(xconnect.ipv4_neighbors) == 0, true) ? null : [for neighbor in xconnect.ipv4_neighbors : {
          address  = try(neighbor.address, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.ipv4_neighbors.address, null)
          pw_id    = try(neighbor.pw_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.ipv4_neighbors.pw_id, null)
          pw_class = try(neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.ipv4_neighbors.pw_class, null)
          }
        ]
        ipv6_neighbors = try(length(xconnect.ipv6_neighbors) == 0, true) ? null : [for neighbor in xconnect.ipv6_neighbors : {
          address  = try(neighbor.address, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.ipv6_neighbors.address, null)
          pw_id    = try(neighbor.pw_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.ipv6_neighbors.pw_id, null)
          pw_class = try(neighbor.pw_class, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.ipv6_neighbors.pw_class, null)
          }
        ]
        neighbor_evpn_evi_segment_routing_services = try(length(xconnect.neighbor_evpn_evi_segment_routing_services) == 0, true) ? null : [for service in xconnect.neighbor_evpn_evi_segment_routing_services : {
          service_id                   = try(service.service_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.neighbor_evpn_evi_segment_routing_services.service_id, null)
          vpn_id                       = try(service.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.neighbor_evpn_evi_segment_routing_services.vpn_id, null)
          segment_routing_srv6_locator = try(service.segment_routing_srv6_locator, local.defaults.iosxr.devices.configuration.l2vpn_xconnect_group_p2p.neighbor_evpn_evi_segment_routing_services.segment_routing_srv6_locator, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_l2vpn_xconnect_group_p2p" "l2vpn_xconnect_group_p2p" {
  for_each                                   = { for item in local.l2vpn_xconnect_group_p2p : item.key => item }
  device                                     = each.value.device_name
  group_name                                 = each.value.group_name
  p2p_xconnect_name                          = each.value.p2p_xconnect_name
  description                                = each.value.description
  interfaces                                 = each.value.interfaces
  evpn_service_neighbors                     = each.value.evpn_service_neighbors
  evpn_target_neighbors                      = each.value.evpn_target_neighbors
  ipv4_neighbors                             = each.value.ipv4_neighbors
  ipv6_neighbors                             = each.value.ipv6_neighbors
  neighbor_evpn_evi_segment_routing_services = each.value.neighbor_evpn_evi_segment_routing_services
}
