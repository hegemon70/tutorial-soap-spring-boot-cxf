# Makefile for tutorial-soap-spring-boot-cxf
# Este Makefile ayuda a empezar con el proyecto tutorial de SOAP con Spring Boot y Apache CXF

.PHONY: help build clean test run-step1 run-step2 run-step3 run-step4 run-step5 run-step6 run-step7 run-step8 run-step9 run-step10 install generate-step2

# Colores para la salida
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[1;33m
NC := \033[0m # No Color

# Ayuda por defecto
help:
	@echo "$(BLUE)═══════════════════════════════════════════════════════════════════════$(NC)"
	@echo "$(GREEN)  Tutorial SOAP Spring Boot CXF - Comandos Make Disponibles$(NC)"
	@echo "$(BLUE)═══════════════════════════════════════════════════════════════════════$(NC)"
	@echo ""
	@echo "$(YELLOW)Comandos de Construcción:$(NC)"
	@echo "  make build          - Construir todos los proyectos del tutorial"
	@echo "  make clean          - Limpiar todos los artefactos de construcción"
	@echo "  make test           - Ejecutar todos los tests"
	@echo "  make install        - Instalar todas las dependencias Maven"
	@echo ""
	@echo "$(YELLOW)Comandos para Ejecutar Pasos Individuales:$(NC)"
	@echo "  make run-step1      - Ejecutar Step 1: Simple SpringBoot App with CXF"
	@echo "  make run-step2      - Ejecutar Step 2: WSDL to Java Maven"
	@echo "  make run-step3      - Ejecutar Step 3: JAX-WS Endpoint CXF Spring Boot"
	@echo "  make run-step4      - Ejecutar Step 4: Testing SOAP Web Services"
	@echo "  make run-step5      - Ejecutar Step 5: Custom SOAP Fault"
	@echo "  make run-step6      - Ejecutar Step 6: SOAP Message Logging"
	@echo "  make run-step7      - Ejecutar Step 7: SOAP Message Logging (Payload Only)"
	@echo "  make run-step8      - Ejecutar Step 8: Logging into Elastic Stack"
	@echo "  make run-step9      - Ejecutar Step 9: SOAP Logging into Custom ES Field"
	@echo "  make run-step10     - Ejecutar Step 10: Simple App with CXF Spring Boot Starter"
	@echo ""
	@echo "$(YELLOW)Comandos de Generación:$(NC)"
	@echo "  make generate-step2 - Generar clases JAXB desde WSDL (Step 2)"
	@echo ""
	@echo "$(YELLOW)Comandos de Ayuda:$(NC)"
	@echo "  make help           - Mostrar esta ayuda"
	@echo ""
	@echo "$(BLUE)═══════════════════════════════════════════════════════════════════════$(NC)"

# Construir todos los proyectos
build:
	@echo "$(GREEN)Construyendo todos los proyectos del tutorial...$(NC)"
	mvn clean package -DskipTests

# Limpiar todos los artefactos
clean:
	@echo "$(YELLOW)Limpiando todos los artefactos de construcción...$(NC)"
	mvn clean

# Ejecutar todos los tests
test:
	@echo "$(GREEN)Ejecutando todos los tests...$(NC)"
	mvn test

# Instalar dependencias
install:
	@echo "$(GREEN)Instalando todas las dependencias Maven...$(NC)"
	mvn clean install

# Generar clases JAXB desde WSDL (Step 2)
generate-step2:
	@echo "$(GREEN)Generando clases JAXB desde WSDL (Step 2)...$(NC)"
	cd step2_wsdl_2_java_maven && mvn clean generate-sources

# Ejecutar Step 1
run-step1:
	@echo "$(GREEN)Ejecutando Step 1: Simple SpringBoot App with CXF...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step1_simple_springboot_app_with_cxf && mvn spring-boot:run

# Ejecutar Step 2
run-step2:
	@echo "$(GREEN)Step 2 es un paso de generación de código.$(NC)"
	@echo "$(YELLOW)Ejecutando generación de clases JAXB desde WSDL...$(NC)"
	@$(MAKE) generate-step2

# Ejecutar Step 3
run-step3:
	@echo "$(GREEN)Ejecutando Step 3: JAX-WS Endpoint CXF Spring Boot...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	@echo "$(BLUE)WSDL disponible en: http://localhost:8080/soap-api/WeatherService?wsdl$(NC)"
	cd step3_jaxws-endpoint-cxf-spring-boot && mvn spring-boot:run

# Ejecutar Step 4
run-step4:
	@echo "$(GREEN)Ejecutando Step 4: Testing SOAP Web Services...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step4_test && mvn spring-boot:run

# Ejecutar Step 5
run-step5:
	@echo "$(GREEN)Ejecutando Step 5: Custom SOAP Fault...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step5_custom-soap-fault && mvn spring-boot:run

# Ejecutar Step 6
run-step6:
	@echo "$(GREEN)Ejecutando Step 6: SOAP Message Logging...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step6_soap_message_logging && mvn spring-boot:run

# Ejecutar Step 7
run-step7:
	@echo "$(GREEN)Ejecutando Step 7: SOAP Message Logging (Payload Only)...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step7_soap_message_logging_payload_only && mvn spring-boot:run

# Ejecutar Step 8
run-step8:
	@echo "$(GREEN)Ejecutando Step 8: Logging into Elastic Stack...$(NC)"
	@echo "$(YELLOW)Nota: Asegúrate de tener Elasticsearch y Logstash ejecutándose$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step8_logging_into_elasticstack && mvn spring-boot:run

# Ejecutar Step 9
run-step9:
	@echo "$(GREEN)Ejecutando Step 9: SOAP Logging into Custom ES Field...$(NC)"
	@echo "$(YELLOW)Nota: Asegúrate de tener Elasticsearch y Logstash ejecutándose$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step9_soap_message_logging_into_custom_elasticsearch_field && mvn spring-boot:run

# Ejecutar Step 10
run-step10:
	@echo "$(GREEN)Ejecutando Step 10: Simple App with CXF Spring Boot Starter...$(NC)"
	@echo "$(YELLOW)Presiona Ctrl+C para detener la aplicación$(NC)"
	cd step10_simple_app_with_cxf-spring-boot-starter && mvn spring-boot:run
