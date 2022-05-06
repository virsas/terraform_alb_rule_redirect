provider "aws" {
  region = var.region
}

resource "aws_lb_listener_rule" "redirect" {
  listener_arn = var.listener

  action {
    type          = "redirect"

    redirect {
      port        = var.dstPort
      protocol    = var.dstProto
      host        = var.dstHost
      path        = var.dstPath
      query       = ""
      status_code = "HTTP_301"
    }
  }

  condition {
    host_header {
      values = [var.srcHost]
    }
  }
}
