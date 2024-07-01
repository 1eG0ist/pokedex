import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/cards/pokemon_card.dart';
import 'package:pokedex/dialogs/swap_sorting_dialog.dart';
import 'package:pokedex/pages/pokemon_info_page.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:pokedex/theme/styles/text_styles.dart';

class AllPokemonsPage extends StatefulWidget {
  final List<Map<String, dynamic>> pokemonList;
  const AllPokemonsPage({super.key, required this.pokemonList});

  @override
  State<AllPokemonsPage> createState() => _AllPokemonsPageState();
}

class _AllPokemonsPageState extends State<AllPokemonsPage> {
  final searchController = TextEditingController();
  String searchText = "";
  String sortingBy = "id";

  @override
  Widget build(BuildContext context) {
    searchController.addListener(() {
      setState(() {
        searchText = searchController.text;
      });
    });
    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 108,
              width: double.infinity,
              padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Icon(Icons.sports_basketball),
                      SvgPicture.asset(
                        'assets/icons/pokeball.svg',
                        width: 24,
                        height: 24,
                        color: CustomColors.white,
                      ),
                      const SizedBox(width: 16),
                      const Text("Pokédex", style: CustomTextStyle.headline)
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 32,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: TextField(
                            controller: searchController,
                            style: CustomTextStyle.body3,
                            textAlignVertical: TextAlignVertical.top,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(fontSize: 14),
                              prefixIcon: SvgPicture.asset(
                                'assets/icons/search.svg',
                                width: 16,
                                height: 16,
                                color: CustomColors.primary,
                              ),
                              prefixIconConstraints: BoxConstraints(
                                  minHeight: 16,
                                  maxHeight: 16,
                                  minWidth: 16,
                                  maxWidth: 16
                              ),
                              // suffixIconConstraints: BoxConstraints(
                              //   minHeight: 0,
                              //   maxHeight: 16,
                              //   minWidth: 0,
                              //   maxWidth: 16
                              // ),
                              suffixIcon: searchText.isNotEmpty ? IconButton(
                                icon: SvgPicture.asset(
                                  'assets/icons/close.svg',
                                  color: CustomColors.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    searchController.clear();
                                  });
                                },
                              ) : null,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {},
                        child: InnerShadow(
                          shadows: [],
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white
                            ),
                            child: IconButton(
                              icon: SvgPicture.asset(
                                sortingBy == "id" ? 'assets/icons/tag.svg' : 'assets/icons/text_format.svg',
                                color: CustomColors.primary,
                              ),
                              onPressed: () {
                                showDialog(context: context, builder: (BuildContext context) {
                                  return SwapSortingDialog(selected: sortingBy);
                                }).then((value) {
                                  setState(() {
                                    if (value != null) sortingBy = value;
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: InnerShadow(
                shadows: [
                  // Shadow(
                  //     color: Colors.black.withOpacity(0.25),
                  //     blurRadius: 10,
                  //     offset: const Offset(2, 5)
                  // ),
                  // Shadow(
                  //     color: Colors.black.withOpacity(0.25),
                  //     blurRadius: 10,
                  //     offset: const Offset(-2, -5)
                  // ),
                ],
                child: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.only(top: 24, left: 12, right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColors.white,
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: widget.pokemonList.where((pokemon) => pokemon["name"].toLowerCase().contains(searchText.toLowerCase())).length,
                    itemBuilder: (context, index) {
                      final filteredPokemonList = widget.pokemonList.where((pokemon) => pokemon["name"].toLowerCase().contains(searchText.toLowerCase())).toList();
                      filteredPokemonList.sort((a, b) => a[sortingBy].compareTo(b[sortingBy]));
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => PokemonInfoPage(allPokemons: filteredPokemonList, currentIndex: index))
                          );
                        },
                        child: PokemonCard(
                          pokemonNumber: filteredPokemonList[index]["id"],
                          pokemonName: filteredPokemonList[index]["name"],
                          imageUrl: filteredPokemonList[index]["sprites"]["other"]["official-artwork"]["front_default"],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
