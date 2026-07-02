# Contributing Guide

Thank you for contributing to K8S-MESH.

Please follow the standards below to keep the project consistent, secure, and production-ready.

---

# Repository Workflow

This project uses a Git Flow-inspired branching strategy.

```
main        -> Production
staging     -> Pre-production
develop     -> Development
feature/*   -> New features
bugfix/*    -> Bug fixes
hotfix/*    -> Emergency production fixes
```

Never commit directly to `main`, `staging`, or `develop`.

Always create a feature branch.

Example:

```bash
git checkout develop
git pull origin develop

git checkout -b feature/payment-api
```

---

# Branch Naming

Use the following naming convention.

```
feature/<feature-name>

bugfix/<bug-name>

hotfix/<issue-name>

release/<version>
```

Examples

```
feature/add-payment-service

feature/user-authentication

bugfix/cart-validation

hotfix/payment-timeout

release/v1.0.0
```

---

# Commit Message Convention

Follow the Conventional Commit format.

```
feat: add payment service

fix: resolve login issue

docs: update README

refactor: simplify inventory service

test: add unit tests

ci: update GitHub Actions workflow

chore: upgrade dependencies
```

Avoid commit messages like

```
update

changes

fixed

done
```

---

# Pull Requests

Every Pull Request should

- Explain what changed
- Explain why it changed
- Reference related issues
- Pass all CI checks
- Be reviewed before merging

Never merge your own Pull Request without review.

---

# Coding Standards

General

- Write clean, readable code.
- Remove unused code.
- Keep functions small and focused.
- Follow language-specific style guides.

---

# Infrastructure Standards

Infrastructure changes must use:

- Terraform
- Kubernetes manifests
- Helm (if adopted)
- GitHub Actions

Never make manual production infrastructure changes.

Infrastructure must remain version-controlled.

---

# Security

Never commit

- Passwords
- API Keys
- Tokens
- Certificates
- .env files

Use GitHub Secrets or your cloud provider's secret management service.

---

# Testing

Before opening a Pull Request ensure

- Application builds successfully
- Unit tests pass
- Linting passes
- Docker image builds successfully
- Kubernetes manifests are valid

---

# Code Review

Every Pull Request should be reviewed for

- Code quality
- Security
- Performance
- Documentation
- Infrastructure impact

---

# Merge Strategy

Only merge when

- CI passes
- Required approvals are complete
- Conflicts are resolved

Preferred merge method

- Squash and Merge

---

# Questions

If unsure about any change, open an issue or start a discussion before implementing it.