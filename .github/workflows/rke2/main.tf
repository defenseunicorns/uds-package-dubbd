provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
  }
}

module "rke2" {
  source  = "github.com/rancherfederal/rke2-aws-tf?ref=v2.3.3"
  cluster_name    = var.name
  vpc_id  = var.vpc_id
  subnets = var.subnets
  ami     = var.ami
  servers       = 3
  instance_type = "m5.2xlarge"
  tags = {
    name = var.name
  }
  block_device_mappings = {
    size = 100
    encrypted = true
    type = "gp3"
  }
  enable_ccm = true
  iam_permissions_boundary = var.iam_permissions_boundary

  rke2_version = "v1.26.6+rke2r1"
  rke2_config = <<-EOF
disable:
  - rke2-ingress-nginx
EOF
  controlplane_internal = var.controlplane_internal
  associate_public_ip_address = var.associate_public_ip_address

  pre_userdata = <<EOF
sudo sh -c '
  iptables -A INPUT -p tcp -m tcp --dport 2379 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 2380 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 9345 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 6443 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p udp -m udp --dport 8472 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 10250 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 30000:32767 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 4240 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 179 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p udp -m udp --dport 4789 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 5473 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 9098 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p tcp -m tcp --dport 9099 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p udp -m udp --dport 51820 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p udp -m udp --dport 51821 -m state --state NEW -j ACCEPT
  iptables -A INPUT -p icmp --icmp-type 8 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
  iptables -A OUTPUT -p icmp --icmp-type 0 -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables-save

  echo "* soft nofile 13181250" >> /etc/security/limits.d/ulimits.conf
  echo "* hard nofile 13181250" >> /etc/security/limits.d/ulimits.conf
  echo "* soft nproc  13181250" >> /etc/security/limits.d/ulimits.conf
  echo "* hard nproc  13181250" >> /etc/security/limits.d/ulimits.conf

  sysctl -w vm.max_map_count=524288
  echo "vm.max_map_count=524288" > /etc/sysctl.d/vm-max_map_count.conf

  sysctl -w fs.nr_open=13181252
  echo "fs.nr_open=13181252" > /etc/sysctl.d/fs-nr_open.conf

  sysctl -w fs.file-max=13181250
  echo "fs.file-max=13181250" > /etc/sysctl.d/fs-file-max.conf

  echo "fs.inotify.max_user_instances=1024" > /etc/sysctl.d/fs-inotify-max_user_instances.conf
  sysctl -w fs.inotify.max_user_instances=1024

  echo "fs.inotify.max_user_watches=1048576" > /etc/sysctl.d/fs-inotify-max_user_watches.conf
  sysctl -w fs.inotify.max_user_watches=1048576

  echo "vm.overcommit_memory=1" >> /etc/sysctl.d/90-kubelet.conf
  sysctl -w vm.overcommit_memory=1
  echo "kernel.panic=10" >> /etc/sysctl.d/90-kubelet.conf
  sysctl -w kernel.panic=10
  echo "kernel.panic_on_oops=1" >> /etc/sysctl.d/90-kubelet.conf
  sysctl -w kernel.panic_on_oops=1

  sysctl -p

  modprobe br_netfilter
  modprobe xt_REDIRECT
  modprobe xt_owner
  modprobe xt_statistic
'
EOF
}

resource "null_resource" "kubeconfig" {
  depends_on = [module.rke2]

  provisioner "local-exec" {
    interpreter = ["bash", "-c"]
    command     = "aws s3 cp ${module.rke2.kubeconfig_path} ~/.kube/config"
  }
}
