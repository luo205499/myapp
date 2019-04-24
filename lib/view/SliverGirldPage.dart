import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';

//void main() => runApp(new SliverGirldPage());

class SliverGirldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliverGirldPageState();
  }
}

class _SliverGirldPageState extends State<SliverGirldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            title: Text("Chunlong"),
            floating: true,
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Chunlong Flutter'.toUpperCase(),
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3.0,
                    color: Colors.white),
              ),
              background: Image.network(
                "https://resources.ninghao.net/images/overkill.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(6.0),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].ImgUrl,
            fit: BoxFit.cover,
          ),
        );
      }, childCount: posts.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: Material(
            borderRadius: BorderRadius.circular(18.0),
            elevation: 14.0,
            shadowColor: Colors.grey.withOpacity(0.5),
            child: Stack(
              children: <Widget>[
                AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                        posts[index].ImgUrl,
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                  top: 32.0,
                  left: 32.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        posts[index].title,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        posts[index].content,
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.redAccent.withOpacity(0.3),
                      highlightColor: Colors.redAccent.withOpacity(0.1),
                      onTap: () {
                        debugPrint("点击");
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: posts.length),
    );
  }
}
