### Archivos Principales

- **`terragrunt.hcl`**: Contiene configuraciones específicas para cada módulo y entorno.
- **`vars.yaml`**: Define las variables específicas para un módulo.
- **`common_vars.yaml`**: Variables comunes al entorno.
- **`all_envs.yaml`**: Configuración compartida entre todos los módulos del entorno.

## Requisitos Previos

1. **CLI de Terraform**: Instalar desde [Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/cli-get-started/install).
2. **CLI de Terragrunt**: Instalar desde [Terragrunt CLI](https://terragrunt.gruntwork.io/docs/getting-started/install/).
3. **Autenticación en GCP**:
   - Configurar las credenciales con `gcloud auth application-default login`.
   - Asegurarse de tener permisos adecuados para gestionar los recursos.

## Estructura de los ambientes y recursos

   ```bash
    ├── {environment}
    │   ├── all_envs.yaml
    │   ├── common_vars.yaml
    │   ├── {resource-01}
    │   │   └── {resource-name-01}
    │   │       ├── terragrunt.hcl
    │   │       └── vars.yaml
    │   ├── {resource-02}
    │   │   └── {resource-name-02}
    │   │       ├── terragrunt.hcl
    │   │       └── vars.yaml
    │   └── terragrunt.hcl
    └── README.md
   ```

## Uso del Repositorio

### 1. Configuración Inicial

1. Clonar este repositorio:
   ```bash
   git clone https://dev.azure.com/Core-Retail-Digital/CoRDInfrastructure/_git/infraestructure-terraform-cord-1725
   cd demo-terragrunt
   ```

### Cambiar a un Entorno Específico

2. Navegar al entorno correspondiente y módulo que deseas aplicar. Por ejemplo, para gestionar el módulo IAM en el entorno `dev`:

    ```bash
    cd infraestructura/dev/bucket
    terragrunt init
    terragrunt plan
    terragrunt apply
    ```