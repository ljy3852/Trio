import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/member/Membership1.dart';
import 'package:flutter_web/member/login.dart';
import 'package:flutter_web/member/Membership1.dart';
import 'package:flutter_web/member/FindId.dart';
import 'package:flutter_web/member/FindPwd.dart';


class login1 extends StatefulWidget {
  login1({super.key});

  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {
  TextEditingController _id = TextEditingController();
  TextEditingController _pw = TextEditingController();

  @override
  void initState(){
    super.initState();
    TextEditingController _id = TextEditingController(text: ""); // 한번만 사용 Text컨트롤러
    TextEditingController _pw = TextEditingController(text: "");
  }

  void user(String id, String pw) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.0.177:9090",
        contentType: "application/json",
      ),
    );

    try {
      Response res = await dio.post(
        "/user/login",
        data: {
          "id": id,
          "pw": pw,
        },
      );

      if (res.statusCode == 200) {
        print(res.data);

      } else {
        print("Login failed");

      }
    } catch (e) {
      print("Error: $e");
    }
  }

  bool login(String id, String pw) {
    bool result = false;
    if (id.length > 13 ) {
      return result;
    }
    if (pw.length > 13 || pw.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
      return result;
    }

    result = true;
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 20),
              child: Container(
                child: Text(
                  "Music",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff0085FF)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Container(
                  child: Text(
                    "로그인",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0085FF)
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF9E000),
                    ),
                    width: 400,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset(
                            "assets/kakao.png",
                            width: 45,
                            height: 45,
                          ),
                        ),
                        Container(
                          child: Text(
                            "카카오톡으로 시작하기",
                            style: TextStyle(
                              fontSize: 19,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 15),
                width: 400,
                child: TextField(

                  decoration: InputDecoration(labelText: 'ID'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _id,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 400,
                child: TextField(
                  maxLength: 12,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: _pw,
                  obscureText: true,
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff0085FF),
                ),
                margin: EdgeInsets.only(top: 40),
                width: 400,
                height: 50,
                child: InkWell(
                  child: Center(
                    child: Text(
                      "로 그 인",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    String id = _id.text;
                    String pw = _id.text;
                    user(id, pw);
                    bool result = login(id, pw);
                    if (result) {
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) =>
                            AlertDialog(
                              backgroundColor: Color(0xffDEE2E6),
                              title: Text("로그인 실패"),
                              content: Text("아이디 및 비밀번호를 확인해주세요"),
                              actions: [
                                TextButton(onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                    child: Text("확인"),
                                ),
                              ],
                            )
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 120, top: 10),
                  child: InkWell(
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Membership1(),
                      ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10, top: 10),
                  child: InkWell(
                    child: Text(
                      "아이디찾기",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FindId(),
                      ));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: InkWell(
                    child: Text(
                      "비밀번호 찾기",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => FindPwd(),
                      ));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


