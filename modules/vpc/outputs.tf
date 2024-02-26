output "vpc_id" {
  value = aws_vpc.my-vpc.id
}
output "pub_sub_1_id" {
    value = aws_subnet.pub-sub-1.id
}
output "pub_sub_2_id" {
  value = aws_subnet.pub-sub-2.id
}
output "pub_sub_3_id" {
  value = aws_subnet.pub-sub-3.id
}
output "pvt-sub-1-id" {
  value = aws_subnet.pvt-sub-1.id
}
output "pvt-sub-2-id" {
  value = aws_subnet.pvt-sub-2.id
}
output "pvt-sub-3-id" {
  value = aws_subnet.pvt-sub-3.id
}