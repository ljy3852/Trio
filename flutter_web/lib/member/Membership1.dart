

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
  void initState(){
    //super.initState 코드는 현재 클래스에서 오버라이드 된
    // initState() 메서드 내에서 상위 클래스의 initState() 메서드를 호출
    super.initState();
    id = TextEditingController(text: "");
    pw = TextEditingController(text: "");
    pw2 = TextEditingController(text: "");
    email = TextEditingController(text: "");
    name = TextEditingController(text: "");
  }
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
              padding: const EdgeInsets.only(top: 30),
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
              padding: const EdgeInsets.only(left: 400, right: 400, top: 30),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "이름 ",
                    border: OutlineInputBorder()),
              ),
            ),

          ],
        ),
      ),
    );
  }
}