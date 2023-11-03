import 'dart:math';
import 'dart:ui';

import 'package:logger/logger.dart';

final Logger devLogger = Logger();

class MyUtils {

  static Color randomColor() {
    return Color(Random().nextInt(0xffffffff));
  }

  static List<String> myPlayList = <String>[
    "https://cdn.pixabay.com/photo/2018/04/29/00/24/flower-3358694_1280.jpg",
    "https://cdn.pixabay.com/photo/2017/05/30/07/45/flower-2356096_1280.jpg",
    "https://cdn.pixabay.com/photo/2021/07/12/18/13/flowers-6415255_1280.jpg",
    "https://cdn.pixabay.com/photo/2021/04/06/00/35/rose-6154936_1280.jpg",
  ];

}