# CHILETEL Software de Gestión de Órdenes de Atención

Este proyecto tiene como objetivo desarrollar un sistema de gestión de órdenes de atención para la empresa CHILETEL, enfocado en asignar técnicos a daños reportados por clientes. El software permite gestionar órdenes de atención basadas en múltiples parámetros, prioridades y tipos de clientes, a su vez permite a un administrador realizar diferentes tareas de gestion de tecnicos, clientes, tiempo de resolucion de danos, entre otros.

## Características Principales

- **Base de Datos**: Oracle21C, gestor DBeaver.
- **Back-end**: Java(jdk 11)-SpringBoot 3.1, Eureka, Hibernate
- **Front-end**: Angular-PrimeNG, SASS.
- 

## Descripción de la logica de negocio

El sistema gestiona la asignación de técnicos especializados para resolver diferentes tipos de daños categorizados. Al recibir un reporte de daño por parte del cliente, se establece una prioridad de atención basada en:

- Tipo de daño.
- Tipo de cliente (Hospitales, Entidades públicas, Personas VIP, Empresas Comerciales, personas comunes).
- Orden de ingreso del daño.

El software maneja la asignación de órdenes de trabajo a técnicos según la zona de la ciudad que atiendan, su especialización y la duración estimada de atención por tipo de daño.


## Historias de Usuario (HU) - MVP

El proyecto se enfoca en desarrollar historias de usuario que cumplan con los requisitos establecidos, las historias de usuario, bosquejo inicial del front, entre otros pueden verse aqui
https://www.figma.com/file/khUroZMDh8ApIVnwVMY0kY/INFO_MAIN_CHILETEL?type=design&node-id=0%3A1&mode=design&t=XNth8b87T6BAKfbl-1

## Observaciones

- La base de datos se encuentra bajo el esquema "APP_ATEN_DANOS" con referencias claras.
- No se implementa autenticación.
- Se recomienda revisar el figma que incluye los diagramas de diseno mas facilmente de ver si no tienen el programa draw.io

## Autoria

Proyecto desarrollado unicamente por mi persona, Andres Hernandez Serna, desde el diseno, diagramas de arquitectura, montaje de la BD, creacion de los microservicios logica de negocio en el back, front, pruebas en POSTMAN, entre otros.
