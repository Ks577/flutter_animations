import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:week13_flutter_animation/const/gradient_app_bar.dart';
import '../model/wonders_nature_model.dart';
import 'details_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen>
    with SingleTickerProviderStateMixin {
  List<Wonders> wonders = allItems;
  late final Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Wonders of nature"),
            centerTitle: true,
            flexibleSpace: const StyleAppBar()),
        body: ListView.builder(
            itemCount: wonders.length,
            itemBuilder: (context, index) {
              var wonder = wonders[index];
              return Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: InkWell(
                      onTap: () => Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.topToBottom,
                                duration: Duration(seconds: 1),
                                child: DetailsScreen(wonder)),
                          ),
                      child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(children: [
                            FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image: wonder.imageUrl,
                              fadeInDuration: Duration(seconds: 4),
                            ),
                            ExpansionTile(
                                title: Text(
                                  wonder.title,
                                  style: const TextStyle(
                                      color: Colors.indigo,
                                      height: 2,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'AbrilFatface',
                                      fontSize: 15),
                                ),
                                children: [
                                  Text(
                                    wonder.subtitle,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Kurale',
                                        height: 1.5),
                                  ),
                                  SizedBox(height: 15)
                                ])
                          ]))));
            }));
  }
}
