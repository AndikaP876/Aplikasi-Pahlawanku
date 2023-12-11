import 'package:flutter/material.dart';
import 'package:myhero/detail_screen.dart';
import 'package:myhero/model/heroes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pahlawanku',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Staatliches',
          fontSize: 25,
          ),),
        backgroundColor: Colors.red[900],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return HeroesList();
          } else if (constraints.maxWidth <= 1200) {
            return HeroesGrid(gridCount: 4,);
          } else {
            return HeroesGrid(gridCount: 6,);
          }
        },
      ),
    );
  }
}

class HeroesList extends StatelessWidget {
  const HeroesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Heroes hero = heroesList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(hero: hero,);
            }));
          },
          child: Card(
            color: Color.fromARGB(255, 237, 236, 236),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Hero(
                      tag: hero.imageAsset, 
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          hero.imageAsset,
                        ),
                      )
                    ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          hero.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 185, 28, 28),
                            fontFamily: 'Oxygen',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          hero.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: heroesList.length,
    );
  }
}

class HeroesGrid extends StatelessWidget {
  final int gridCount;

  const HeroesGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: heroesList.map((hero) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(hero: hero);
              }));
            },
            child: Card(
              color: Color.fromARGB(255, 237, 236, 236),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Expanded(
                    child: Hero(
                      tag: hero.imageAsset, 
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          hero.imageAsset,
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      hero.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
                    child: Text(
                      hero.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}