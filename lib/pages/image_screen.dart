import 'package:flutter/material.dart';
import '../model/wonders_nature_model.dart';
import 'details_screen.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen(this.wonders, {Key? key}) : super(key: key);
  final Wonders wonders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 3),
                    pageBuilder: (_, __, ___) => DetailsScreen(wonders),
                  )); //BoxDecoration
            }, //Container
            child: Hero(
                tag: 'hero',
                transitionOnUserGestures: true,
                child: Transform.scale(
                    scale: 3.0,
                    child: Center(
                        child: Container(
                            height: 270,
                            width: 330,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.network(wonders.imageUrl).image,
                                  fit: BoxFit.cover),
                            )))))));
  }
}
