import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/bottombar/search.dart';
import 'package:untitled2/bottombar/setting.dart';

class Membership1 extends StatefulWidget {
  Membership1({super.key});

  @override
  State<Membership1> createState() => _Membership1State();
}

class _Membership1State extends State<Membership1> {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0);

  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController pw2 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();

  @override
  void initState(){
    super.initState();
    id = TextEditingController(text: "");
    pw = TextEditingController(text: "");
    pw2 = TextEditingController(text: "");
    email = TextEditingController(text: "");
    name = TextEditingController(text: "");
  }

  @override
  void dispose(){
    id.dispose();
    pw.dispose();
    pw2.dispose();
    email.dispose();
    name.dispose();
    super.dispose();
  }

  void joins(String id, String pw, String name, String email) async {
    final dio = Dio();

    try {
      final response = await dio.post(
        "http://192.168.0.177:9090/user/join",
        data: {
          'id': id,
          'pw': pw,
          'name': name,
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        print("회원가입 성공!");
      } else {
        print("회원가입 실패: ${response.data}");
      }
    } catch (e) {
      print("회원가입 실패: $e");
    }
  }

  bool isValidEmail(String email) {
    // 이메일 주소의 정규식
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffDEE2E6),
        body: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: InkWell(
                        child: Icon(Icons.arrow_back),
                        onTap: () {
                          Navigator.of(context).pop(); // 현재 페이지의 상태값 context
                        },
                      ),
                    ),
                  ],
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: Text("계정 만들기",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff0085FF)
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: id,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        labelText: "아이디",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: pw,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "비밀번호",
                        border: OutlineInputBorder()),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: pw2,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "비밀번호 확인 ",
                        border: OutlineInputBorder()),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.markunread_rounded),
                        labelText: "이메일 ",
                        border: OutlineInputBorder()),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: "이름 ",
                        border: OutlineInputBorder()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color(0xff0085FF),
                    child: MaterialButton(
                      onPressed: () {
                        String joinId = id.text;
                        String joinPw = pw.text;
                        String joinPw2 = pw2.text;
                        String joinEmail = email.text;
                        String joinName = name.text;

                        if (joinId.length > 12) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("아이디는 12자리 이하로 입력하세요."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        if (joinPw.length > 12) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("비밀번호는 12자리 이하로 입력하세요."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                        if (joinPw != joinPw2) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("비밀번호가 일치하지 않습니다."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                        if (joinEmail.isEmpty || !isValidEmail(joinEmail)) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("유효한 이메일 주소를 입력하세요."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        if (joinName.length > 6) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("이름은 6자리 이하로 입력하세요."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }
                        joins(joinId, joinPw, joinName, joinEmail);
                      },
                      child: Text(
                        "계정 만들기",
                        style: style.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          padding: EdgeInsets.zero,
          color: Color(0xffDEE2E6),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyApp(),
                  )
                  );
                },
                child: Container(
                  width: 90,
                  height: 50,
                  child: Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),

              ),
              InkWell(
                child: Container(
                    width: 90,
                    height: 50,
                    child: Icon(
                      Icons.search_rounded,
                      size: 30,
                    )),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(),
                  )
                  );
                },
              ),
              InkWell(
                child: Container(
                  width: 90,
                  child: Image.asset(
                    "assets/keep.png",
                    width: 50,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Locker(),
                  )
                  );
                },
              ),
              InkWell(
                child: Container(
                  width: 90,
                  child: Image.asset(
                    "assets/setting.png",
                    width: 50,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Setting(),
                  )
                  );
                },
              ),
            ],
          ),
        )
    );
  }
}

