import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/beer_model.dart';

class BeerCard extends StatelessWidget {
  final Beer beers;

  BeerCard({required this.beers});

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
                    beers.image,
                    scale: 8.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 32.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('NAME: ${beers.name}',
                          style: TextStyle(fontSize: 18.0)),
                      SizedBox(height: 8.0),
                      Text('TagLine: ${beers.tagline}'),
                      Text('First brewed: ${beers.first_brewed}'),
                      Text('Contributed By: ${beers.contributed}')
                    ],
                  ),
                ],
              ),
            ),
            Text('Price: ${beers.price}฿'),
            SizedBox(width: 80.0),
          ],
        ),
      ),
    );
  }
}
