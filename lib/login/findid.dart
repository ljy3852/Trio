import 'package:flutter/material.dart';

class FindId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 찾기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '아이디 찾기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20),
            Text(
              '이름',
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: '이름을 입력하세요',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '이메일',
              style: TextStyle(fontSize: 16),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: '이메일을 입력하세요',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 아이디 찾기 버튼을 눌렀을 때 수행할 작업
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0085FF)), // 버튼의 색상을 0xff0085FF로 설정
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // 버튼의 글자 색상을 화이트로 설정
              ),
              child: Text('아이디 찾기'),
            ),
          ],
        ),
      ),
    );
  }
}