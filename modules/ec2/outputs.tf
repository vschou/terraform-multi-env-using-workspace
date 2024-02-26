output "website_inst_ip" {
  value = aws_instance.website-inst.id
}
output "website_inst_name" {
  value = aws_instance.website-inst.tags
}
output "api_inst_ip" {
  value = aws_instance.api-inst.id
}
output "api_inst_name" {
  value = aws_instance.api-inst.tags
}