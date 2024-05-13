import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class FindId extends StatefulWidget {
  @override
  _FindIdState createState() => _FindIdState();
}

class _FindIdState extends State<FindId> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void updateUser(String id, String pw, String name) async {
    final dio = Dio();

    try {
      final response = await dio.post(
        "http://192.168.0.177:9090/user/login/update",
        data: {
          'id': id,
          'pw': pw,
          'name': name,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print("회원 수정 성공!");
      } else {
        print("회원 수정 실패: ${response.data}");
      }
    } catch (e) {
      print("회원 수정 실패: $e");
    }
  }

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
              controller: nameController,
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
              controller: emailController,
              decoration: InputDecoration(
                hintText: '이메일을 입력하세요',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String email = emailController.text;
                // 아이디 찾기 버튼을 눌렀을 때 수행할 작업
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0085FF)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('아이디 찾기'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String id = nameController.text;
                String pw = emailController.text;
                String name = nameController.text;
                updateUser(id, pw, name);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0085FF)),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: Text('회원 수정'),
            ),
          ],
        ),
      ),
    );
  }
}
