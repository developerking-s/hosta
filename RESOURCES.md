# 📚 Referências e Recursos Externos

## Pterodactyl Panel

**Official Website**: https://pterodactyl.io/

### Documentação
- **API Docs**: https://pterodactyl.io/api/overview
- **User Documentation**: https://pterodactyl.io/user/index
- **Admin Documentation**: https://pterodactyl.io/guide/installation
- **Community Forum**: https://discord.gg/pterodactyl

### Painéis Públicos para Teste (caso existam)
- https://panel.pterodactyl.io
- https://demo.pterodactyl.io

### Instalação Própria
```bash
# Ubuntu/Debian
curl -L https://pterodactyl.io/installer.sh | sudo bash

# Via Docker
docker run -d \
  --name=pterodactyl-panel \
  -e DB_PASSWORD=panel_password \
  -p 80:80 \
  -p 443:443 \
  ghcr.io/pterodactyl/panel:latest
```

---

## Provedores VPS Gratuitos Suportados

### 1. GratisVPS (gratisvps.net)
**Website**: https://gratisvps.net/  
**Locações**: Alemanha, Japão, Brasil, EUA  
**Especificações**:
- 2 vCores
- 512MB - 2GB RAM
- 10GB - 30GB SSD
- Sem cartão de crédito
- IPv4 público

**Como registrar**:
1. Acesse https://gratisvps.net
2. Clique em "Admin Panel"
3. Crie uma conta
4. Selecione localização e tipo VPS
5. Aguarde provisioning (até 30min)

---

### 2. VPSFree (vpsfree.org)
**Website**: https://vpsfree.org/  
**Localização**: República Tcheca  
**Especificações**:
- 2-4 vCores
- 1GB - 4GB RAM
- 20GB - 100GB SSD
- Gratuito infinitamente
- Sem limite de largura de banda

**Como registrar**:
1. Acesse https://vpsfree.org
2. Crie uma conta
3. Faça login
4. Crie um novo VPS
5. Configure dados de início

---

### 3. Oracle Cloud (oracle.com/free)
**Website**: https://www.oracle.com/cloud/free/  
**Always Free Tier**:
- 2 vCores (Ampere A1)
- 12GB RAM
- 25GB SSD
- Para sempre

**Como registrar**:
1. Visite https://www.oracle.com/cloud/free
2. Clique "Start Free"
3. Crie Oracle Account
4. Complete verificação
5. Implante instância no OCI

---

### 4. AWS Free Tier (aws.amazon.com/free)
**Website**: https://aws.amazon.com/free/  
**12 Meses Grátis**:
- 1 instância t2.micro por mês
- 30GB EBS
- 2GB snapshots
- Limite: 750 horas/mês

**Como registrar**:
1. Acesse https://aws.amazon.com/free
2. Clique "Create a free account"
3. Complete registro
4. Verifique número de cartão (reembolso)
5. Lance EC2 instance

---

### 5. Google Cloud (cloud.google.com/free)
**Website**: https://cloud.google.com/free  
**Free Resources**:
- e2-micro (máquinas)
- 30GB SSD local
- 1GB armazenamento Cloud
- 5GB transferência para fora

**Como registrar**:
1. Visite https://cloud.google.com/free
2. Clique "Get started for free"
3. Vincule cartão de crédito
4. Use crédito $300 para experimentar
5. Crie VM no Google Cloud Console

---

## Tecnologias Relacionadas

### Gerenciadores de VPS
- **Proxmox**: https://www.proxmox.com
- **OpenStack**: https://www.openstack.org
- **VMware**: https://www.vmware.com
- **KVM**: https://www.linux-kvm.org

### Monitoramento
- **Grafana**: https://grafana.com
- **Prometheus**: https://prometheus.io
- **Zabbix**: https://www.zabbix.com
- **Datadog**: https://www.datadoghq.com

### Gerenciamento de Servidores
- **Ansible**: https://www.ansible.com
- **SaltStack**: https://saltproject.io
- **Chef**: https://www.chef.io
- **Puppet**: https://puppet.com

---

## Recursos e Documentação Técnica

### React & Vite
- **React Docs**: https://react.dev
- **Vite Docs**: https://vitejs.dev
- **TypeScript**: https://www.typescriptlang.org

### Frontend Libraries
- **Tailwind CSS**: https://tailwindcss.com
- **shadcn/ui**: https://ui.shadcn.com
- **Framer Motion**: https://www.framer.com/motion
- **Lucide Icons**: https://lucide.dev

### Backend
- **Node.js**: https://nodejs.org
- **Express.js**: https://expressjs.com
- **Axios**: https://axios-http.com
- **TypeScript**: https://www.typescriptlang.org

### Deployment
- **Docker**: https://www.docker.com
- **Docker Compose**: https://docs.docker.com/compose
- **Nginx**: https://nginx.org
- **PM2**: https://pm2.keymetrics.io

### Cloud Platforms
- **Heroku**: https://www.heroku.com
- **Vercel**: https://vercel.com
- **Railway**: https://railway.app
- **Render**: https://render.com
- **Replit**: https://replit.com

---

## Segurança e SSL

### Let's Encrypt
**Website**: https://letsencrypt.org  
**Certbot**: https://certbot.eff.org

