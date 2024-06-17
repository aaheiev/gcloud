# Create google service accounts

## Infrastructure management

### IaC reader
> Can read and lock terraform state
> Can read resources in the project

### IaC writer
> Can read and write terraform state
> Can create and delete resources in the project

IaC writer should be created per application environment and available via github environment