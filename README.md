# Docker yamllint

Docker image build for [yamllint](https://github.com/adrienverge/yamllint), using distroless as a base image. This image is meant to be used in a CI build step.

[![Docker hub](https://img.shields.io/docker/pulls/containerinfra/yamllint.svg)](https://hub.docker.com/r/containerinfra/yamllint/) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/containerinfra/yamllint/release)

## Table of Contents

- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Usage

### Images

- docker pull docker.io/containerinfra/yamllint:latest
- docker pull ghcr.io/containerinfra/yamllint:latest

### Verify image with cosign

All containerinfra/yamllint images are signed by [cosign](https://github.com/sigstore/cosign). You can verify these using `cosign verify`:

```bash
cat cosign.pub
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEYpxYmR6qpyer9WJHhSxd91XMx+A+
eQm/6XSWAMDGeH4hrFpvo8Sw0t+xf0PdRSUEXCyKFXve+Q2s8csVo4eAaA==
-----END PUBLIC KEY-----


cosign verify --key cosign.pub docker.io/containerinfra/yamllint:latest
cosign verify --key cosign.pub ghcr.io/containerinfra/yamllint:latest
```

### Configuration

See the [yamllint documentation](https://yamllint.readthedocs.io/en/stable/).

### Usage

In Gitlab CI
```yaml
yaml:lint:
  stage: lint
  image: ghcr.io/containerinfra/yamllint
  script:
    - yamllint mydirectory/ -c .yamllint.yml
```

## Automated build

This image is build at least once a month automatically.

## Contribute

PRs accepted. All issues should be reported in the [Github issue tracker](https://github.com/containerinfra/yamllint/issues).

## License

[MIT © ContainerInfra](LICENSE)
