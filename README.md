# terraform-provider-gpupaas (release mirror)

Release assets and documentation for the GPU PaaS Terraform/OpenTofu provider, published here to try the
OpenTofu registry listing. This repository holds no provider source code.

- Source: https://github.com/gpupaas-ai/terraform-provider-gpupaas
- Documentation: [`docs/`](docs/), examples: [`examples/`](examples/)
- Releases carry the platform zips, `_manifest.json`, `_SHA256SUMS` and the signed `_SHA256SUMS.sig`.

```hcl
terraform {
  required_providers {
    gpupaas = {
      source  = "sharan-rafay/gpupaas"
      version = "0.0.1-test.2"
    }
  }
}
```

Test releases only. Do not use for production.

License: Apache License 2.0, see [LICENSE](LICENSE).
