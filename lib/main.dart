import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: MainPage() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;

  //  final urlImages = [
//    'https://kdukim0125.cafe24.com/event/001.png',
//    'https://kdukim0125.cafe24.com/event/002.png',
//    'https://kdukim0125.cafe24.com/event/003.png',
//    'https://kdukim0125.cafe24.com/event/004.png',
//    'https://kdukim0125.cafe24.com/event/005.png',
//    'https://kdukim0125.cafe24.com/event/006.png',
//    'https://kdukim0125.cafe24.com/event/007.png',
//  ];

  final urlImages = [
    'assets/images/001.png',
    'assets/images/002.png',
    'assets/images/003.png',
    'assets/images/004.png',
    'assets/images/005.png',
    'assets/images/006.png',
    'assets/images/007.png',
  ];

  var PowerCallList = ['절약하는 행동','이주일의 추천 게임','2023년, 크게 성장하는 파워콜!',
    '멋진 저녁, 그대와 함께', '2023년 계묘년 (癸卯年)','인생 즐겁게 살아야...','가자! 베트남 (지사 설립)'];

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Carousel Demo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 240,
                  autoPlay: true,
                  //            enlargeCenterPage:true,
                  //            enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: Duration(seconds: 2),
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),

                items: ['assets/images/001.png','assets/images/002.png','assets/images/003.png',
                  'assets/images/004.png','assets/images/005.png','assets/images/006.png','assets/images/007.png'].map((i) {
                  return Builder(
                      builder : (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin : EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Image.asset(i),
                              SizedBox( height:  6,),
                              if(i == 'assets/images/001.png')
                                Text("${PowerCallList[0]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                              if(i == 'assets/images/002.png')
                                Text("${PowerCallList[1]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                              if(i == 'assets/images/003.png')
                                Text("${PowerCallList[2]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                              if(i == 'assets/images/004.png')
                                Text("${PowerCallList[3]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                              if(i == 'assets/images/005.png')
                                Text("${PowerCallList[4]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                              if(i == 'assets/images/006.png')
                                Text("${PowerCallList[5]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                              if(i == 'assets/images/007.png')
                                Text("${PowerCallList[6]}", style:  TextStyle( fontSize: 14, fontWeight: FontWeight.w800),),
                            ],
                          ),

                        );
                      }
                  );
                }).toList(),

              ),
              const SizedBox(height: 3),
              buildIndicator(),
            ],
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: urlImages.length,
    effect: SlideEffect(
      dotWidth: 10,
      dotHeight: 10,
      activeDotColor: Colors.red,
      dotColor: Colors.black12,
    ),
  );
}

