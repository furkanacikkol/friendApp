import 'package:flutter/material.dart';

class MyClipper extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: CurveClipper(),
        child: Container(
          padding: EdgeInsets.only(left: 40, top: 50, right: 20),
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white38
          ),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/images/male.png'),
              ),
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    // path starts with (0.0, 0.0) point (1)
    path.lineTo(0.0, size.height - 150);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 150);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
