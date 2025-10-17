#!/bin/bash

# Generate self-signed SSL certificate for development
# For production, use Let's Encrypt or a proper CA

echo "Generating self-signed SSL certificate..."

# Generate private key
openssl genrsa -out key.pem 2048

# Generate certificate
openssl req -new -x509 -key key.pem -out cert.pem -days 365 -subj "/C=US/ST=State/L=City/O=xyra.ai/CN=xyra.ai"

echo "SSL certificate generated successfully!"
echo "Files created:"
echo "  - ssl/key.pem (private key)"
echo "  - ssl/cert.pem (certificate)"
echo ""
echo "Note: This is a self-signed certificate for development only."
echo "For production, use Let's Encrypt or a proper certificate authority."
