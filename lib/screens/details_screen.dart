import 'package:flutter/material.dart';
import '../const/appBar_style.dart';
import '../model/model_wonder.dart';
import 'image_screen.dart';
import 'list_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Wonders wonders;

  const DetailsScreen(this.wonders, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ListScreen(),
            ),
          );
        }),
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListScreen(),
                  ),
                );
              })
        ],
        backgroundColor: Colors.transparent,
        title: Text(wonders.title),
        centerTitle: true,
        flexibleSpace: const StyleAppBar(),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white38,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 1),
                      pageBuilder: (_, __, ___) => ImageScreen(wonders),
                    ),
                  );
                }, //Container
                child: //
                    Hero(
                  tag: 'hero',
                  transitionOnUserGestures: true,
                  child: Container(
                    width: 150,
                    height: 150,
                    margin: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image.network(wonders.imageUrl).image,
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Container(
                //color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  wonders.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 18,
                      height: 2,
                      fontFamily: 'Kurale'),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
