# Terraform HCL Enablement - Copilot Instructions

This repository is designed to illustrate Terraform module development. These instructions guide Copilot in assisting with Terraform code, documentation, and best practices.

## Build, Test, and Lint Commands

Since this is a Terraform project, the primary lifecycle commands are:

- **Initialization**: `terraform init` - Initialize the working directory.
- **Formatting**: `terraform fmt -recursive` - rewrite Terraform configuration files to a canonical format and style.
- **Validation**: `terraform validate` - Validate the configuration files in a directory.
- **Planning**: `terraform plan` - Create an execution plan.
- **Applying**: `terraform apply` - Apply the changes required to reach the desired state of the configuration.
- **Linting**: If `tflint` is available, run `tflint` to check for errors and best practices.

## High-Level Architecture

This project follows standard Terraform module structure:

- **Root Module**: The main entry point for the configuration.
- **Submodules**: Reusable components stored in subdirectories (if applicable).
- **Core Files**:
  - `main.tf`: The primary logic for resources and data sources.
  - `variables.tf`: Input variable definitions.
  - `outputs.tf`: Output value definitions.
  - `versions.tf`: Terraform and provider version constraints.

## Key Conventions

### HCL Style and Formatting
- **Indentation**: Use 2 spaces for indentation.
- **Alignment**: Align equal signs (`=`) in resource arguments for readability where appropriate.
- **Comments**: Use `#` for single-line comments.
- **Naming**:
  - Use `snake_case` for resource names, variable names, and output names.
  - Resource names should be descriptive but not redundant (e.g., `aws_instance.web_server` instead of `aws_instance.web_server_instance`).

### Variable and Output Documentation
- **Descriptions**: All variables and outputs MUST have a `description` field explaining their purpose.
- **Types**: Always specify `type` for variables.
- **Sensitiveness**: Mark sensitive variables with `sensitive = true`.

### Terraform Versioning
- **Constraints**: Use version constraints in `versions.tf` (e.g., `required_version = ">= 1.0"`).
- **Lock File**: Commit `.terraform.lock.hcl` to ensure reproducible builds.

### Documentation
- As this project aims to "illustrate" development, code should be heavily commented where complex logic exists.
- Ensure `README.md` is updated with usage instructions for any new modules.
