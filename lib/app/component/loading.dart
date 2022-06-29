import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget apploading({Color? color, double size = 40}) => SpinKitDualRing(
      color: color ?? Colors.amber,
      size: size,
      duration: Duration(milliseconds: 600),
    );
