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
  with  SingleTickerProviderStateMixin {

  List<Wonders> wonders = allItems;
  late AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<double> _animationDropDown;
  bool show = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _animationDropDown = Tween(begin: 0.0, end: 0.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
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
            leading: Icon(Icons.menu),
            actions: [
              Icon(Icons.favorite),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ],
            title: Text("Wonders of nature"),
            centerTitle: true,
            flexibleSpace: const styleAppBar()),
        body:
        ListView.builder(
            itemCount: wonders.length,
            itemBuilder: (context, index){
              final wonder = wonders[index];
            return
                Container(
                padding:  EdgeInsets.all(6),
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                    child: InkWell(
                        onTap: () => Navigator.push(context,PageTransition(type: PageTransitionType.topToBottom,duration:
                         Duration(seconds:1), child:  DetailsScreen(wonder)),
                        ),
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                          child:
                          Column(
                              children: [
                          FadeInImage.assetNetwork(
                            placeholder: 'assets/images/loading.gif',
                            image: wonder.imageUrl,
                            fadeInDuration: Duration(seconds: 4),
                          ),
                            Row( children: [
                              Padding(padding: EdgeInsets.only(left: 5),
                              child:
                              Text(
                              wonder.title,
                              style: const TextStyle(
                                color: Colors.indigo,
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'AbrilFatface',
                                  fontSize: 15),
                              )),
                      Container(
                          width: 30,
                          child: RotationTransition(
                              turns: _animationDropDown,
                              child:
                              InkWell(
                                child:
                                GestureDetector(
                                  onTap: ()
                                  {   setState(() {
                                    if (show) {
                                      _controller.forward();
                                    } else {
                                      _controller.reverse();
                                    }
                                    setState(() {
                                      show = !show;
                                         });});},
                                  child:  const Icon(
                                      Icons.arrow_drop_down,
                                      size: 40),
                          )),
                          ))]),
                      SizeTransition(
                          sizeFactor: _animation,
                          axis: Axis.vertical,
                          child: SizedBox(
                            height: 90,
                            child:
                            Padding(padding: EdgeInsets.only(left: 6),
                              child:
              ListTile(
              key: Key('list_item_$index'),
              title:
                              Text(wonder.subtitle, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, fontFamily: 'Kurale', height: 1.5),
                              ),
                            ),
                      )))]))));
            }));
  }}