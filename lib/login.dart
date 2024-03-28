import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sub extends StatelessWidget {
  const Sub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // 상태바,네비게이션바 간격 제거
        top: true, // 탑의 여백을 쓰겠다.
        child: Center(
          child: InkWell(
            child: Text(
              "두번째 페이지",
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).pop(); // 현재 페이지의 상태값 context
            },
          ),
        ),
      ),
    );
  }
}