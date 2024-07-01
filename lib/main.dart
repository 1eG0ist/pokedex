import 'package:flutter/material.dart';
import 'package:pokedex/pages/all_pokemons_page.dart';
import 'package:pokedex/repository/pokemons.dart';
import 'package:pokedex/utils/loading_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool fetched = false;
  final List<Map<String, dynamic>> pokemonsInfo = [];

  void fetchAllPokemons() async {
    List<String> pokemons = [
      "https://pokeapi.co/api/v2/pokemon/1/",
      "https://pokeapi.co/api/v2/pokemon/4/",
      "https://pokeapi.co/api/v2/pokemon/7/",
      "https://pokeapi.co/api/v2/pokemon/12/",
      "https://pokeapi.co/api/v2/pokemon/25/",
      "https://pokeapi.co/api/v2/pokemon/92/",
      "https://pokeapi.co/api/v2/pokemon/132/",
      "https://pokeapi.co/api/v2/pokemon/152/",
      "https://pokeapi.co/api/v2/pokemon/304/",
    ];
    for (String pokemonUrl in pokemons) {
      Map<String, dynamic>? pokemon = await PokemonsApi.fetchJsonData(pokemonUrl);
      if (pokemon != null) pokemonsInfo.add(pokemon);
    }
    setState(() {fetched = true;});
  }

  @override
  void initState() {
    fetchAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      home: fetched ? AllPokemonsPage(pokemonList: pokemonsInfo) : const LoadingIndicator(),
    );
  }
}