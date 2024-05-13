import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Membership1 extends StatefulWidget {
  Membership1({super.key});

  @override
  State<Membership1> createState() => _Membership1State();
}

class _Membership1State extends State<Membership1> {
  TextStyle style = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 20.0);

  //텍스트입력값 가져오기 = Controller
  TextEditingController email = TextEditingController();
  TextEditingController pw = TextEditingController();
  TextEditingController pw2 = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController id = TextEditingController();

  @override
  //initState 는 Flutter 위젯의 상태가 초기화될 때 호출되는 메소드
  // 이 메소드는 StatefulWidget 클래스에서 오버라이드 하여 상태 초기화 로직을 구현할 수 있음
  // void initState(){
  //super.initState 코드는 현재 클래스에서 오버라이드 된
  // initState() 메서드 내에서 상위 클래스의 initState() 메서드를 호출
  // super.initState();
  // id = TextEditingController(text: "");
  // pw = TextEditingController(text: "");
  // pw2 = TextEditingController(text: "");
  // email = TextEditingController(text: "");
  // name = TextEditingController(text: "");
  // }
//각 텍스트 필드의 입력값을 Controller를 사용하여 가져오고
// dispose을 사용해서 메모리 누수를 방지
  @override
  void dispose(){
    id.dispose();
    pw.dispose();
    pw2.dispose();
    email.dispose();
    name.dispose();
    //super.dispose를 호출하여 부모 클래스의 dispose 메소드를 실행하여 추가적인 정리 작업을 수행
    super.dispose();
  }
  void joins(String id, String pw, String name, String email) async {
    final dio = Dio(); //HTTP 클라이언트 라이브러리 Dio의 인스턴스 생성

    try {
      final response = await dio.post(
        "http://192.168.0.177:9090/user/join", // 서버에 POST 요청 보냄
        data: {
          'id': id,
          'pw': pw,
          'name': name,
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json', // 요청 헤더 설정
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

  // 이메일 유효성 검사 함수
  bool isValidEmail(String email) {
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
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: InkWell(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                  child: Center(
                    child: Text("계정 만들기",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0085FF)
                      ),
                    ),
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30),
              child: TextFormField(
                controller: id,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: "아이디",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30),
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
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30),
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
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.markunread_rounded),
                    labelText: "이메일 ",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30, bottom: 20),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "이름 ",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30, bottom: 20),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xff0085FF),
                child: SizedBox(
                  height: 45,
                  child: MaterialButton(
                    onPressed: () {
                      String joinId = id.text;
                      String joinPw = pw.text;
                      String joinPw2 = pw2.text;
                      String joinEmail = email.text;
                      String joinName = name.text;

                      if (joinId.length > 12 || !joinId.contains(RegExp(r'\d'))) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text("아이디는 12자리 이하이고 숫자를 포함해야 합니다."),
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
                      RegExp passwordRegex = RegExp(r'^(?=.*\d)(?=.*[a-zA-Z]).{5,12}$');

                      if (joinPw.length > 12 || !passwordRegex.hasMatch(joinPw)) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text("비밀번호는 5자에서 12자 사이이며, 문자와 숫자를 모두 포함해야 합니다."),
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
                        showDialog( //각종 알림과 에러 처리
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
            ),
          ],
        ),
      ),
    );
  }
}