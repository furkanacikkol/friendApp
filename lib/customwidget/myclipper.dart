import 'package:flutter/material.dart';

class MyClipper extends StatelessWidget {
  String image;

  MyClipper(@required this.image);

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
            child: Text("Profilim",style:  TextStyle(fontSize: 64, fontFamily: "Poppins",color: Colors.white),
              textAlign: TextAlign.center,
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
