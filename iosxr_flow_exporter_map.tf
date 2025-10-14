locals {
  device_flow_exporter_maps = flatten([
    for device in local.devices : [
      for flow_exporter_map in try(local.device_config[device.name].flow_exporter_map, []) : {
        device_name                             = device.name
        key                                     = "${device.name}-${flow_exporter_map.name}"
        name                                    = try(flow_exporter_map.name, local.defaults.iosxr.configuration.flow_exporter_map.name, null)
        destination_ipv4_address                = try(flow_exporter_map.destination_ipv4_address, local.defaults.iosxr.configuration.flow_exporter_map.destination_ipv4_address, null)
        destination_ipv6_address                = try(flow_exporter_map.destination_ipv6_address, local.defaults.iosxr.configuration.flow_exporter_map.destination_ipv6_address, null)
        destination_vrf                         = try(flow_exporter_map.destination_vrf, local.defaults.iosxr.configuration.flow_exporter_map.destination_vrf, null)
        source                                  = try(flow_exporter_map.source, local.defaults.iosxr.configuration.flow_exporter_map.source, null)
        dscp                                    = try(flow_exporter_map.dscp, local.defaults.iosxr.configuration.flow_exporter_map.dscp, null)
        packet_length                           = try(flow_exporter_map.packet_length, local.defaults.iosxr.configuration.flow_exporter_map.packet_length, null)
        transport_udp                           = try(flow_exporter_map.transport_udp, local.defaults.iosxr.configuration.flow_exporter_map.transport_udp, null)
        dfbit_set                               = try(flow_exporter_map.dfbit_set, local.defaults.iosxr.configuration.flow_exporter_map.dfbit_set, null)
        version_export_format                   = try(flow_exporter_map.version_export_format, local.defaults.iosxr.configuration.flow_exporter_map.version_export_format, null)
        version_template_data_timeout           = try(flow_exporter_map.version_template_data_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_template_data_timeout, null)
        version_template_options_timeout        = try(flow_exporter_map.version_template_options_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_template_options_timeout, null)
        version_template_timeout                = try(flow_exporter_map.version_template_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_template_timeout, null)
        version_options_interface_table_timeout = try(flow_exporter_map.version_options_interface_table_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_options_interface_table_timeout, null)
        version_options_sampler_table_timeout   = try(flow_exporter_map.version_options_sampler_table_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_options_sampler_table_timeout, null)
        version_options_class_table_timeout     = try(flow_exporter_map.version_options_class_table_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_options_class_table_timeout, null)
        version_options_vrf_table_timeout       = try(flow_exporter_map.version_options_vrf_table_timeout, local.defaults.iosxr.configuration.flow_exporter_map.version_options_vrf_table_timeout, null)
      }
    ]
    if try(local.device_config[device.name].flow_exporter_map, null) != null
  ])
}

resource "iosxr_flow_exporter_map" "flow_exporter_map" {
  for_each = { for flow_exporter_map in local.device_flow_exporter_maps : flow_exporter_map.key => flow_exporter_map }

  device                                  = each.value.device_name
  name                                    = each.value.name
  destination_ipv4_address                = each.value.destination_ipv4_address
  destination_ipv6_address                = each.value.destination_ipv6_address
  destination_vrf                         = each.value.destination_vrf
  source                                  = each.value.source
  dscp                                    = each.value.dscp
  packet_length                           = each.value.packet_length
  transport_udp                           = each.value.transport_udp
  dfbit_set                               = each.value.dfbit_set
  version_export_format                   = each.value.version_export_format
  version_template_data_timeout           = each.value.version_template_data_timeout
  version_template_options_timeout        = each.value.version_template_options_timeout
  version_template_timeout                = each.value.version_template_timeout
  version_options_interface_table_timeout = each.value.version_options_interface_table_timeout
  version_options_sampler_table_timeout   = each.value.version_options_sampler_table_timeout
  version_options_class_table_timeout     = each.value.version_options_class_table_timeout
  version_options_vrf_table_timeout       = each.value.version_options_vrf_table_timeout
}
