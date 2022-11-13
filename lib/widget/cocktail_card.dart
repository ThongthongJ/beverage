import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/cocktail_model.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;

  CocktailCard({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 40.0),
                  //Icon(Icons.no_drinks, size: 96.0),
                  Image.network(
                    cocktail.image,
                    scale: 8.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NAME: ${cocktail.name}'),
                      SizedBox(height: 8.0),
                      Text('Category: ${cocktail.Category}'),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.remove,
              ),
            ),
            SizedBox(width: 32.0),
            Container(
              child: Text('10'),
            ),
            SizedBox(width: 32.0),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.add,
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
    ;
  }
}
