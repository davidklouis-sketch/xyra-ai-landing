# xyra.ai Landing Page

A modern, responsive landing page for xyra.ai - an AI automation platform featuring green and black colors, containerized with Docker and configured for ports 80 and 443.

## Features

- 🎨 Modern AI-themed design with green and black color scheme
- 📱 Fully responsive design
- 🚀 Smooth animations and interactions
- 🔒 SSL/HTTPS support
- 🐳 Docker containerization
- ⚡ Nginx web server with optimized configuration
- 🎯 SEO-friendly structure

## Quick Start

### Prerequisites

- Docker and Docker Compose installed
- OpenSSL (for SSL certificate generation)

### 1. Generate SSL Certificate

For development, generate a self-signed certificate:

```bash
cd ssl
./generate-ssl.sh
```

For production, replace the certificate files with proper SSL certificates from Let's Encrypt or a certificate authority.

### 2. Build and Run with Docker Compose

```bash
# Build and start the container
docker-compose up --build

# Or run in detached mode
docker-compose up --build -d
```

### 3. Access the Website

- HTTP: http://localhost (redirects to HTTPS)
- HTTPS: https://localhost
- Production: https://xyra.ai

## Manual Docker Build

If you prefer to build manually:

```bash
# Build the Docker image
docker build -t ai-landing-page .

# Run the container
docker run -d \
  --name ai-landing-page \
  -p 80:80 \
  -p 443:443 \
  -v $(pwd)/ssl/cert.pem:/etc/nginx/ssl/cert.pem:ro \
  -v $(pwd)/ssl/key.pem:/etc/nginx/ssl/key.pem:ro \
  ai-landing-page
```

## File Structure

```
xyra-ai-landing/
├── index.html          # Main HTML file
├── styles.css          # CSS styles
├── script.js           # JavaScript functionality
├── Dockerfile          # Docker configuration
├── nginx.conf          # Nginx configuration
├── docker-compose.yml  # Docker Compose configuration
├── ssl/                # SSL certificates directory
│   ├── generate-ssl.sh # SSL generation script
│   ├── cert.pem        # SSL certificate
│   └── key.pem         # SSL private key
├── logs/               # Nginx logs directory
└── README.md           # This file
```

## Customization

### Colors

The color scheme is defined in CSS variables in `styles.css`:

```css
:root {
    --primary-green: #00ff88;
    --secondary-green: #00cc6a;
    --dark-green: #00a855;
    --black: #000000;
    --dark-gray: #111111;
    /* ... more variables */
}
```

### Content

Edit the following files to customize content:

- `index.html` - Update text, links, and structure
- `styles.css` - Modify colors, fonts, and layout
- `script.js` - Add or modify interactive features

## Production Deployment

### SSL Certificates

For production, replace the self-signed certificates with proper SSL certificates:

1. **Let's Encrypt (Recommended)**:
   ```bash
   # Install certbot
   sudo apt-get install certbot
   
   # Generate certificate
   sudo certbot certonly --standalone -d xyra.ai
   
   # Copy certificates
   sudo cp /etc/letsencrypt/live/xyra.ai/fullchain.pem ssl/cert.pem
   sudo cp /etc/letsencrypt/live/xyra.ai/privkey.pem ssl/key.pem
   ```

2. **Commercial Certificate**: Replace the certificate files with your commercial SSL certificate.

### Environment Variables

Update the `docker-compose.yml` file with your domain:

```yaml
environment:
  - DOMAIN=xyra.ai
```

### Security Considerations

- The nginx configuration includes security headers
- SSL/TLS is properly configured
- Hidden files and backup files are blocked
- Gzip compression is enabled for better performance

## Troubleshooting

### SSL Certificate Issues

If you encounter SSL certificate warnings:

1. For development: Accept the self-signed certificate in your browser
2. For production: Ensure you have valid SSL certificates

### Port Conflicts

If ports 80 or 443 are already in use:

1. Stop the conflicting service
2. Or modify the port mapping in `docker-compose.yml`:
   ```yaml
   ports:
     - "8080:80"
     - "8443:443"
   ```

### Container Issues

```bash
# Check container logs
docker-compose logs

# Restart the container
docker-compose restart

# Rebuild the container
docker-compose up --build
```

## License

This project is open source and available under the MIT License.
