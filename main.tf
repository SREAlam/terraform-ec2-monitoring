resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  availability_zone = "us-east-1a" # Change to your desired AZ

  monitoring = true # Enable detailed monitoring

  tags = var.instance_tags
}

# SNS Topic for Notifications
resource "aws_sns_topic" "cpu_alerts" {
  name = "cpu-alerts-topic"
}

# SNS Email Subscription
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.cpu_alerts.arn
  protocol  = "email"
  endpoint  = "alamzaibahmad615@gmail.com" # Replace with your email
}

# CloudWatch Alarm for High CPU Utilization
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80 # Trigger alarm if CPU utilization exceeds 80%
  alarm_description   = "This alarm triggers if CPU utilization exceeds 80% for 2 minutes."
  actions_enabled     = true

  dimensions = {
    InstanceId = aws_instance.example.id
  }

  alarm_actions = [aws_sns_topic.cpu_alerts.arn]
}