```bash
# Instalar Certbot
sudo apt install certbot python3-certbot-nginx

# Gerar certificado
sudo certbot certonly --nginx -d seu-dominio.com

# Auto-renovar
sudo systemctl enable certbot.timer
```

### Ferramentas de Teste de Segurança
- **OWASP ZAP**: https://www.zaproxy.org
- **Burp Suite Community**: https://portswigger.net/burp
- **SSL Labs**: https://www.ssllabs.com
- **Security Headers**: https://securityheaders.com

---

## APIs e Integrações

### APIs Úteis
- **SendGrid** (Email): https://sendgrid.com
- **Stripe** (Pagamentos): https://stripe.com
- **Twilio** (SMS): https://www.twilio.com
- **Slack** (Notificações): https://api.slack.com

### Monitoramento de Status
- **Statuspage.io**: https://www.statuspage.io
- **Better Uptime**: https://betterstack.com

---

## Comunidades e Fóruns

### Pterodactyl
- **Discord**: https://discord.gg/pterodactyl
- **GitHub**: https://github.com/pterodactylmarket
- **Forum**: https://pterodactyl.io/community

### Comunidades de Desenvolvimento
- **Stack Overflow**: https://stackoverflow.com
- **GitHub Discussions**: https://github.com
- **Dev.to**: https://dev.to
- **Reddit**: https://reddit.com/r/webdev

### VPS & Hosting
- **Lowendtalk**: https://lowendtalk.com
- **Reddit /r/homelab**: https://reddit.com/r/homelab
- **Reddit /r/sysadmin**: https://reddit.com/r/sysadmin

---

## Certificações e Learning

### Node.js & Backend
- **Node.js Certified Developer**: https://certification.openjsf.org
- **Udemy Node.js Courses**: https://www.udemy.com

### React
- **React Documentation**: https://react.dev
- **Scrimba React Course**: https://scrimba.com

### DevOps
- **Linux Academy**: https://linuxacademy.com
- **A Cloud Guru**: https://acloudguru.com

---

## Ferramentas Úteis

### Desenvolvimento
- **VS Code**: https://code.visualstudio.com
- **Postman**: https://www.postman.com
- **Insomnia**: https://insomnia.rest
- **Git**: https://git-scm.com

### Gerenciamento de Projetos
- **GitHub**: https://github.com
- **GitLab**: https://gitlab.com
- **Jira**: https://www.atlassian.com/jira
- **Trello**: https://trello.com

### Performance
- **WebPageTest**: https://www.webpagetest.org
- **Google Lighthouse**: https://developers.google.com/web/tools/lighthouse
- **GTmetrix**: https://gtmetrix.com

---

## Scripts e Automação

### Bash/Shell
- **Awesome Bash**: https://github.com/awesome-lists/awesome-bash
- **ShellCheck**: https://www.shellcheck.net

### Python (para DevOps)
- **Ansible**: https://www.ansible.com
- **Paramiko**: http://www.paramiko.org

---

## Padrões e Best Practices

### Arquitetura
- **Clean Code**: https://www.oreilly.com/library/view/clean-code-a/9780136083238/
- **SOLID Principles**: https://en.wikipedia.org/wiki/SOLID
- **Design Patterns**: https://refactoring.guru/design-patterns

### API Design
- **REST Best Practices**: https://restfulapi.net
- **GraphQL**: https://graphql.org
- **OpenAPI/Swagger**: https://nextjs.org/swagger

---

## Útil para Troubleshooting

### Logs & Debugging
- **ELK Stack**: https://www.elastic.co/what-is/elk-stack
- **Sentry**: https://sentry.io
- **Rollbar**: https://rollbar.com
- **Loggly**: https://www.loggly.com (deprecated, use alternatives)

### Profiling
- **Node.js Profiler**: https://nodejs.org/en/docs/guides/simple-profiling/
- **Chrome DevTools**: https://developer.chrome.com/docs/devtools/

---

## Manutenção e Atualizações

### Verificar Vulnerabilidades
```bash
# Node.js
npm audit
npm audit fix

# Docker
docker scan <image>

# Sistema
sudo apt update
sudo apt upgrade
```

### Manter Dependências Atualizadas
- **Dependabot**: https://dependabot.com
- **Snyk**: https://snyk.io
- **Greenkeeper**: https://greenkeeper.io

---

## Próximos Passos Recomendados

1. **Escolher um provedor VPS**
   - Começar com provedores gratuitos para teste
   - Migrar para paid quando necessário

2. **Configurar domínio**
   - Registrar em Namecheap, GoDaddy, etc.
   - Apontar DNS para seu servidor

3. **Implementar HTTPS**
   - Let's Encrypt (gratuito)
   - Certificado válido por 90 dias

4. **Monitoramento**
   - Setup de logs
   - Alertas automáticos
   - Backup automático

5. **CI/CD**
   - GitHub Actions
   - GitLab CI
   - Jenkins

---

## Suporte e Contato

Para dúvidas sobre este projeto:
- **GitHub Issues**: https://github.com/seu-repo/issues
- **Discussões**: https://github.com/seu-repo/discussions
- **Email**: support@hostacloud.com

---

**Última atualização**: Fevereiro 2026  
**Versão**: 1.0.0

