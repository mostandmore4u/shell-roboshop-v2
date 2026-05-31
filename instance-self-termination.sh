# 1. Fetch a secure metadata token
TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

# 2. Extract this specific instance's ID
INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)

# 3. Execute the self-termination command
aws ec2 terminate-instances --instance-ids $INSTANCE_ID --region us-east-1