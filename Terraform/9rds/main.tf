resource "aws_db_instance" "database" {
  name = "mydb"
  identifier = "my-database"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.mciro"
  availability_zone = "us-east-2a"
  allocated_storage = 5
  storage_type = "standard"
  storage_encrypted = true
  username = "admin"
  password = "Test1234"
  apply_immediately = true
  skip_final_snapshot = true
  tags = {
    name = "mydb"
    identifier = "my-database"
    engine = "mysql"
  }

}