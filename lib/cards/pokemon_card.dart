import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/theme/colors.dart';
import 'package:pokedex/theme/styles/text_styles.dart';
import 'package:pokedex/utils/loading_indicator.dart';

class PokemonCard extends StatelessWidget {
  final String pokemonName;
  final int pokemonNumber;
  final String imageUrl;

  const PokemonCard({
    Key? key,
    required this.pokemonName,
    required this.pokemonNumber,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      width: 104,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            // Background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 44,
                decoration: const BoxDecoration(
                  color: CustomColors.background,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topLeft: Radius.circular(7.0),
                    topRight: Radius.circular(7.0),
                  ),
                ),
              ),
            ),
            // Image
            Center(
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 72,
                width: 70,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LoadingIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            // Pokemon Number
            Positioned(
              top: 8,
              right: 8,
              child: Text(
                '#${pokemonNumber.toString().padLeft(3, '0')}',
                style: CustomTextStyle.caption
              ),
            ),
            // Pokemon Name
            Positioned(
              bottom: 4,
              left: 8,
              right: 8,
              child: Center(
                child: Text(
                  pokemonName[0].toUpperCase()+pokemonName.substring(1),
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.body3
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}