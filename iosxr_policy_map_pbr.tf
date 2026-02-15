locals {
  policy_map_pbr = flatten([
    for device in local.devices : [
      for policy_map_pbr in try(local.device_config[device.name].policy_map_pbr, []) : {
        key             = format("%s/%s", device.name, policy_map_pbr.policy_map_name)
        device_name     = device.name
        policy_map_name = try(policy_map_pbr.policy_map_name, local.defaults.iosxr.devices.configuration.policy_map_pbr.policy_map_name, null)
        description     = try(policy_map_pbr.description, local.defaults.iosxr.devices.configuration.policy_map_pbr.description, null)
        classes = try(length(policy_map_pbr.classes) == 0, true) ? null : [for class in policy_map_pbr.classes : {
          name                                    = try(class.name, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.name, null)
          type                                    = try(class.type, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.type, null)
          decapsulate_gre                         = try(class.decapsulate_gre, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.decapsulate_gre, null)
          drop                                    = try(class.drop, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.drop, null)
          police_rate_unit                        = try(class.police_rate_unit, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.police_rate_unit, null)
          police_rate_value                       = try(class.police_rate_value, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.police_rate_value, null)
          redirect_ipv4_default_route             = try(class.redirect_ipv4_default_route, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_default_route, null)
          redirect_ipv4_nexthop1_address          = try(class.redirect_ipv4_nexthop1_address, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_nexthop1_address, null)
          redirect_ipv4_nexthop1_vrf              = try(class.redirect_ipv4_nexthop1_vrf, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_nexthop1_vrf, null)
          redirect_ipv4_nexthop2_address          = try(class.redirect_ipv4_nexthop2_address, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_nexthop2_address, null)
          redirect_ipv4_nexthop2_vrf              = try(class.redirect_ipv4_nexthop2_vrf, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_nexthop2_vrf, null)
          redirect_ipv4_nexthop3_address          = try(class.redirect_ipv4_nexthop3_address, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_nexthop3_address, null)
          redirect_ipv4_nexthop3_vrf              = try(class.redirect_ipv4_nexthop3_vrf, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv4_nexthop3_vrf, null)
          redirect_ipv6_default_route             = try(class.redirect_ipv6_default_route, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_default_route, null)
          redirect_ipv6_nexthop1_address          = try(class.redirect_ipv6_nexthop1_address, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_nexthop1_address, null)
          redirect_ipv6_nexthop1_vrf              = try(class.redirect_ipv6_nexthop1_vrf, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_nexthop1_vrf, null)
          redirect_ipv6_nexthop2_address          = try(class.redirect_ipv6_nexthop2_address, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_nexthop2_address, null)
          redirect_ipv6_nexthop2_vrf              = try(class.redirect_ipv6_nexthop2_vrf, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_nexthop2_vrf, null)
          redirect_ipv6_nexthop3_address          = try(class.redirect_ipv6_nexthop3_address, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_nexthop3_address, null)
          redirect_ipv6_nexthop3_vrf              = try(class.redirect_ipv6_nexthop3_vrf, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_ipv6_nexthop3_vrf, null)
          redirect_nexthop_route_target_as_format = try(class.redirect_nexthop_route_target_as_format, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.redirect_nexthop_route_target_as_format, null)
          set_dscp                                = try(class.set_dscp, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.set_dscp, null)
          set_forward_class                       = try(class.set_forward_class, local.defaults.iosxr.devices.configuration.policy_map_pbr.classes.set_forward_class, null)
        }]
      }
    ]
  ])
}

resource "iosxr_policy_map_pbr" "policy_map_pbr" {
  for_each        = { for policy_map in local.policy_map_pbr : policy_map.key => policy_map }
  device          = each.value.device_name
  policy_map_name = each.value.policy_map_name
  description     = each.value.description
  classes         = each.value.classes
}
