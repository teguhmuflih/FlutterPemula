import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/wisataSukabumiList.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate(
                  [appHeader(context), backgroundHeader()])),
          SliverPadding(
            padding: EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
              crossAxisCount: 2,
              children: wisataSukabumi.map((item) {
                return Card(
                  elevation: 4.0,
                  child: Stack(
                    children: <Widget>[
                      // Text
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black87,
                                  Colors.black26,
                                  Colors.black12,
                                  Colors.transparent
                                ])),
                      ),
                      InkWell(
                        splashColor: Colors.white.withAlpha(30),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return DetailScreen(item: item);
                              })); // navigasi ke detail image
                        },
                        child: Ink.image(
                          image: AssetImage(item.imageAsset),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 15.0,
                        left: 15.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                          ],
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget appHeader(BuildContext context) {
  return Container(
    child: AppBar(
      title: Text(
        "Tempat Wisata Sukabumi",
        style: TextStyle(fontFamily: 'Zen Loop', fontSize: 25),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueAccent,
      actions: <Widget>[
      ],
    ),
  );
}

Widget backgroundHeader() {
  return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40))),
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Wilujeng sumping!',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            Text(
              'List Tempat Wisata di Sukabumi',
              style: TextStyle(
                  fontFamily: 'Raleway', fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ));
}
