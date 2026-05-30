# Evaluación Parcial 2 — Ingeniería DevOps

## Nombre del proyecto

Pipeline CI/CD para microservicio contenerizado.

## Integrantes

* Integrante 1: ERNCEAU LORQUETTE
* Integrante 2: Remy wildeije

## Asignatura

Ingeniería DevOps — DOY0101

## Descripción del proyecto

Este proyecto corresponde a la Evaluación Parcial 2 de la asignatura Ingeniería DevOps. El objetivo principal es construir un pipeline CI/CD funcional que permita automatizar la integración, validación, seguridad, construcción y despliegue de un microservicio trabajado previamente.

El proyecto utiliza GitHub Actions como herramienta principal de automatización, Docker para la contenerización del microservicio y Docker Compose como estrategia de orquestación en un entorno cloud simulado.

## Tecnologías utilizadas

* Python
* Flask
* PyTest
* Docker
* Docker Compose
* GitHub Actions
* Dependabot
* Trivy

## Estructura del proyecto

```bash
Evaluacion-EP2-DevOps/
│
├── app/
│   ├── main.py
│   └── requirements.txt
│
├── tests/
│   └── test_main.py
│
├── Dockerfile
├── docker-compose.yml
├── README.md
│
└── .github/
    ├── workflows/
    │   └── ci-cd.yml
    │
    └── dependabot.yml
```

## Funcionamiento del pipeline CI/CD

El pipeline se ejecuta automáticamente cuando se realiza un push o pull request hacia las ramas `main` o `develop`.

El flujo del pipeline contempla las siguientes etapas:

### 1. Pruebas automatizadas

Se configura un entorno Python en GitHub Actions, se instalan las dependencias del proyecto y se ejecutan pruebas unitarias con PyTest. Esta etapa permite validar que el microservicio funcione correctamente antes de construir o desplegar la aplicación.

### 2. Análisis de seguridad

Se utiliza Trivy para realizar un escaneo de seguridad del repositorio. El pipeline está configurado para bloquear la ejecución si se detectan vulnerabilidades de severidad alta o crítica, cumpliendo así con prácticas de gobernanza y seguridad.

### 3. Construcción de imagen Docker

Una vez superadas las pruebas y el análisis de seguridad, se construye una imagen Docker del microservicio. Esta imagen permite ejecutar la aplicación de forma aislada, portable y reproducible.

### 4. Despliegue automático simulado

El despliegue se realiza mediante Docker Compose dentro del entorno de GitHub Actions. Este proceso simula un ambiente cloud donde el microservicio es levantado automáticamente y validado mediante una petición al endpoint `/health`.

## Contenerización

El archivo `Dockerfile` permite empaquetar el microservicio junto con sus dependencias, usando una imagen base liviana de Python. Esto facilita el despliegue en diferentes entornos sin depender de configuraciones locales.

## Orquestación de contenedores

La orquestación se realiza con Docker Compose. En el archivo `docker-compose.yml` se define el servicio del microservicio, el puerto expuesto, la política de reinicio y límites básicos de CPU y memoria. Esto permite mejorar la estabilidad y escalabilidad del despliegue.

## Escalabilidad y seguridad

El proyecto incorpora parámetros de escalabilidad mediante límites y reservas de recursos en Docker Compose. Además, se incorporan controles de seguridad a través de Trivy y Dependabot, permitiendo detectar vulnerabilidades y mantener actualizadas las dependencias.

## Trazabilidad

La trazabilidad se garantiza mediante GitHub Actions, ya que cada ejecución del pipeline queda registrada en el historial del repositorio. Cada cambio realizado en el código puede ser asociado a un commit, una rama, un pull request y una ejecución del pipeline.

## Calidad del proyecto

La calidad se asegura mediante pruebas automatizadas, validación del estado del microservicio y bloqueo del pipeline ante errores críticos. Esto permite reducir riesgos antes del despliegue y mantener una entrega continua más confiable.

## Comandos para ejecutar localmente

### Instalar dependencias

```bash
pip install -r app/requirements.txt
```

### Ejecutar pruebas

```bash
pytest tests/
```

### Construir imagen Docker

```bash
docker build -t microservicio-devops .
```

### Ejecutar con Docker

```bash
docker run -p 5000:5000 microservicio-devops
```

### Ejecutar con Docker Compose

```bash
docker compose up -d --build
```

### Verificar funcionamiento

```bash
curl http://localhost:5000/health
```

## Declaración de uso de Inteligencia Artificial

Para el desarrollo de este proyecto se utilizó Inteligencia Artificial como apoyo en la organización de la documentación, mejora de redacción técnica y generación de ejemplos base para la configuración del pipeline CI/CD. Todo el contenido fue revisado, adaptado y validado por los integrantes del equipo según los requerimientos de la evaluación.

## Conclusión

El proyecto permitió aplicar conceptos fundamentales de DevOps, tales como integración continua, entrega continua, pruebas automatizadas, seguridad, contenerización y despliegue automatizado. La implementación del pipeline CI/CD permite mejorar la confiabilidad del microservicio y asegurar que cada cambio realizado sea validado antes de llegar a un entorno de despliegue.
