locals {
  device_l2vpn_bridge_groups = flatten([
    for device in local.devices : [
      for bridge_group in try(local.device_config[device.name].l2vpn_bridge_group, []) : {
        device_name = device.name
        group_name  = try(bridge_group.group_name, local.defaults.iosxr.configuration.l2vpn_bridge_group_group_name, null)
        delete_mode = try(bridge_group.delete_mode, local.defaults.iosxr.configuration.l2vpn_bridge_group_delete_mode, null)
        key         = try("${device.name}-${bridge_group.group_name}", null)
      }
      if try(bridge_group.group_name, local.defaults.iosxr.configuration.l2vpn_bridge_group_group_name, null) != null
    ]
  ])
}

resource "iosxr_l2vpn_bridge_group" "l2vpn_bridge_group" {
  for_each = { for bridge_group in local.device_l2vpn_bridge_groups : bridge_group.key => bridge_group }

  device      = each.value.device_name
  group_name  = each.value.group_name
  delete_mode = each.value.delete_mode
}