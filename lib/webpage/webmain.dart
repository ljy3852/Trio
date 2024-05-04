import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WebMain extends StatelessWidget {
  const WebMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea(
        top: true,
        child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "Music",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0085FF)),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
