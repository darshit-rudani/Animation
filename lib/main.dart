import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: CarouselWithIndicatorDemo(),
    );
  }
}

final List<Widget> imageSliders = Dummydata.map(
  (item) => Container(
    child: Image.asset(
      item.imageUrl,
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ),
).toList();

final List<Widget> icon = Dummydata.map(
  (item) => Container(
    child: item.icon,
  ),
).toList();

final List<Widget> textSlide = Dummydata.map(
  (item) => Stack(
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 60, right: 60),
        child: Text(
          item.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40,
          ),
        ),
      ),
    ],
  ),
).toList();

final List<Widget> textSlide2 = Dummydata.map(
  (item) => Container(
    child: Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 50, right: 50),
          child: Text(
            item.title1,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30,color: Colors.grey),
          ),
        ),
      ],
    ),
  ),
).toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final CarouselController _controller1 = CarouselController();
  final CarouselController _controller2 = CarouselController();
  final CarouselController _controller3 = CarouselController();

  var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  CarouselSlider(
                    items: imageSliders,
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: size.height / 2,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _current = index;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: CarouselSlider(
                      items: textSlide,
                      carouselController: _controller1,
                      options: CarouselOptions(
                        height: 450,
                        scrollDirection: Axis.vertical,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: false,
                        onPageChanged: (index1, reason) {
                          setState(
                            () {
                              _current = index1;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: CarouselSlider(
                      items: textSlide2,
                      carouselController: _controller2,
                      options: CarouselOptions(
                        height: 420,
                        scrollDirection: Axis.vertical,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: false,
                        onPageChanged: (index2, reason) {
                          setState(
                            () {
                              _current = index2;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Dummydata.asMap().entries.map(
                      (entry) {
                        return GestureDetector(
                          onTap: () {
                            _controller.animateToPage(entry.key);
                            _controller1.animateToPage(entry.key);
                            _controller2.animateToPage(entry.key);
                            _controller3.animateToPage(entry.key);
                          },
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                _current == entry.key ? 0.9 : 0.4,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                  Center(
                    child: Text(
                      'Skip',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height / 2 - 35,
              left: size.width / 2 - 35,
              child: Container(
                height: 70,
                width: 70,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CarouselSlider(
                    items: icon,
                    carouselController: _controller3,
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      scrollDirection: Axis.vertical,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      onPageChanged: (index3, reason) {
                        setState(
                          () {
                            _current = index3;
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
