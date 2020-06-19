resource "aws_key_pair" "deployer2" {
  key_name   = "deployer2-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_instance" "web2" {
  ami           = "${data.aws_ami.centos.id}"
  key_name      = "${aws_key_pair.deployer2.key_name}"
  instance_type = "t2.micro"
  provisioner   "remote-exec" {
    connection {
        host        = "${self.public_ip}"
        type        = "ssh"
        user        = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "sudo yum install -y epel-release -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  },
   provisioner   "file" {
    connection {
        host        = "${self.public_ip}"
        type        = "ssh"
        user        = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    source = "testfile"
    destination = "/tmp/testfile"
   }
}