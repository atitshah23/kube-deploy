
#resource "aws_key_pair" "my_key_pair" {
#  key_name   = "${var.aws_key_name}"
#  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDdpQCEmLJN0qwsh7aV10ekWzeAcYRb3pNbh34XwvTtv0aUiuRxYOvw2Wp+nXq67W+i67A1IT467j0WxXu/wHdXPyxJgr9+BZ7PDfQ+9sjqkm7TjKtqbRa5/Jm4ZopaQ6LTb7wJH98Ks+GgzDrIfcwi0HFe0v7BVNqF++tvMMIU5+IEWjPIJYb93lgUnVVufh791jqa5MmfMNYRQlrhC0+VQ6FgzGC1101bOsp9PVdTaJ92g51MZtpE44oex9LYbu64cBT0dBuo/4vkzehUpN3cMq88khvND5bqjareWo512eitsEdijPYCI9dVGITdqg+whi0dud5Yg0udipxV5p0D root@User-VM"
#}

resource "aws_instance" "kube-master" {
  ami = "${var.aws_ami_id}"
  instance_type = "${var.aws_instance_type}"
  key_name = "${var.aws_key_name}"
  tags {
    Name = "kubernetes-${var.aws_cluster_name}-master",
    Role = "master"
  }
  count = 1
  vpc_security_group_ids = ["${var.aws_security_group_id}"]
}

resource "aws_instance" "kube-node" {
  ami = "${var.aws_ami_id}"
  instance_type = "${var.aws_instance_type}"
  key_name = "${var.aws_key_name}"
  tags {
    Name = "kubernetes-${var.aws_cluster_name}-node",
    Role = "woker"
  }
  count = 1
  vpc_security_group_ids = ["${var.aws_security_group_id}"]
}


resource "aws_instance" "kube-etcd" {
  ami = "${var.aws_ami_id}"
  instance_type = "${var.aws_instance_type}"
  key_name = "${var.aws_key_name}"
  tags {
    Name = "kubernetes-${var.aws_cluster_name}-etcd",
    Role = "etcd"
  }
  count = 1
  vpc_security_group_ids = ["${var.aws_security_group_id}"]
}
