import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/model/wisata_sukabumi.dart';

class DetailScreen extends StatelessWidget {
  final WisataSukabumi item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    final List<String> _tabs = ['Deskripsi', 'Lokasi', 'Foto'];
    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  expandedHeight: 300.0,
                  pinned: true,
                  backgroundColor: Colors.redAccent,
                  forceElevated: innerBoxIsScrolled,
                  flexibleSpace: Stack(
                    children: <Widget>[
                      FlexibleSpaceBar(
                        background: Image.asset(
                          item.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black45,
                                  Colors.black26,
                                  Colors.black12,
                                ])),
                      ),
                      FlexibleSpaceBar(
                        titlePadding: EdgeInsets.only(bottom: 65),
                        centerTitle: true,
                        title: Text(
                          item.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  actions: <Widget>[FavoriteButton()],
                  bottom: TabBar(
                    indicatorColor: Colors.redAccent,
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          // Content Tab
          body: TabBarView(children: [
            // Tab Deskripsi
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(20.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          Text(
                            item.description,
                            style:
                            TextStyle(fontFamily: 'Raleway', fontSize: 16),
                          ),
                        ]),
                      ),
                    ),
                  ],
                );
              }),
            ),
            // Tab Lokasi
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.all(20.0),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            Text(
                              item.location,
                              style:
                              TextStyle(fontFamily: 'Raleway', fontSize: 16),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  );
                }),
            ),
            // Tab Foto Lainnya
            SafeArea(
              top: false,
              bottom: false,
              child: Builder(builder: (BuildContext context) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(20.0),
                      sliver: SliverGrid.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                        children: item.imageUrls.map((url) {
                          return Card(
                            child: Image.network(
                              url,
                              fit: BoxFit.cover,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget contentTab() {
  return SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(20.0),
              sliver: SliverGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
                children: [],
              ),
            ),
          ],
        );
      },
    ),
  );
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
