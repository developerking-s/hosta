# 🚀 Hosta Cloud - Server Management Platform

A complete, open-source platform for managing Pterodactyl game servers and free VPS providers. Built with React, Node.js, and modern web technologies.

## ✨ Features

### 🎮 Pterodactyl Integration
- **Easy Panel Connection**: Add Pterodactyl panels with just a URL (no API keys needed for public panels)
- **Multi-Panel Support**: Manage multiple Pterodactyl instances simultaneously
- **Server Management**: View and monitor all servers across panels
- **Real-time Resources**: Monitor CPU, memory, and disk usage
- **Live Monitoring**: Dashboard with real-time server statistics

### 💰 Free VPS Provider Support
- **GratisVPS**: Multi-location free VPS hosting
- **VPSFree**: Czech-based unlimited free VPS
- **Oracle Cloud**: Always-free tier resources
- **AWS Free Tier**: 12-month free EC2 instances
- **Google Cloud**: Free cloud resources
- **Quick Links**: One-click access to provider websites

### 📊 Comprehensive Dashboard
- Real-time monitoring across all servers
- Resource usage visualization
- Server status tracking
- Performance metrics
- Beautiful, responsive UI

### 🔐 Security First
- No hardcoded credentials
- Environment-based configuration
- CORS protection
- Rate limiting ready
- Production-ready deployment options

## 🛠️ Tech Stack

### Frontend
- **React 18** with TypeScript
- **Vite** for ultra-fast development
- **Tailwind CSS** for styling
- **shadcn/ui** for components
- **TanStack Query** for data fetching
- **Framer Motion** for animations

### Backend
- **Node.js** with Express.js
- **TypeScript** for type safety
- **Axios** for HTTP requests
- **Helmet** for security headers
- **CORS** for cross-origin requests

### Deployment
- **Docker** support with Docker Compose
- **PM2** for process management
- **Nginx** for reverse proxy
- **Let's Encrypt** for SSL

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ and npm
- Git
- (Optional) Docker and Docker Compose

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/hosta-cloud.git
cd hosta-cloud/hosta-cloud-main

# Run the startup script (recommended)
chmod +x start.sh
./start.sh

# Or manual setup:
# Frontend
cp .env.local.example .env.local
npm install
npm run dev

# Backend (in another terminal)
cd server
cp .env.example .env
npm install
npm run dev
```

### Access the Application
- **Frontend**: http://localhost:5173
- **Backend API**: http://localhost:5000
- **Control Panel**: http://localhost:5173/pterodactyl

## 📖 Documentation

- **[SETUP.md](./SETUP.md)** - Detailed setup guide
- **[DEPLOY.md](./DEPLOY.md)** - Production deployment guide
- **API Documentation**: Available at `/docs` endpoint

## 🏗️ Project Structure

```
hosta-cloud-main/
├── server/                             # Backend API
│   ├── src/
│   │   ├── index.ts                   # Entry point
│   │   └── routes/
│   │       ├── pterodactyl.ts         # Panel management
│   │       ├── vps.ts                 # VPS providers
│   │       └── health.ts              # Health check
│   ├── package.json
│   └── tsconfig.json
│
├── src/                                # Frontend
│   ├── components/
│   │   ├── PanelManager.tsx           # Add/manage panels
│   │   ├── ServerList.tsx             # Server listing
│   │   ├── VPSProviderList.tsx        # Provider listing
│   │   └── ServerMonitoringDashboard.tsx
│   ├── services/
│   │   ├── pterodactyl.ts             # API client
│   │   └── vps.ts                     # Provider client
│   └── pages/
│       └── PterodactylPanel.tsx       # Main panel
│
├── SETUP.md                            # Setup guide
├── DEPLOY.md                           # Deployment guide
├── docker-compose.yaml                # Docker setup
└── start.sh                            # Quick start script
```

## 🔌 API Routes

### Health Check
```
GET /api/health
```

### Pterodactyl Panels
```
POST   /api/pterodactyl/panels/add
GET    /api/pterodactyl/panels
GET    /api/pterodactyl/panels/:instanceId/status
GET    /api/pterodactyl/panels/:instanceId/servers
GET    /api/pterodactyl/panels/:instanceId/servers/:serverId
GET    /api/pterodactyl/panels/:instanceId/servers/:serverId/resources
DELETE /api/pterodactyl/panels/:instanceId
```

### VPS Providers
```
GET /api/vps/providers
GET /api/vps/providers/gratisvps
GET /api/vps/providers/vpsfree
GET /api/vps/monitoring/example
```

## 📦 Docker Deployment

```bash
# Run with Docker Compose
docker-compose up -d

# Access services
# Frontend: http://localhost:5173
# Backend: http://localhost:5000
```

## 🌐 Production Deployment

### Quick Deploy with Vercel (Frontend)
```bash
npm i -g vercel
vercel --prod
```

### Deploy with Docker
```bash
docker-compose -f docker-compose.prod.yaml up -d
```

See [DEPLOY.md](./DEPLOY.md) for detailed production deployment instructions.

## 🔒 Environment Configuration

### Frontend (.env.local)
```env
VITE_API_URL=http://localhost:5000/api
VITE_SUPABASE_URL=your-supabase-url
VITE_SUPABASE_ANON_KEY=your-anon-key
```

### Backend (server/.env)
```env
PORT=5000
NODE_ENV=development
CORS_ORIGIN=http://localhost:5173
PTERODACTYL_INSTANCES=https://panel.pterodactyl.io
```

## 🎯 Roadmap

- [ ] Authentication system integration
- [ ] Server console access
- [ ] Advanced resource management
- [ ] Alert notifications
- [ ] Backup management
- [ ] Database integration
- [ ] Advanced analytics
- [ ] Mobile app

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## ⚠️ Security Notes

- This application connects to public Pterodactyl panels without authentication
- Only use with panels you own or have permission to access
- Do not expose the API URL publicly without authentication
- Always use HTTPS in production
- Review security checklist in [DEPLOY.md](./DEPLOY.md)

## 📄 License

This project is open-source and available under the MIT License - see the LICENSE file for details.

## 🆘 Support & Troubleshooting

### Common Issues

1. **CORS Errors**
   - Verify `CORS_ORIGIN` matches your frontend URL
   - Check both frontend and backend are running

2. **Connection Refused**
   - Ensure backend is running on port 5000
   - Check firewall settings

3. **Panel not connecting**
   - Verify panel URL is correct
   - Test URL in browser first

For more help, see [SETUP.md](./SETUP.md) troubleshooting section.

## 📞 Contact & Social

- **Issues**: GitHub Issues
- **Discussions**: GitHub Discussions
- **Email**: support@hostacloud.com

---

**Made with ❤️ by the Hosta Cloud Team**

**Last Updated**: February 2026  
**Version**: 1.0.0
