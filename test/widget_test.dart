import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Importa tu archivo main.dart. 
// Si tu proyecto se llama 'pokemonapi' en pubspec.yaml, esta línea está bien:
import 'package:pokemonapi/main.dart'; 

void main() {
  testWidgets('La app carga correctamente', (WidgetTester tester) async {
    // 1. Construir la app usando tu clase correcta: PokemonApp
    await tester.pumpWidget(PokemonApp());

    // 2. Verificar que el título de la AppBar aparece.
    // Esto confirma que la pantalla cargó bien.
    expect(find.text('Pokédex'), findsOneWidget);
    
    // Verificamos que el botón de búsqueda existe
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}