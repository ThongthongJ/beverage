import 'dart:convert';
import 'package:beverage/widget/cocktail_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/cocktail_model.dart';

class CocktailPage extends StatefulWidget {
  const CocktailPage({Key? key}) : super(key: key);

  @override
  State<CocktailPage> createState() => _CocktailPageState();
}

class _CocktailPageState extends State<CocktailPage> {
  List<Cocktail> _listCocktail = [];

  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchClocktail();
  }

  @override
  void _fetchClocktail() async {
    var data = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita&fbclid'));
    var jsonbody = jsonDecode(data.body)['drinks'];
    //print(jsonbody);

    for (int j = 0; j < jsonbody.length; j++) {
      _listCocktail.add(Cocktail(
        name: jsonbody[j]['strDrink'],
        image: jsonbody[j]['strDrinkThumb'],
        Category: jsonbody[j]['strCategory'],
      ));
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CocktailCard(cocktail: _listCocktail[index]);
              },
              itemCount: _listCocktail.length,
            ),
          )
        ],
      ),
    );
  }
}
