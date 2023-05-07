import 'package:flutter/material.dart';
import 'package:week13_flutter_animation/const/gradient_app_bar.dart';
import 'package:week13_flutter_animation/pages/second_screen.dart';
import '../model/wonders_nature_model.dart';
import 'image_screen.dart';

class DetailsScreen extends StatelessWidget {
  final Wonders wonders;

  const DetailsScreen(this.wonders, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListScreen()),
              );
            }),
            actions: [
              IconButton(
                  icon: new Icon(Icons.close),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListScreen()),
                    );
                  })
            ],
            backgroundColor: Colors.transparent,
            title: Text(wonders.title),
            centerTitle: true,
            flexibleSpace: const StyleAppBar()),
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
                                  transitionDuration: Duration(seconds: 1),
                                  pageBuilder: (_, __, ___) =>
                                      ImageScreen(wonders),
                                ));
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
                                              image: Image.network(
                                                      wonders.imageUrl)
                                                  .image,
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15))))),
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
                    ]))));
  }
}
