# Laboratorio 
# Consumo de API's con flutter

El presente repo contiene una aplicación que consume el API de https://pokeapi.co/, con el endpoint [https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0](https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0)

Actividad 1:
La actividad por realizar es generar una aplicación que me permita buscar y mostrar Pokémons pero con todas sus características, incluida su foto, para lo cual puede consumir el endpoint: https://pokeapi.co/api/v2/pokemon/ditto , en este caso "ditto" es el nombre del Pokémon a mostrar.

🔴⚪ Pokédex Flutter App

Una aplicación móvil desarrollada con Flutter que permite buscar y visualizar información detallada de Pokémon en tiempo real.
Este proyecto consume la API pública PokeAPI para obtener estadísticas, tipos, habilidades e imágenes oficiales.

📱 Capturas de Pantalla

(Reemplaza estas rutas con tus imágenes reales o elimina esta sección si no subirás capturas.)

Pantalla de Búsqueda

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/1ec178b5-f3f4-49b3-baae-9f965c4afb09" />


Detalle del Pokémon

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/80ce4fe8-2ccc-45b6-ba65-a7bc2e22fab1" />

<img width="720" height="1600" alt="image" src="https://github.com/user-attachments/assets/d0cc1b94-76ff-44f8-a73f-835e4a8ed679" />

✨ Características Principales

Buscador en tiempo real
Ingresa el nombre de cualquier Pokémon (ej: pikachu, mewtwo).

Interfaz temática
Estilo inspirado en una Pokédex clásica (colores rojo/blanco).

Detalles completos del Pokémon:

Imagen oficial (Official Artwork)

Tipos (Agua, Fuego, Planta, etc.)

Estadísticas base (HP, Ataque, Defensa, Velocidad) con barras de progreso

Peso y altura

Lista de habilidades

Manejo de errores
Mensajes amigables cuando no se encuentra un Pokémon o no hay internet.

🛠️ Tecnologías Utilizadas

Framework: Flutter (SDK ^3.5.4)

Lenguaje: Dart

HTTP Requests: Paquete http (^1.2.2)

API: PokeAPI v2

🚀 Instalación y Ejecución

Sigue estos pasos para correr el proyecto de forma local:

1️⃣ Clonar el repositorio
git clone https://github.com/TU_USUARIO/pokemonapi.git
cd pokemonapi

2️⃣ Instalar dependencias
flutter pub get

3️⃣ Ejecutar la app

Conecta un dispositivo físico o inicia un emulador:

flutter run

📂 Estructura del Código

El proyecto utiliza una estructura sencilla dentro de lib/main.dart:

PokemonApp

Widget principal

Configura el MaterialApp, el tema visual (rojo/blanco) y fuentes globales

PokemonSearchScreen

Pantalla principal (StatefulWidget), incluye:

TextField para ingresar la búsqueda

Función asíncrona que hace peticiones a la API

Manejo de estados:

_isLoading

_errorMessage

_pokemonData

_buildPokemonDetailCard

Renderiza la tarjeta de información del Pokémon:

Imagen oficial

Chips con los tipos

Barras de estadísticas

Datos físicos

Habilidades

📡 Consumo de API

La app realiza una petición GET al siguiente endpoint:

GET https://pokeapi.co/api/v2/pokemon/{nombre}


La respuesta JSON se procesa para extraer solo la información necesaria.

Christian Márquez



Actividad 2:

https://github.com/ChristianMarquez2/Detector-Amenazas.git 

