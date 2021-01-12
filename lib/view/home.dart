import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plan_app/view/details.dart';

final List<String> imgList = ['assets/hue_saturation.png', 'assets/layer1.png'];
final List<String> itemImage = ['assets/layer2.png', 'assets/layer3.png'];

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00686f),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/menue.png',
                      height: 20,
                      width: 20,
                    ),
                    Image.asset(
                      'assets/person.png',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 45,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'search',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.grey[500],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffff7d67),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset('assets/equlizer.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: imgList.map((item) {
                  print('$item');
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (__) => DetailsPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                item,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 0,
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(right: 10, top: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xffff7e67),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            left: 10,
                            child: Text(
                              'Ficus retusa - \$60',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                    autoPlay: true,
                    aspectRatio: 1.3,
                    enlargeCenterPage: true,
                    viewportFraction: 0.6),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Positioned(
                    left: 10,
                    child: Text(
                      'Populer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                current == index ? Colors.white : Colors.grey),
                      );
                    }).toList(),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CarouselSlider(
                items: itemImage.map((item) {
                  print('$item');
                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          bottom: 10,
                          right: 0,
                          left: 10,
                          child: Row(
                            children: [
                              Image.asset(
                                item,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: 'Succulent\n',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                      children: [
                                    TextSpan(
                                        text: '\$75.00',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15)),
                                  ])),
                            ],
                          ),
                        ),
                        Positioned(
                            right: 0,
                            bottom: 10,
                            child: Container(
                              height: 30,
                              width: 30,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(right: 10, top: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xffff7e67),
                                  borderRadius: BorderRadius.circular(100)),
                              child: Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    },
                    initialPage: 0,
                    reverse: false,
                    aspectRatio: 3.5,
                    enlargeCenterPage: true,
                    viewportFraction: 0.6),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xff00686f),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'a',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'b',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'b',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'b',
          ),
        ],
      ),
    );
  }
}
