.PHONY: lint scan check

# Run Terraform formatting and validation
lint:
	terraform init -backend=false
	terraform fmt -check -recursive
	terraform validate

# Run Trivy security scan
scan:
	trivy config --exit-code 1 --severity HIGH,CRITICAL .

# Run everything
check: lint scan
