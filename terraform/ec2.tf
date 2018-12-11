
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
