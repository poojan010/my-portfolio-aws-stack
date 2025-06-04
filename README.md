# 🌐 Terraform S3 Bucket for Portfolio

This repository manages the AWS S3 bucket infrastructure for hosting the static website content of my personal portfolio using **Terraform** and **GitHub Actions**.

---

## 📁 Project Structure

```
.
├── main.tf           # Defines the S3 bucket resource
├── provider.tf       # Specifies the AWS provider and region
├── .github
│   └── workflows
│       └── terraform.yml  # CI/CD pipeline for deploying infrastructure
```

---

## 🎯 Purpose

- Creates an **S3 bucket** in the `ap-south-1` (Mumbai) region.
- The bucket serves as the static hosting destination for a personal portfolio website.
- The actual website code is managed in a **separate repository**, which uploads the built files to this bucket.

---

## 🚀 Deployment Pipeline

This repository uses **GitHub Actions** to automate Terraform deployment:

1. Triggers on every push to the `main` branch
2. Installs and configures Terraform
3. Authenticates with AWS using GitHub secrets
4. Executes `terraform init`, `plan`, and `apply`

### 🛡️ Secrets Required

To run the GitHub workflow, configure these repository secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

Add them via:  
**Settings → Secrets and variables → Actions → New repository secret**

---

## 📦 How to Use

> This repository is only responsible for creating the S3 bucket.  
> A separate project handles building and uploading the actual portfolio content to this bucket.

---

## 🛠️ Terraform Info

- **Terraform Version**: `1.12.1`
- **AWS Provider Version**: `5.42.0`
- **Region**: `ap-south-1`
- **Bucket Name**: `<your-unique-bucket-name>`

---

## 💡 Future Improvements

- Enable static website hosting on the S3 bucket
- Add CloudFront distribution for CDN support
- Automate build and deploy from portfolio repo to S3 bucket
