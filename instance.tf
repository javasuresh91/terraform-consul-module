resource "aws_instance" "my_module_way_of_instnce" {
    ami = "${var.myami}"
    instance_type = "${var.instance}"
    key_name = "${var.my_key_name}"
    provisioner "file" {
        source = "dummy.sh"
        destination = "/tmp/custom.sh"
    }

    connection {
        user = "${var.myuser}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    }
}

ouput "server-address" {
    output = "${aws_instance.my_module_way_of_instnce.private_ip}"
}