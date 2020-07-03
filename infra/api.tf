################################################################################
# This file is part of the "mynotes-svc" project.
#
# Copyright (C) 2020 - Gamaliel SICK, IDEACLOUD.
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
################################################################################

resource "null_resource" "create-kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${data.terraform_remote_state.eks.outputs.cluster_name}"
  }
}

locals {
  api-controller-content = templatefile("${path.module}/api-controller.json.tmpl", {
    api_image   = var.api_image,
    api_port    = var.api_port,
    redis_image = var.redis_image,
    redis_port  = var.redis_port,
    redis_host  = var.redis_host
  })
  api-service-content = templatefile("${path.module}/api-service.json.tmpl", {})
}

resource "null_resource" "apply-api-controller" {
  triggers = {
    trig = local.api-controller-content
  }

  provisioner "local-exec" {
    command = "cat <<EOF | kubectl apply -f -\n${local.api-controller-content} \nEOF"
  }

  #  provisioner "local-exec" {
  #    when    = destroy
  #    command = "cat <<EOF | kubectl delete -f -\n${local.api-controller-content} \nEOF"
  #  }

  depends_on = [
    null_resource.create-kubeconfig
  ]
}

resource "null_resource" "apply-api-service" {
  triggers = {
    trig = local.api-service-content
  }

  provisioner "local-exec" {
    command = "cat <<EOF | kubectl apply -f -\n${local.api-service-content} \nEOF"
  }

  #  provisioner "local-exec" {
  #    when    = destroy
  #    command = "cat <<EOF | kubectl delete -f -\n${local.api-service-content} \nEOF"
  #  }

  depends_on = [
    null_resource.apply-api-controller
  ]
}
