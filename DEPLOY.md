# Hosta Cloud - Production Deployment Guide

## Overview
This guide covers deploying Hosta Cloud to production environments.

## Prerequisites
- Node.js 16+ and npm
- A VPS or cloud server (AWS, DigitalOcean, etc.)
- Domain name (optional but recommended)
- SSL certificate (recommended)

## Option 1: Traditional Deployment (Linux Server)

### 1. Server Setup
```bash
# Connect to your server
ssh user@your-server.com

# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Install PM2 (process manager)
sudo npm install -g pm2
```

### 2. Clone and Setup Project
```bash
# Clone repository
git clone https://github.com/your-username/hosta-cloud.git
cd hosta-cloud/hosta-cloud-main

# Install dependencies
npm install
cd server && npm install && cd ..
```

### 3. Configure Environment
```bash
# Frontend
cp .env.local.example .env.local
# Edit .env.local with production values:
# - VITE_API_URL=https://api.yourdomain.com (or your backend URL)

# Backend
cd server
cp .env.example .env
# Edit .env with production values:
# - PORT=5000
# - NODE_ENV=production
# - CORS_ORIGIN=https://yourdomain.com
cd ..
```

### 4. Build Frontend
```bash
npm run build
```

### 5. Setup PM2
```bash
# Create ecosystem config file
cat > ecosystem.config.js << 'EOF'
module.exports = {
  apps: [
    {
      name: "hosta-api",
      script: "./dist/index.js",
      cwd: "./server",
      instances: "max",
      exec_mode: "cluster",
      env: {
        NODE_ENV: "production",
        PORT: 5000
      }
    },
    {
      name: "hosta-frontend",
      script: "npm",
      args: "run preview",
      instances: 1,
      env: {
        NODE_ENV: "production"
      }
    }
  ]
};
EOF

# Start with PM2
pm2 start ecosystem.config.js
pm2 save
pm2 startup
```

### 6. Setup Nginx Reverse Proxy
```bash
sudo apt install -y nginx

# Create Nginx config
sudo tee /etc/nginx/sites-available/hosta << 'EOF'
upstream backend {
    server localhost:5000;
}

upstream frontend {
    server localhost:3000;
}

server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    # Redirect to HTTPS
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name yourdomain.com www.yourdomain.com;

    ssl_certificate /path/to/your/certificate.crt;
    ssl_certificate_key /path/to/your/key.key;

    # API routes
    location /api/ {
        proxy_pass http://backend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    # Frontend
    location / {
        proxy_pass http://frontend;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
EOF

# Enable the site
sudo ln -s /etc/nginx/sites-available/hosta /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

### 7. Setup SSL with Let's Encrypt
```bash
sudo apt install -y certbot python3-certbot-nginx
sudo certbot certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

## Option 2: Docker Deployment

### 1. Setup Docker
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### 2. Create Production Compose File
```yaml
# docker-compose.prod.yaml
version: '3.8'

services:
  backend:
    build:
      context: ./server
      dockerfile: ../Dockerfile.backend
    environment:
      NODE_ENV: production
      PORT: 5000
      CORS_ORIGIN: https://yourdomain.com
    restart: always
    networks:
      - hosta-network

  frontend:
    build:
      context: .
      dockerfile: Dockerfile.frontend
      args:
        VITE_API_URL: https://yourdomain.com/api
    environment:
      NODE_ENV: production
    restart: always
    networks:
      - hosta-network

  nginx:
    image: nginx:alpine
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
      - ./ssl:/etc/nginx/ssl:ro
    depends_on:
      - backend
      - frontend
    restart: always
    networks:
      - hosta-network

networks:
  hosta-network:
    driver: bridge
```

### 3. Deploy
```bash
docker-compose -f docker-compose.prod.yaml up -d
```

## Option 3: Cloud Platforms

### Heroku
```bash
# Login
heroku login

# Create app
heroku create hosta-cloud

# Set environment variables
heroku config:set NODE_ENV=production
heroku config:set VITE_API_URL=https://hosta-cloud.herokuapp.com/api

# Deploy
git push heroku main
```

### Vercel (Frontend Only)
```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel --prod
```

### Railway
```bash
# Install Railway CLI
npm i -g @railroad/cli

# Login and deploy
railway login
railway up
```

## Monitoring & Maintenance

### Log Management
```bash
# With PM2
pm2 logs

# With Docker
docker logs -f container_name

# With Nginx
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
```

### Backup Strategy
```bash
# Automatic daily backup
0 2 * * * /path/to/backup-script.sh
```

### Performance Optimization
- Enable compression (gzip, brotli)
- Setup CDN for static assets
- Configure caching headers
- Use Redis for session management

## Troubleshooting Production Issues

### High Memory Usage
```bash
# Check memory usage
free -h

# Restart PM2 app
pm2 restart all
```

### Connection Issues
```bash
# Check if ports are open
sudo lsof -i :5000
sudo lsof -i :80
sudo lsof -i :443

# Check Nginx status
sudo systemctl status nginx
```

### Database Connection Issues
```bash
# Verify Supabase connection
curl -H "Authorization: Bearer $SUPABASE_KEY" \
  "https://your-project.supabase.co/rest/v1/"
```

## Scaling Considerations

1. **Database**: Use Supabase's connection pooling
2. **Frontend**: Serve from CDN (Cloudflare, AWS CloudFront)
3. **Backend**: Use clustering with PM2 or Kubernetes
4. **Load Balancing**: Setup load balancer (Nginx, HAProxy, or cloud provider)

## Security Checklist

- [ ] Enable HTTPS/SSL
- [ ] Setup firewall rules
- [ ] Use environment variables for secrets
- [ ] Enable CORS correctly
- [ ] Setup rate limiting
- [ ] Regular security updates
- [ ] Monitor for vulnerabilities (npm audit)
- [ ] Setup backup strategy

---

**Need help?** Check the main SETUP.md or raise an issue on GitHub.
