
output "masters" {
    value = "${join("\n", aws_instance.kube-master.*.private_ip)}"
}


output "masters_id" {
    value = "${join("\n", aws_instance.kube-master.*.id)}"
}

output "workers" {
    value = "${join("\n", aws_instance.kube-node.*.private_ip)}"
}

output "etcd" {
    value = "${join("\n", aws_instance.kube-etcd.*.private_ip)}"
}

output "inventory" {
    value = "${data.template_file.inventory.rendered}"
}