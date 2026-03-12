# Terraform HCL Enablement

This repository illustrates Terraform module development as a staged refactoring journey.
Each stage is intentionally small, runnable, and focused on one concept.

The examples use only HashiCorp utility providers:

- `hashicorp/random`
- `hashicorp/time`

No cloud infrastructure providers are used.

## Stage Summary

| Stage | Directory | Purpose |
| --- | --- | --- |
| 1 | `examples/stage-1-root-module` | Initial root module declaration |
| 2 | `examples/stage-2-root-with-locals` | Root module with `locals` for attribute declaration |
| 3 | `examples/stage-3-child-module` | Nested child module with variables and outputs; root calls child |
| 4 | `examples/stage-4-component-source` | Component source layout using `locals` ingestion; introduces Terraform tests |
| 5 | `examples/stage-5-governable-defaults` | Root variables + `locals` for governable defaults; extends test coverage |

## Repository Layout

```text
examples/
  stage-1-root-module/
  stage-2-root-with-locals/
  stage-3-child-module/
  stage-4-component-source/
  stage-5-governable-defaults/
```

## Prerequisites

- Terraform `>= 1.6.0`
- Network access for provider installation during `terraform init`

## Development Commands

Run these from repository root during development:

```bash
terraform fmt -recursive
```

Validation and planning are run per stage directory:

```bash
cd examples/stage-1-root-module
terraform init -backend=false
terraform validate
terraform plan
```

## Usage By Stage

Use this sequence for any stage:

```bash
cd <stage-directory>
terraform init -backend=false
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

Stage-specific notes:

1. `examples/stage-1-root-module`
   Basic root-only resources and outputs.
2. `examples/stage-2-root-with-locals`
   Root-only resources configured by `locals`.
3. `examples/stage-3-child-module`
   Root delegates resource creation to a nested child module.
4. `examples/stage-4-component-source`
   Root delegates to component source layout and introduces tests:

   ```bash
   terraform test
   ```

5. `examples/stage-5-governable-defaults`
   Root exposes variables and computes governable defaults via `locals`.
   Continue running inherited stage-4-style tests and stage-5-specific tests:

   ```bash
   terraform test
   ```

## Staged Learning Flow

Follow stages in order to see the refactoring path:

1. Start at stage 1 and run `plan`/`apply`/`destroy`.
2. Move to stage 2 to see `locals`-driven configuration.
3. Move to stage 3 to see nested module extraction.
4. Move to stage 4 to see component source layout and first test suite.
5. Move to stage 5 to see governable defaults via variables plus `locals`.

## Batch Validation Example

From repository root:

```bash
for stage in \
  examples/stage-1-root-module \
  examples/stage-2-root-with-locals \
  examples/stage-3-child-module \
  examples/stage-4-component-source \
  examples/stage-5-governable-defaults
do
  echo "==> $stage"
  (
    cd "$stage" && \
    terraform init -backend=false && \
    terraform validate
  )
done
```

Run tests for stage 4 and stage 5:

```bash
(
  cd examples/stage-4-component-source && terraform test
)
(
  cd examples/stage-5-governable-defaults && terraform test
)
```
