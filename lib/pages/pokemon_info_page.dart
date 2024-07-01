import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:pokedex/theme/styles/text_styles.dart';
import 'package:pokedex/utils/custom_divider.dart';
import 'package:pokedex/utils/loading_indicator.dart';
import 'package:pokedex/utils/skill_bar.dart';

class PokemonInfoPage extends StatefulWidget {
  List<Map<String, dynamic>> allPokemons;
  int currentIndex;
  PokemonInfoPage({super.key, required this.allPokemons, required this.currentIndex});

  @override
  State<PokemonInfoPage> createState() => _PokemonInfoPageState();
}

class _PokemonInfoPageState extends State<PokemonInfoPage> {

  @override
  Widget build(BuildContext context) {
    Color mainColor = CustomColors.getNeededColor(widget.allPokemons[widget.currentIndex]["types"][0]["type"]["name"]);
    final types = List.generate(
        widget.allPokemons[widget.currentIndex]["types"].length,
        (int index) => Container(
          height: 20,
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: CustomColors.getNeededColor(widget.allPokemons[widget.currentIndex]["types"][index]["type"]["name"])
          ),
          child: Center(
            child: Text(
              widget.allPokemons[widget.currentIndex]["types"][index]["type"]["name"],
              style: CustomTextStyle.subtitle3(),
            ),
          ),
        )
    );

    final moves = List.generate(
        widget.allPokemons[widget.currentIndex]["abilities"].length == 1 ? 1 : 2,
        (int index) => Text(
          "${widget.allPokemons[widget.currentIndex]['abilities'][index]['ability']['name'][0].toUpperCase()}${widget.allPokemons[widget.currentIndex]['abilities'][index]['ability']['name'].substring(1)}",
          style: CustomTextStyle.body3
        )
    );
    
    final statsValues = List.generate(
        widget.allPokemons[widget.currentIndex]["stats"].length, 
        (int index) => Center(
            child: Row(
              children: [
                Text("${widget.allPokemons[widget.currentIndex]["stats"][index]["base_stat"].toString().padLeft(3, '0')}", style: CustomTextStyle.body3),
                SizedBox(width: 8),
                SkillBar(currentValue: double.parse(widget.allPokemons[widget.currentIndex]["stats"][index]["base_stat"].toString()), color: mainColor),
              ],
            )
        )
    );

    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            // back icon
            Positioned(
              right: 8,
              top: 8,
              child: SvgPicture.asset(
                'assets/icons/pokeball.svg',
                width: 208,
                height: 208,
                color: Colors.white10,
              ),
            ),

            // app bar area
            Positioned(
              child: AppBar(
                leading: IconButton(
                  icon: SvgPicture.asset(
                    height: 32,
                    width: 32,
                    'assets/icons/arrow_back.svg',
                    color: CustomColors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.transparent,
                title: Text(
                    widget.allPokemons[widget.currentIndex]["name"][0].toUpperCase() +
                        widget.allPokemons[widget.currentIndex]["name"].substring(1),
                    style: CustomTextStyle.headline),
                actions: [
                  Text(
                    '#${widget.allPokemons[widget.currentIndex]["id"].toString().padLeft(3, '0')}',
                    style: CustomTextStyle.subtitle2,
                  ),
                  const SizedBox(width: 24)
                ],
              ),
            ),

            // swap to next pokemon buttons
            if (widget.currentIndex != 0) Positioned(
              left: 24,
              top: 180,
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/chevron_left.svg",
                  color: CustomColors.white,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  setState(() {
                    widget.currentIndex -= 1;
                  });
                },
              )
            ),


            if (widget.currentIndex != widget.allPokemons.length-1) Positioned(
              right: 24,
              top: 180,
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/chevron_right.svg",
                  color: CustomColors.white,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  setState(() {
                    widget.currentIndex += 1;
                  });
                },
              )
            ),

            // main info area
            Positioned(
              bottom: 4,
              child: Container(
                padding: const EdgeInsets.only(top: 60, bottom: 20, left: 20, right: 20),
                height: MediaQuery.of(context).size.height - 290,
                width: MediaQuery.of(context).size.width - 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...types
                        ],
                      ),
                    ),
                    Center(
                      child: Text(
                          "About",
                          style: CustomTextStyle.subtitle1(mainColor)
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 48,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/weight.svg",
                                        height: 16,
                                        width: 16,
                                        color: CustomColors.dark,
                                      ),
                                      SizedBox(width: 8,),
                                      Text("${widget.allPokemons[widget.currentIndex]["weight"] / 10} kg", style: CustomTextStyle.body3)
                                    ],
                                  ),
                                ),

                                Text("Weight", style: CustomTextStyle.caption,)
                              ],
                            ),
                            const CustomDivider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: Row(
                                    children: [
                                      Transform.rotate(
                                        angle: 90 * 3.1415 / 180, // 90 angle for icon
                                        child: SvgPicture.asset(
                                          "assets/icons/straighten.svg",
                                          height: 16,
                                          width: 16,
                                          color: CustomColors.dark,
                                        ),
                                      ),
                                      const SizedBox(width: 8,),
                                      Text("${widget.allPokemons[widget.currentIndex]["height"] / 10} m", style: CustomTextStyle.body3)
                                    ],
                                  ),
                                ),

                                Text("Height", style: CustomTextStyle.caption,)
                              ],
                            ),
                            const CustomDivider(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    ...moves
                                  ]
                                ),

                                Text("Moves", style: CustomTextStyle.caption,)
                              ],
                            ),
                          ],

                        ),
                      ),
                    ),
                    Center(
                      child: Text("There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.", style: CustomTextStyle.body3)
                    ),
                    Center(
                      child: Text(
                          "Base Stats",
                          style: CustomTextStyle.subtitle1(mainColor)
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text("HP", style: CustomTextStyle.subtitle3(color: mainColor)),
                              Text("ATK", style: CustomTextStyle.subtitle3(color: mainColor)),
                              Text("DEF", style: CustomTextStyle.subtitle3(color: mainColor)),
                              Text("SATK", style: CustomTextStyle.subtitle3(color: mainColor)),
                              Text("SDEF", style: CustomTextStyle.subtitle3(color: mainColor)),
                              Text("SPD", style: CustomTextStyle.subtitle3(color: mainColor)),
                            ],
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 96,
                            width: 1,
                            child: Container(
                              color: CustomColors.light,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(children: [
                              ...statsValues
                            ],),
                          )
                        ]
                      ),
                    )
                  ],
                ),
              )
            ),

            // pokemon icon
            Positioned(
              top: 90,
              left: MediaQuery.of(context).size.width / 2 - 100,
              child: CachedNetworkImage(
                imageUrl: widget.allPokemons[widget.currentIndex]["sprites"]["other"]["official-artwork"]["front_default"],
                height: 200,
                width: 200,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
