 1. Source Control & Branching Strategy
- GitHub repo with protected main branch
- Branch strategy: `main` → `staging` → `dev`
- Pull request reviews required before merge
- `.gitignore`, `README`, proper repo structure

---

## 2. Containerization
- Dockerfile for your app (multi-stage build for smaller image)
- `.dockerignore` file
- Docker Compose for local development
- Image tagging strategy (commit SHA, semantic versioning)

---

## 3. Container Registry
- **ECR (Elastic Container Registry)** — push and store your Docker images
- Lifecycle policies to auto-delete old images
- Image vulnerability scanning enabled

---

## 4. CI/CD Pipeline (GitHub Actions)
- **CI** — on every pull request: lint, run tests, build Docker image
- **CD** — on merge to main: push image to ECR, deploy to ECS
- Separate pipelines per environment (dev, staging, prod)
- Secrets stored in GitHub Secrets, never hardcoded

---

## 5. Infrastructure as Code
- **Terraform** to provision every AWS resource
- State file stored remotely in S3 with DynamoDB locking
- Separate workspaces or folders per environment
- Nobody manually clicks in AWS console to create resources

---

## 6. App Hosting on ECS
- **ECS Fargate** — serverless containers, no EC2 management
- Task definitions defining your container config
- ECS Service managing desired count and rolling deployments
- Auto-scaling based on CPU/memory thresholds

---

## 7. Networking
- Custom **VPC** with public and private subnets
- App running in **private subnet** (not exposed directly to internet)
- **ALB (Application Load Balancer)** in public subnet routing traffic in
- **NAT Gateway** for outbound traffic from private subnet
- **Security Groups** as firewalls on every resource
- **Route 53** for domain management and DNS routing

---

## 8. Database
- **RDS (PostgreSQL)** in a private subnet
- Multi-AZ for high availability
- Automated backups enabled
- Database never publicly accessible
- Connection via private endpoint only

---

## 9. Secrets & Configuration Management
- **AWS Secrets Manager** for database passwords, API keys
- **Parameter Store (SSM)** for non-sensitive config values
- ECS tasks pull secrets at runtime, never baked into images
- Environment-specific configs per environment

---

## 10. SSL & Domain
- **ACM (AWS Certificate Manager)** — free SSL certificate
- Certificate attached to the ALB
- HTTPS enforced, HTTP redirects to HTTPS
- Custom domain via Route 53

---

## 11. Monitoring & Observability
- **CloudWatch Logs** — all container logs streaming here
- **CloudWatch Metrics** — CPU, memory, request count dashboards
- **CloudWatch Alarms** — alerts when error rate or CPU spikes
- **AWS X-Ray** (optional) — distributed tracing across services
- Uptime checks on your endpoint

---

## 12. Security
- **IAM Roles** for every service (least privilege principle)
- No hardcoded AWS credentials anywhere
- **ECS Task Role** — gives only the permissions the app needs
- **ECR image scanning** on push
- **AWS WAF** (optional for production) — protects ALB from attacks
- MFA on your AWS root account

---

## 13. Environment Strategy
- Three environments: `dev`, `staging`, `production`
- Dev deploys on every push to dev branch
- Staging mirrors production, used for final testing
- Production deploys only on approved merge to main
- Separate AWS resources per environment (or separate accounts ideally)

---

## 14. Rollback Strategy
- ECS keeps previous task definition version
- GitHub Actions pipeline can redeploy last stable image on failure
- Database migrations are backwards compatible (never destructive)

---

## 15. Cost Management
- Resource tagging (environment, project, owner)
- **AWS Cost Explorer** monitoring spend
- Auto-scaling down in dev/staging outside business hours
- Fargate only charges when tasks are running

---

## Summary: The Non-Negotiables
If you only had time for the core, these are the ones every employer looks for:

- Terraform for infra
- ECR + ECS Fargate for deployment
- GitHub Actions CI/CD
- VPC with proper subnets + ALB
- RDS in private subnet
- Secrets Manager
- CloudWatch logging and alarms
- HTTPS via ACM + Route 53




...........................
  ## 3. ECR — Elastic Container Registry

This is where all your Docker images live on AWS. One repository per service.

### Step 1 — Create ECR repositories via Terraform


### Step 3 — Authenticate and push manually (first time only)

```bash
# Authenticate Docker to ECR
aws ecr get-login-password --region us-east-1 | \
docker login --username AWS \
--password-stdin <your-account-id>.dkr.ecr.us-east-1.amazonaws.com

# Build, tag and push (example for product-service)
docker build -t product-service ./app/go-services/product-service

docker tag product-service:latest \
<account-id>.dkr.ecr.us-east-1.amazonaws.com/product-service:latest

docker push \
<account-id>.dkr.ecr.us-east-1.amazonaws.com/product-service:latest
```

After this, GitHub Actions handles all future pushes automatically — you never run this manually again.

---

### What scan_on_push does
Every image pushed to ECR is automatically scanned for security vulnerabilities. You see the results in the AWS console under each repository.

---

Run this to apply:
```bash
cd environments/dev
terraform init
terraform apply
```


