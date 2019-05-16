import 'package:flutter/material.dart';
import 'package:myapp/model/Post.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class IndexPage extends StatelessWidget {
  Widget _swiperBuilder(BuildContext context, int index) {
    return (Image.network(
      posts[index].url,
      fit: BoxFit.cover,
    ));
  }
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Container(
    width: MediaQuery.of(context).size.width,
    height: 200.0,
    child: Swiper(
    itemBuilder: _swiperBuilder,
    itemCount: posts.length,
    pagination: new SwiperPagination(
    builder: DotSwiperPaginationBuilder(
    color: Colors.black54,
    activeColor: Colors.white,
    )),
    control: new SwiperControl(),
    scrollDirection: Axis.horizontal,
    autoplay: true,
    onTap: (index) => print('点击了第$index个'),
    )),
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("热门游戏"),
        ),
        new SizedBox(
          height: 100.0,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5, childAspectRatio: 1.4),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Image.network(
                          posts[index].ImgUrl,
                          fit: BoxFit.cover,
                          height: 20.0,
                          width: 80.0,
                        ),
                      ),
                      Text(
                        posts[index].title,
                        style: TextStyle(color: Colors.black38, fontSize: 12.0),
                      ),
                    ],
                  ),
                );
              },
              itemCount: posts.length),
        ),
       new Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
          height: 1.0,
          color: Colors.black12,
        ),
       new Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text("我的关注，16个小时前"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Text("宁采臣、在唱歌"),
              ),
             /* Text(
                "直播了当当电台",
                style: TextStyle(color: Colors.black26),
              ),*/
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black12,
                ),
              ),
            ],
          ),
        ),
       new Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 1.0,
          color: Colors.black12,
        ),
       new Container(
          margin: EdgeInsets.all(10.0),
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("推荐直播"),
              InkWell(
                child: new Row(
                  children: <Widget>[
                    Text(
                      "换一换",
                      style: TextStyle(color: Colors.black12),
                    ),
                    Icon(
                      Icons.autorenew,
                      color: Colors.black12,
                    ),
                  ],
                ),
                onTap: () {},
              )
            ],
          ),
        ),
       new SizedBox(
          height: 610.0,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.3),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        child: Image.network(
                          posts[index].ImgUrl,
                          fit: BoxFit.cover,
                          height: 100.0,
                          width: 180.0,
                        ),
                      ),
                      Text(posts[index].author),
                      Text(
                        posts[index].title,
                        style: TextStyle(color: Colors.black38, fontSize: 12.0),
                      ),
                    ],
                  ),
                );
              },
              itemCount: posts.length),
        )
      ],
    );
  }

}


