import 'dart:convert';
import 'package:beverage/widget/beer_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/beer_model.dart';

class BeerPage extends StatefulWidget {
  const BeerPage({Key? key}) : super(key: key);

  @override
  State<BeerPage> createState() => _BeerPageState();
}

class _BeerPageState extends State<BeerPage> {
  List<Beer> _listBeer = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchBeers();
  }

  void _fetchBeers() async {
    var data = await http.get(Uri.parse('https://api.punkapi.com/v2/beers'));
    var jsonbody = jsonDecode(data.body);
    //print(jsonbody);

    for (int j = 0; j < jsonbody.length; j++) {
      _listBeer.add(Beer(
        name: jsonbody[j]['name'],
        tagline: jsonbody[j]['tagline'],
        description: jsonbody[j]['description'],
        image: jsonbody[j]['image_url'],
      ));
    }


  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beers"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return BeerCard(beers: _listBeer[index]);
              },
              itemCount: _listBeer.length,
            ),
          )
        ],
      ),
    );
  }
}
