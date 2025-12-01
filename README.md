# 🧪 Laboratorio 
## 💻 Consumo de API's con Flutter

El presente repositorio contiene una aplicación que consume el API de [PokeAPI](https://pokeapi.co/), con el endpoint:  
[https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0](https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0)

---

### 📝 Actividad 1
La actividad consiste en generar una aplicación que permita **buscar y mostrar Pokémons con todas sus características**, incluida su foto.  
Para esto, se puede consumir el endpoint:  

https://pokeapi.co/api/v2/pokemon/ditto

> Nota: `"ditto"` es un ejemplo del nombre del Pokémon a mostrar.

---

# 🔴⚪ Pokédex Flutter App

Una aplicación móvil desarrollada con **Flutter** que permite buscar y visualizar información detallada de Pokémon en tiempo real.  
Este proyecto consume la API pública **PokeAPI** para obtener estadísticas, tipos, habilidades e imágenes oficiales.

---

## 📱 Capturas de Pantalla

**Pantalla de Búsqueda**  

<img width="720" height="1600" alt="Pantalla de búsqueda" src="https://github.com/user-attachments/assets/1ec178b5-f3f4-49b3-baae-9f965c4afb09" />

**Detalle del Pokémon**  

<img width="720" height="1600" alt="Detalle Pokémon" src="https://github.com/user-attachments/assets/80ce4fe8-2ccc-45b6-ba65-a7bc2e22fab1" />

<img width="720" height="1600" alt="Detalle Pokémon" src="https://github.com/user-attachments/assets/d0cc1b94-76ff-44f8-a73f-835e4a8ed679" />

---

## ✨ Características Principales

- **Buscador en tiempo real:**  
  Ingresa el nombre de cualquier Pokémon (ej: `pikachu`, `mewtwo`).

- **Interfaz temática:**  
  Inspirada en la Pokédex clásica (colores rojo/blanco).

- **Detalles completos del Pokémon:**  
  - Imagen oficial (*Official Artwork*)  
  - Tipos (Agua, Fuego, Planta, etc.)  
  - Estadísticas base (HP, Ataque, Defensa, Velocidad) con barras de progreso  
  - Peso y altura  
  - Lista de habilidades  

- **Manejo de errores:**  
  Mensajes amigables cuando no se encuentra un Pokémon o no hay internet.

---

## 🛠️ Tecnologías Utilizadas

- **Framework:** Flutter (SDK ^3.5.4)  
- **Lenguaje:** Dart  
- **HTTP Requests:** Paquete `http` (^1.2.2)  
- **API:** PokeAPI v2  

---

## 🚀 Instalación y Ejecución

Sigue estos pasos para correr el proyecto localmente:

### 1️⃣ Clonar el repositorio
```bash
🚀 Instalación y Ejecución

1️⃣ Clonar el repositorio
$ git clone https://github.com/TU_USUARIO/pokemonapi.git
$ cd pokemonapi

2️⃣ Instalar dependencias
$ flutter pub get

3️⃣ Ejecutar la aplicación
Conecta un dispositivo físico o inicia un emulador:
$ flutter run

📂 Estructura del Código

El proyecto sigue una estructura simple dentro de lib/main.dart:

PokemonApp
  - Widget principal
  - Configura MaterialApp, tema visual (rojo/blanco) y fuentes globales

PokemonSearchScreen
  - Pantalla principal (StatefulWidget), incluye:
    * TextField para la búsqueda
    * Función asíncrona para conectarse con la API
    * Manejo de estados:
        _isLoading
        _errorMessage
        _pokemonData

_buildPokemonDetailCard
  - Renderiza la tarjeta de información del Pokémon:
    * Imagen oficial
    * Chips con los tipos
    * Barras de estadísticas
    * Datos físicos
    * Habilidades

📡 Consumo de API

La aplicación realiza una petición GET al endpoint:
$ GET https://pokeapi.co/api/v2/pokemon/{nombre}

La respuesta JSON se procesa para mostrar únicamente la información necesaria.

✒️ Autor

Christian Márquez – Desarrollo inicial
