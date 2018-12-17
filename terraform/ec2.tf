resource "aws_key_pair" "kube-deploy-kp" {
  key_name = "${var.aws_key_name}"
  public_key = "${file(var.public_key_path)}"
  
}

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


  provisioner "remote-exec" {
   inline = [ "sudo apt-get update",
              "sudo apt-get install -y software-properties-common python-pip"
            ]

   connection {
    host        = "${aws_instance.kube-master.public_ip}"
    type        = "ssh"
    user        = "ubuntu"
    agent       =  "false"
    private_key = "${file(var.ssh_key_private)}"
    }
  }

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


  provisioner "remote-exec" {
   inline = [ "sudo apt-get update",
              "sudo apt-get install -y software-properties-common python-pip"
            ]

   connection {
    host        = "${aws_instance.kube-node.public_ip}"
    type        = "ssh"
    user        = "ubuntu"
    agent       =  "false"
    private_key = "${file(var.ssh_key_private)}"
    }
  }
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


  provisioner "remote-exec" {
   inline = [ "sudo apt-get update",
              "sudo apt-get install -y software-properties-common python-pip"
            ]

   connection {
    host        = "${aws_instance.kube-etcd.public_ip}"
    type        = "ssh"
    user        = "ubuntu"
    agent       =  "false"
    private_key = "${file(var.ssh_key_private)}"
    }
  }
}
