# MyNotes Service (API)

## Prerequisites
* Scripts only tested on Fedora 32 (5.6.18-300.fc32.x86_64)
* Docker version > 19.03.9
* GNU Make > 4.2.1
* Must have a eks infra installed with https://github.com/Idea-Cloud/eks-infra

## Quick install and setup for impatient people
```bash
export PROD_AWS_ACCESS_KEY_ID=<aws_access_key_id> \
PROD_AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> \
PROD_AWS_DEFAULT_REGION=<aws_default_region> \
PROD_AWS_ECR=<aws_ecr> \
TARGET_ENV=prod; \
make install && make build-docker-image && make login-to-ecr && make push-docker-image && AUTO_APPROVE=1 make apply
```

## Install (build image with deps)
```bash
make install
```

## Build image and push it to ECR
```bash
PROD_AWS_ACCESS_KEY_ID=<aws_access_key_id> \
PROD_AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> \
PROD_AWS_DEFAULT_REGION=<aws_default_region> \
PROD_AWS_ECR=<aws_ecr> \
TARGET_ENV=prod; \
make build-docker-image && make login-to-ecr && make push-docker-image
```

## Apply
```bash
PROD_AWS_ACCESS_KEY_ID=<aws_access_key_id> PROD_AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> PROD_AWS_DEFAULT_REGION=<aws_default_region> TARGET_ENV=prod make apply
```

## Plan
```bash
PROD_AWS_ACCESS_KEY_ID=<aws_access_key_id> PROD_AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> PROD_AWS_DEFAULT_REGION=<aws_default_region> TARGET_ENV=prod make plan
```

## Destroy (remove s3 bucket too)
```bash
PROD_AWS_ACCESS_KEY_ID=<aws_access_key_id> PROD_AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> PROD_AWS_DEFAULT_REGION=<aws_default_region> TARGET_ENV=prod make destroy
```

## Uninstall (remove image)
```bash
PROD_AWS_ACCESS_KEY_ID=<aws_access_key_id> PROD_AWS_SECRET_ACCESS_KEY=<aws_secret_access_key> PROD_AWS_DEFAULT_REGION=<aws_default_region> TARGET_ENV=prod make uninstall
```

## Licence

```text
Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
