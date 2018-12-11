data "template_file" "inventory" {
    template = "${file("${path.module}/templates/inventory.tpl")}"

    vars {
        connection_strings_master = "${join("\n",formatlist("%s ansible_host=%s",aws_instance.kube-master.*.tags.Name, aws_instance.kube-master.*.private_ip))}"
        connection_strings_node = "${join("\n", formatlist("%s ansible_host=%s", aws_instance.kube-node.*.tags.Name, aws_instance.kube-node.*.private_ip))}"
        connection_strings_etcd = "${join("\n",formatlist("%s ansible_host=%s", aws_instance.kube-etcd.*.tags.Name, aws_instance.kube-etcd.*.private_ip))}"
        list_master = "${join("\n",aws_instance.kube-master.*.tags.Name)}"
        list_node = "${join("\n",aws_instance.kube-node.*.tags.Name)}"
        list_etcd = "${join("\n",aws_instance.kube-etcd.*.tags.Name)}"
    }

}

resource "null_resource" "inventories" {
  provisioner "local-exec" {
      command = "echo '${data.template_file.inventory.rendered}' > ${var.inventory_file}"
  }

  triggers {
      template = "${data.template_file.inventory.rendered}"
  }
}