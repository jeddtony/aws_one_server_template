#!/bin/bash
# User data script for EC2 instance

# Update system packages
apt-get update -y
apt-get upgrade -y

# Install Apache web server
apt-get install -y apache2

# Start Apache and enable it to start on boot
systemctl start apache2
systemctl enable apache2

# Create a simple index.html file
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Hello from Terraform</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hello, World!</h1>
        <p>This web server was deployed using Terraform.</p>
        <p>Instance ID: $(curl -s http://169.254.169.254/latest/meta-data/instance-id)</p>
        <p>Availability Zone: $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</p>
    </div>
</body>
</html>
EOF

# Set appropriate permissions
chmod 644 /var/www/html/index.html

echo "Web server setup complete!"
