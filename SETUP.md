# Hosta Cloud API - Setup Guide

## Project Structure

```
hosta-cloud-main/
├── server/                    # Backend API (Node.js/Express)
│   ├── src/
│   │   ├── index.ts          # Main server entry point
│   │   └── routes/
│   │       ├── pterodactyl.ts # Pterodactyl panel integration
│   │       ├── vps.ts        # VPS provider integration
│   │       └── health.ts     # Health check endpoint
│   ├── package.json
│   ├── tsconfig.json
│   └── .env.example
│
└── src/                       # Frontend (React + Vite)
    ├── components/
    │   ├── PanelManager.tsx   # Pterodactyl panel management
    │   ├── ServerList.tsx     # List servers from panels
    │   ├── VPSProviderList.tsx # Available VPS providers
    │   └── ServerMonitoringDashboard.tsx # Real-time monitoring
    ├── services/
    │   ├── pterodactyl.ts     # Pterodactyl API client
    │   └── vps.ts             # VPS provider API client
    └── pages/
        └── PterodactylPanel.tsx # Main control panel page
```

## Installation & Setup

### Prerequisites
- Node.js 16+ (for both frontend and backend)
- npm or bun package manager
- A Pterodactyl panel (or access to a public one)

### Backend Setup

1. Navigate to the server directory:
```bash
cd server
```

2. Install dependencies:
```bash
npm install
```

3. Create `.env` file:
```bash
cp .env.example .env
```

4. Configure the `.env` file:
```env
PORT=5000
NODE_ENV=development
CORS_ORIGIN=http://localhost:5173
PTERODACTYL_INSTANCES=https://panel.pterodactyl.io
```

5. Start the development server:
```bash
npm run dev
```

The API will be available at `http://localhost:5000`

### Frontend Setup

1. Navigate to the project root:
```bash
cd ..
```

2. Install dependencies:
```bash
npm install
# or
bun install
```

3. Create `.env.local` file:
```bash
cp .env.local.example .env.local
```

4. Configure the `.env.local` file:
```env
VITE_API_URL=http://localhost:5000/api
VITE_SUPABASE_URL=your-supabase-url
VITE_SUPABASE_ANON_KEY=your-anon-key
```

5. Start the development server:
```bash
npm run dev
# or
bun run dev
```

The frontend will be available at `http://localhost:5173`

## Features

### 🚀 Pterodactyl Panel Integration
- **Easy Panel Addition**: Simply paste your Pterodactyl panel URL
- **No Authentication Required**: Access public panels without API keys
- **Server Management**: View all servers on connected panels
- **Resource Monitoring**: Track CPU, memory, and disk usage
- **Multi-panel Support**: Manage multiple panels simultaneously

### 💰 Free VPS Provider Integration
- **GratisVPS**: German free VPS hosting
- **VPSSFree**: Czech free VPS with unlimited duration
- **Oracle Cloud**: Always free tier resources
- **AWS Free Tier**: Free EC2 instances for 12 months
- **Google Cloud**: Free cloud resources

### 📊 Real-time Monitoring Dashboard
- Live resource usage monitoring
- CPU, Memory, and Disk tracking
- Server uptime information
- Multi-server overview

## API Routes

### Health Check
```
GET /api/health
```

### Pterodactyl Panels
```
POST   /api/pterodactyl/panels/add              # Add new panel
GET    /api/pterodactyl/panels                  # Get all panels
GET    /api/pterodactyl/panels/:instanceId/status
GET    /api/pterodactyl/panels/:instanceId/servers
GET    /api/pterodactyl/panels/:instanceId/servers/:serverId
GET    /api/pterodactyl/panels/:instanceId/servers/:serverId/resources
DELETE /api/pterodactyl/panels/:instanceId     # Remove panel
```

### VPS Providers
```
GET /api/vps/providers                         # Get all providers
GET /api/vps/providers/gratisvps              # GratisVPS details
GET /api/vps/providers/vpsfree                # VPSFree details
GET /api/vps/monitoring/example               # Mock monitoring data
```

## Accessing the Control Panel

1. Start both the frontend and backend servers
2. Navigate to `http://localhost:5173/pterodactyl`
3. Add your first Pterodactyl panel:
   - Enter the panel URL (e.g., `https://panel.pterodactyl.io`)
   - Optionally add a custom name
   - Click "Add Panel"
4. Once added, you can:
   - View panel status
   - List all servers
   - Monitor server resources
   - Browse free VPS providers

## Important Security Notes

⚠️ **This setup connects to public Pterodactyl panels without authentication**
- Only use with public panels or panels you own
- Do not expose the API URL publicly
- Consider adding authentication in production

## Troubleshooting

### CORS Errors
- Ensure both frontend and backend are running
- Check `CORS_ORIGIN` in server `.env` matches your frontend URL
- Verify `VITE_API_URL` in frontend `.env.local` is correct

### Panel Connection Issues
- Verify the panel URL is correct and accessible
- Check if the panel allows public API access
- Test the URL in your browser first

### Build Issues
- Clear cache: `rm -rf node_modules && npm install`
- Check Node version: `node --version` (should be 16+)
- Verify all environment variables are set

## Production Deployment

### Backend
```bash
npm run build
npm run start
```

### Frontend
```bash
npm run build
```

The frontend build output will be in the `dist/` directory.

## Development Notes

- The Pterodactyl service uses dynamic imports to avoid circular dependencies
- The VPS provider data is cached to reduce API calls
- Real-time monitoring uses a 30-second refresh interval by default
- All API responses follow a consistent format with `success` flag and error handling

## Next Steps

1. Configure your Pterodactyl instances
2. Add free VPS provider credentials if needed
3. Set up monitoring alerts (optional)
4. Deploy to production (see Production Deployment section)

## Support

For issues or questions:
1. Check the API logs in the terminal
2. Review browser console for frontend errors
3. Verify environment configuration
4. Check network tab in browser DevTools

---

**Hosta Cloud** - Your Complete Server Management Solution
