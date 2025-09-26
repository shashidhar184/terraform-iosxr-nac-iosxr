locals {
  device_rd_sets = flatten([
    for device in local.devices : [
      for rd_set in try(local.device_config[device.name].rd_set, local.defaults.iosxr.configuration.rd_set, []) : {
        set_name = try(rd_set.set_name, local.defaults.iosxr.configuration.rd_set_name, null)
        rpl      = try(rd_set.rpl, local.defaults.iosxr.configuration.rd_set_rpl, null)
        key      = "${device.name}-rd_set-${rd_set.set_name}"
      }
      if try(rd_set.set_name, local.defaults.iosxr.configuration.rd_set_name, null) != null &&
      try(rd_set.rpl, local.defaults.iosxr.configuration.rd_set_rpl, null) != null
    ]
    if try(local.device_config[device.name].rd_set, null) != null || try(local.defaults.iosxr.configuration.rd_set, null) != null
  ])
}

resource "iosxr_rd_set" "rd_set" {
  for_each = { for rd_set in local.device_rd_sets : rd_set.key => rd_set }

  set_name = each.value.set_name
  rpl      = each.value.rpl
}