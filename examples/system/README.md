<!-- BEGIN_TF_DOCS -->
# IOS-XR Hostname Configuration Example

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

#### `system.nac.yaml`

```yaml
iosxr:
  devices:
    - name: router-1
      host: 10.122.20.77:2627
      configuration:
        hostname: router-1
        l2vpn_bridge_group:
          - group_name: BG123

```

#### `main.tf`

```hcl
module "iosxr" {
  source = "../.."

  yaml_files = ["system.nac.yaml"]
}
```
<!-- END_TF_DOCS -->