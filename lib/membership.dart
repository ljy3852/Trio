import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea( // 상태바,네비게이션바 간격 제거
        top: true, // 탑의 여백을 쓰겠다.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Music",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0085FF)
                ),
              ),
            ),


            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: Text("회원가입",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0085FF)
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}