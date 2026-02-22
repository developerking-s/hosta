#!/bin/bash

# Hosta Cloud - Startup Script
# This script sets up and runs both frontend and backend servers

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  🚀 Hosta Cloud - Server Startup       ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}✗ Node.js is not installed${NC}"
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

echo -e "${GREEN}✓ Node.js version: $(node --version)${NC}"

# Create .env files if they don't exist
if [ ! -f "server/.env" ]; then
    echo -e "${YELLOW}Creating server/.env from example...${NC}"
    cp server/.env.example server/.env
    echo -e "${GREEN}✓ Created server/.env${NC}"
fi

if [ ! -f ".env.local" ]; then
    echo -e "${YELLOW}Creating .env.local from example...${NC}"
    cp .env.local.example .env.local
    echo -e "${GREEN}✓ Created .env.local${NC}"
fi

# Install dependencies
if [ ! -d "node_modules" ]; then
    echo -e "${YELLOW}Installing frontend dependencies...${NC}"
    npm install
    echo -e "${GREEN}✓ Frontend dependencies installed${NC}"
fi

if [ ! -d "server/node_modules" ]; then
    echo -e "${YELLOW}Installing backend dependencies...${NC}"
    cd server
    npm install
    cd ..
    echo -e "${GREEN}✓ Backend dependencies installed${NC}"
fi

# Start servers in parallel
echo -e "${YELLOW}Starting servers...${NC}"
echo ""

# Start backend
echo -e "${YELLOW}Starting Backend API (port 5000)...${NC}"
cd server
npm run dev &
BACKEND_PID=$!
cd ..

# Wait a moment for backend to start
sleep 2

# Start frontend
echo -e "${YELLOW}Starting Frontend (port 5173)...${NC}"
npm run dev &
FRONTEND_PID=$!

echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  🎉 All services are running!         ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "  🌐 Frontend:  ${GREEN}http://localhost:5173${NC}"
echo -e "  🔌 Backend:   ${GREEN}http://localhost:5000${NC}"
echo -e "  📊 Panel:     ${GREEN}http://localhost:5173/pterodactyl${NC}"
echo ""
echo -e "${YELLOW}Press Ctrl+C to stop all services${NC}"
echo ""

# Wait for both processes
wait $BACKEND_PID $FRONTEND_PID
