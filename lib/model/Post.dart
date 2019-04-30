class Post {
  const Post({
   this.title,
   this.author,
   this.content,
   this.ImgUrl
});
  final String title;
  final String author;
  final String content;
  final String ImgUrl;

//  bool seleted=false;
}

final List<Post> posts=[
  Post(
    title:'测试数据1',
    author:'Tom',
    content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
    ImgUrl: 'http://119.23.51.242:8080/images/1555577867108_IMG_2765.JPG'
  ),
  Post(
      title:'测试数据2',
      author:'Gina',
      content:'　　习近平指出，中国政府和中国人民坚定同斯里兰卡人民站在一起，坚决支持斯方维护国家安全和稳定。',
      ImgUrl: 'http://119.23.51.242:8080/images/1555577867108_IMG_2766.JPG'
  ),
  Post(
      title:'测试数据3',
      author:'Nik',
      content:'南繁事业从50年代开始至今已经持续了60年，为我国种业创新和粮食安全做出了巨大的贡献。今天我们就一起来看看几代南繁人的奋斗故事。',
      ImgUrl: 'http://h.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=0d023672312ac65c67506e77cec29e27/9f2f070828381f30dea167bbad014c086e06f06c.jpg'
  ),
  Post(
      title:'测试数据4',
      author:'Marry',
      content:'最近阳标仁得到一个好消息，国家加大了对南繁基地的保护和建设，他所在的这片水稻育种基地的水利设施将得到高标准改善。',
      ImgUrl: 'https://resources.ninghao.net/images/overkill.png'
  ),
  Post(
      title:'测试数据5',
      author:'Shimish',
      content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: 'http://119.23.51.242:8080/images/1555577867108_IMG_2765.JPG'
  ),
  Post(
      title:'测试数据6',
      author:'Lihua',
      content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: 'http://119.23.51.242:8080/images/1555577867108_IMG_2766.JPG'
  ),
  Post(
      title:'测试数据7',
      author:'Yeuti',
      content:'　　新华社北京4月21日电  2019年4月21日，国家主席习近平就斯里兰卡发生系列爆炸事件向斯里兰卡总统西里塞纳致慰问电。',
      ImgUrl: 'http://119.23.51.242:8080/images/1555577867108_IMG_2765.JPG'
  ),

];