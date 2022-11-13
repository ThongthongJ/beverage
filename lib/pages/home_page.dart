import 'package:beverage/pages/beer_page.dart';
import 'package:beverage/pages/cocktail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/beverageBackground4.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/welcome.png'),
            SizedBox(height: 24.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                      hoverColor: Colors.teal,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BeerPage(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/images/beer-logo3.jpg',
                            scale: 2.4),
                      )),
                ),
                SizedBox(width: 48.0),
                Card(
                  child: InkWell(
                      hoverColor: Colors.teal,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CocktailPage(),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset('assets/images/cocktail-logo.jpg',
                            scale: 1.36),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
