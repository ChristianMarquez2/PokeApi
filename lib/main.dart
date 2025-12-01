import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(PokemonApp());
}

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex Buscador',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.redAccent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: Colors.red,
        ),
      ),
      home: PokemonSearchScreen(),
    );
  }
}

class PokemonSearchScreen extends StatefulWidget {
  @override
  _PokemonSearchScreenState createState() => _PokemonSearchScreenState();
}

class _PokemonSearchScreenState extends State<PokemonSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  Map<String, dynamic>? _pokemonData;
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> searchPokemon(String query) async {
    if (query.isEmpty) return;

    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
      _errorMessage = '';
      _pokemonData = null;
    });

    final name = query.toLowerCase().trim();
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$name');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _pokemonData = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'No se encontró el Pokémon "$query". Intenta con otro.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error de conexión. Verifica tu internet.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.catching_pokemon),
            SizedBox(width: 10),
            Text('Pokédex', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Ingresa nombre (ej: ditto, pikachu)',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _pokemonData = null;
                        _errorMessage = '';
                      });
                    },
                  ),
                ),
                onSubmitted: (value) => searchPokemon(value),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () => searchPokemon(_searchController.text),
                child: Text('BUSCAR POKÉMON', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              
              SizedBox(height: 30),

              if (_isLoading)
                Center(child: CircularProgressIndicator(color: Colors.red))
              else if (_errorMessage.isNotEmpty)
                _buildErrorCard()
              else if (_pokemonData != null)
                _buildPokemonDetailCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text(_errorMessage, textAlign: TextAlign.center, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildPokemonDetailCard() {
    final String name = _pokemonData!['name'];
    final String imageUrl = _pokemonData!['sprites']['other']['official-artwork']['front_default'] ?? 
                            _pokemonData!['sprites']['front_default'];
    final int height = _pokemonData!['height'];
    final int weight = _pokemonData!['weight'];
    final List types = _pokemonData!['types'];
    final List stats = _pokemonData!['stats'];
    final List abilities = _pokemonData!['abilities'];

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Text(
              name.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          
          Container(
            height: 200,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/poke-ball.png'),
                opacity: 0.1,
                fit: BoxFit.contain,
              )
            ),
            child: Image.network(imageUrl, fit: BoxFit.contain),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              spacing: 8.0,
              alignment: WrapAlignment.center,
              children: types.map((t) {
                return Chip(
                  label: Text(
                    t['type']['name'].toString().toUpperCase(),
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.all(4),
                );
              }).toList(),
            ),
          ),
          
          Divider(thickness: 1, indent: 20, endIndent: 20),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttributeColumn("Altura", "${height / 10} m"),
                _buildAttributeColumn("Peso", "${weight / 10} kg"),
              ],
            ),
          ),

          Divider(thickness: 1, indent: 20, endIndent: 20),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Estadísticas Base", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                SizedBox(height: 10),
                ...stats.map((s) {
                  return _buildStatRow(s['stat']['name'], s['base_stat']);
                }).toList(),
              ],
            ),
          ),

           Divider(thickness: 1, indent: 20, endIndent: 20),

          Padding(
             padding: const EdgeInsets.all(15.0),
             child: Column(
               children: [
                 Text("Habilidades", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                 SizedBox(height: 5),
                 Wrap(
                   alignment: WrapAlignment.center,
                   spacing: 10,
                   children: abilities.map((a) => 
                     Chip(
                       backgroundColor: Colors.grey[200],
                       label: Text(a['ability']['name']),
                     )
                   ).toList(),
                 )
               ],
             ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAttributeColumn(String label, String value) {
    return Column(
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 14)),
        SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // --- AQUÍ ESTABA EL ERROR ---
  // CORREGIDO: Usamos SizedBox para dar el ancho, no TextStyle.
  Widget _buildStatRow(String statName, int value) {
    double progress = value / 150.0;
    if (progress > 1.0) progress = 1.0;

    Color statColor = Colors.blue;
    if (statName == 'hp') statColor = Colors.green;
    if (statName == 'attack') statColor = Colors.redAccent;
    if (statName == 'defense') statColor = Colors.blueAccent;
    if (statName == 'speed') statColor = Colors.orange;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              statName.toUpperCase(),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ),
          // CORRECCIÓN AQUÍ:
          SizedBox(
            width: 30, // El ancho se define en el SizedBox
            child: Text(
              "$value", 
              style: TextStyle(fontWeight: FontWeight.bold), // Quitamos 'width' de aquí
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[200],
                color: statColor,
                minHeight: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}