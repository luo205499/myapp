import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
class Post {
  const Post({
   this.title,
   this.author,
   this.content,
   this.ImgUrl,
    this.url
});
  final String title;
  final String author;
  final String content;
  final String ImgUrl;
  final String url;


//  bool seleted=false;
}
List imgUrl=[];

addPtoto(){
  imgUrl.add({"url":"http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg"});
  imgUrl.add({"url":"http://c.hiphotos.baidu.com/image/pic/item/30adcbef76094b36de8a2fe5a1cc7cd98d109d99.jpg"});
  imgUrl.add({"url":"http://h.hiphotos.baidu.com/image/pic/item/7c1ed21b0ef41bd5f2c2a9e953da81cb39db3d1d.jpg"});
  imgUrl.add({"url":"http://g.hiphotos.baidu.com/image/pic/item/55e736d12f2eb938d5277fd5d0628535e5dd6f4a.jpg"});
  imgUrl.add({"url":"http://e.hiphotos.baidu.com/image/pic/item/4e4a20a4462309f7e41f5cfe760e0cf3d6cad6ee.jpg"});
  imgUrl.add({"url":"http://b.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81b94575cfb93eb13533fa40a2.jpg"});
  imgUrl.add({"url":"http://e.hiphotos.baidu.com/image/pic/item/4bed2e738bd4b31c1badd5a685d6277f9e2ff81e.jpg"});
  imgUrl.add({"url":"http://g.hiphotos.baidu.com/image/pic/item/0d338744ebf81a4c87a3add4d52a6059252da61e.jpg"});
  imgUrl.add({"url":"http://a.hiphotos.baidu.com/image/pic/item/f2deb48f8c5494ee5080c8142ff5e0fe99257e19.jpg"});
  imgUrl.add({"url":"http://f.hiphotos.baidu.com/image/pic/item/4034970a304e251f503521f5a586c9177e3e53f9.jpg"});
  imgUrl.add({"url":"http://b.hiphotos.baidu.com/image/pic/item/279759ee3d6d55fbb3586c0168224f4a20a4dd7e.jpg"});
  imgUrl.add({"url":"http://img2.xkhouse.com/bbs/hfhouse/data/attachment/forum/corebbs/2009-11/2009113011534566298.jpg"});
  imgUrl.add({"url":"http://a.hiphotos.baidu.com/image/pic/item/e824b899a9014c087eb617650e7b02087af4f464.jpg"});
  imgUrl.add({"url":"http://c.hiphotos.baidu.com/image/pic/item/9c16fdfaaf51f3de1e296fa390eef01f3b29795a.jpg"});
  imgUrl.add({"url":"http://d.hiphotos.baidu.com/image/pic/item/b58f8c5494eef01f119945cbe2fe9925bc317d2a.jpg"});
  imgUrl.add({"url":"http://h.hiphotos.baidu.com/image/pic/item/902397dda144ad340668b847d4a20cf430ad851e.jpg"});
  imgUrl.add({"url":"http://b.hiphotos.baidu.com/image/pic/item/359b033b5bb5c9ea5c0e3c23d139b6003bf3b374.jpg"});
  imgUrl.add({"url":"http://a.hiphotos.baidu.com/image/pic/item/8d5494eef01f3a292d2472199d25bc315d607c7c.jpg"});
  imgUrl.add({"url":"http://b.hiphotos.baidu.com/image/pic/item/e824b899a9014c08878b2c4c0e7b02087af4f4a3.jpg"});
  imgUrl.add({"url":"http://g.hiphotos.baidu.com/image/pic/item/6d81800a19d8bc3e770bd00d868ba61ea9d345f2.jpg"});
//  return (imgUrl[index]["url"]);
  return imgUrl;
}

 photo(int index){
    return addPtoto()[index]["url"];
}
final List<Post> posts=[
  Post(
    title:'测试数据1',
    author:'Tom',
    content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
    ImgUrl: 'http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg',
      url:'http://e.hiphotos.baidu.com/image/pic/item/a1ec08fa513d2697e542494057fbb2fb4316d81e.jpg',
  ),
  Post(
      title:'测试数据2',
      author:'Gina',
      content:'　　习近平指出，中国政府和中国人民坚定同斯里兰卡人民站在一起，坚决支持斯方维护国家安全和稳定。',
      ImgUrl: 'http://c.hiphotos.baidu.com/image/pic/item/30adcbef76094b36de8a2fe5a1cc7cd98d109d99.jpg',
      url:"http://c.hiphotos.baidu.com/image/pic/item/30adcbef76094b36de8a2fe5a1cc7cd98d109d99.jpg"
  ),
  Post(
      title:'测试数据3',
      author:'Nik',
      content:'南繁事业从50年代开始至今已经持续了60年，为我国种业创新和粮食安全做出了巨大的贡献。今天我们就一起来看看几代南繁人的奋斗故事。',
      ImgUrl: 'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg',
      url:"http://h.hiphotos.baidu.com/image/pic/item/7c1ed21b0ef41bd5f2c2a9e953da81cb39db3d1d.jpg"
  ),
  Post(
      title:'测试数据4',
      author:'Marry',
      content:'最近阳标仁得到一个好消息，国家加大了对南繁基地的保护和建设，他所在的这片水稻育种基地的水利设施将得到高标准改善。',
      ImgUrl: 'https://resources.ninghao.net/images/overkill.png',
      url:"http://g.hiphotos.baidu.com/image/pic/item/55e736d12f2eb938d5277fd5d0628535e5dd6f4a.jpg"
  ),
  Post(
      title:'测试数据5',
      author:'Shimish',
      content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: 'http://h.hiphotos.baidu.com/image/pic/item/7c1ed21b0ef41bd5f2c2a9e953da81cb39db3d1d.jpg',
      url:"http://e.hiphotos.baidu.com/image/pic/item/4e4a20a4462309f7e41f5cfe760e0cf3d6cad6ee.jpg"
  ),
  Post(
      title:'测试数据6',
      author:'Lihua',
      content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: 'http://g.hiphotos.baidu.com/image/pic/item/55e736d12f2eb938d5277fd5d0628535e5dd6f4a.jpg',
      url:"http://a.hiphotos.baidu.com/image/pic/item/f2deb48f8c5494ee5080c8142ff5e0fe99257e19.jpg"
  ),
  Post(
      title:'测试数据7',
      author:'jloka',
      content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: 'http://e.hiphotos.baidu.com/image/pic/item/4e4a20a4462309f7e41f5cfe760e0cf3d6cad6ee.jpg',
      url:"http://b.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81b94575cfb93eb13533fa40a2.jpg"
  ),
  Post(
      title:'测试数据8',
      author:'Yeuti',
      content:'系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: "http://b.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c81b94575cfb93eb13533fa40a2.jpg",
      url:"http://g.hiphotos.baidu.com/image/pic/item/0d338744ebf81a4c87a3add4d52a6059252da61e.jpg"
  ),
  Post(
      title:'测试数据9',
      author:'koyu',
      content:'一起来捉妖属性克制怎么看？每一只妖灵都有着克制与被克制的相关联系，要想打出爆发输出，弄清楚一起来捉妖克制关系是非常有必要的，下面给大家带来一起来捉妖克制表，一起来看看吧~',
      ImgUrl: "http://a.hiphotos.baidu.com/image/pic/item/e824b899a9014c087eb617650e7b02087af4f464.jpg",
      url:"http://a.hiphotos.baidu.com/image/pic/item/e824b899a9014c087eb617650e7b02087af4f464.jpg"
  ),

];