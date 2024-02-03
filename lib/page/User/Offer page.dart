import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarouselSliderDemo(),
    );
  }
}

class CarouselSliderDemo extends StatefulWidget {
  @override
  _CarouselSliderDemoState createState() => _CarouselSliderDemoState();
}

class _CarouselSliderDemoState extends State<CarouselSliderDemo> {
  int _currentIndex = 0;
  final List<String> images = [
    'images/feed.jpeg',
    'images/feed.jpeg',
    'images/feed.jpeg',
    'images/feed.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider Demo'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                aspectRatio: 16/9,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  child: Center(
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                      width: 1000,
                      height: 500,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((url) {
              int index = images.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
