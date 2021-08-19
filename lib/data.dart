import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Data {
  final int id;
  final String imageUrl;
  final String title;
  final String title1;
  final Icon icon;

  const Data({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.title1,
    @required this.icon,
  });
}

const Dummydata = const [
  Data(
    id:0,
    title: 'The perfect product for your skin type.',
    imageUrl: 'image/1.png',
    title1: 'Find products that work for your skin.',
    icon: Icon(
      Icons.favorite_border,
      color: Colors.orange,
      size: 24.0,
    ),
  ),
  Data(
    id: 1,
    title: 'Daily routine and skincare guides.',
    imageUrl: 'image/2.png',
    title1: 'Notifications and reminders just for you.',
    icon: Icon(
      Icons.alarm,
      color: Colors.blue,
      size: 24.0,
    ),
  ),
  Data(
    id: 2,
    title: 'Connect with other skincare lovers.',
    imageUrl: 'image/3.png',
    title1: 'Engage with others in the community.',
    icon: Icon(
      Icons.accessibility_new_outlined,
      color: Colors.red,
      size: 24.0,
    ),
  ),
];
