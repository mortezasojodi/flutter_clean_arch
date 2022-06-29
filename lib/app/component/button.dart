import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? child;
  final Color color;
  final Color? textcolor;
  final double borderRadius;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? onPrimary;
  final double? borderwidth;
  final EdgeInsetsGeometry? padding;
  final Gradient? gradient;
  const CustomButton(
      {Key? key,
      this.onTap,
      this.child,
      this.color = Colors.blue,
      this.textcolor,
      this.onPrimary = Colors.grey,
      this.borderRadius = 30,
      this.width = 200,
      this.height = 50,
      this.borderColor,
      this.borderwidth,
      this.gradient,
      this.padding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
          gradient: gradient,

          // border: border,
          borderRadius: BorderRadius.circular(borderRadius)),
      width: width ?? null,
      height: height ?? null,

      child: ElevatedButton(
        child: child,
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding,
          primary: color,
          onPrimary: onPrimary,
          shape: RoundedRectangleBorder(
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      // child: Material(

      //   color: btncolor,
      //   elevation: 6,
      //   borderRadius: BorderRadius.circular(borderRadius),
      //   child: MaterialButton(

      //     onPressed: callback,
      //     minWidth: minWidth,
      //     height: height,
      //     child: text,
      //   ),
      // ),
    );
  }
}

// BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//                 color: Colors.grey.shade200,
//                 offset: Offset(2, 4),
//                 blurRadius: 5,
//                 spreadRadius: 2)
//           ],
//           gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [
//                 Colors.lightBlueAccent,
//                       Colors.blue,]))
