# Project: Lightweight CI/CD & Monitoring Platform for Small-Scale Deployments

## ✨ Overview

I designed and deployed a complete Continuous Integration / Continuous Deployment platform along with a monitoring system, optimized for minimal infrastructure costs while maintaining full security for data transmission.

The entire project was built from scratch without relying on expensive services like GitHub Actions, GitLab SaaS, or Jenkins Cloud. Everything runs on private VMs hosted on Oracle Cloud, combined with a custom private domain.

The goal was to build a maximally lightweight, easy-to-maintain, transparent stack that, despite its simplicity, fulfills all key production requirements — including automated builds, versioning, staging, production deployment, and monitoring.

---

## 🔧 Technology Stack

| Component        | Technology                         |
|------------------|-------------------------------------|
| Code Repository  | GitHub                              |
| Build System     | Semaphore UI (self-hosted)          |
| Deployment       | Ansible + Docker Compose            |
| Monitoring       | Prometheus + Grafana                |
| Docker Registry  | Private Docker Registry             |
| HTTPS & Certificates | Nginx + Certbot                  |
| DNS & Domain     | Namecheap + `infra2code.com` subdomain |

---

## 📦 CI/CD Pipeline Workflow

1. **Push to GitHub** triggers a webhook to Semaphore UI (`https://ci.infra2code.com`).
2. Semaphore executes the `build.yml` task, which:
   - Clones the application repository.
   - Builds a Docker image.
   - Tags the image using `semaphore_vars.task_details.incoming_version`.
   - Pushes the image to a private Docker Registry (`10.0.0.215:5000`).
3. After a successful build, Semaphore automatically triggers the `deploy.yml` task, which:
   - Deploys the application to the staging environment.
   - Uses the versioned Docker image.
   - Deploys via Ansible and dynamically generated Docker Compose files.

---

## 🧪 Testing (Optional)

Testing can be easily added as a separate task template or integrated into the existing pipeline. The architecture allows running test containers right after the build process.

---

## 🔐 Security Features

- All webhooks operate over HTTPS (Let's Encrypt certificates).
- Semaphore UI dashboard is accessible only via the secure subdomain with forced SSL.
- Docker Registry is accessible only via private network interfaces.
- Grafana dashboard is exposed via Nginx with SSL.

---

## 📊 Monitoring Setup

- Prometheus and Grafana are deployed automatically via a single Ansible task.
- Automated setup includes datasource provisioning and default dashboard configuration.
- Grafana is publicly available via `https://grafana.infra2code.com` with HTTPS encryption.

---

Fully production-ready. Lightweight. Secure. Built 100% from scratch.
