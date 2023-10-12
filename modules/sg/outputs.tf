output "api_sg" {
  value = aws_security_group.api_sg.id
}


output "rds_db_sg" {
  value = aws_security_group.db_sg.id
}
