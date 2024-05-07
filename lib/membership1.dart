import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  TextEditingController _email = TextEditingController();
  TextEditingController _pw = TextEditingController();
  TextEditingController _pw2 = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _id = TextEditingController();

  @override
  void initState(){
    super.initState();
    _id = TextEditingController(text: "");
    _pw = TextEditingController(text: "");
    _pw2 = TextEditingController(text: "");
    _email = TextEditingController(text: "");
    _name = TextEditingController(text: "");

  }

  @override
  void dispose(){
    _id.dispose();
    _pw.dispose();
    _pw2.dispose();
    _email.dispose();
    _name.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    // 이메일 주소의 정규식
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
  void join(){
    String joinId = _id.text;
    String joinPw = _pw.text;
    String joinPw2 = _pw2.text;
    String joinEmail = _email.text;
    String joinName = _name.text;



    if(joinId.length >= 13){
      showDialog(context: context, barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          content: Text("ID는 12자리이하 까지만 가능합니다."),
          actions: [
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            )
          ],
        );
      });
      return;
    } if (joinPw.length >= 13) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text(" 패스워드는 12자리이하 까지만 가능합니다. "),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
      return;
    }
    if (joinPw2.length >= 13) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text(" 패스워드는 12자리이하 까지만 가능합니다. "),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
      return;
    }
    if(!isValidEmail(joinEmail)){
      showDialog(context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx){
            return AlertDialog(
              content: Text("유효하지 않은 이메일 주소입니다."),
              actions: [
                InkWell(
                  onTap: (){Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                )
              ],
            );
          }
          );

    }


    if (joinName.length >= 7) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            return AlertDialog(
              content: Text(" 이름은 6자리이하 까지만 가능합니다. "),
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('확인'),
                ),
              ],
            );
          });
      return;}
  }

  void check() {
    String email = "example@example.com"; // 여기에 확인할 이메일 주소를 넣으세요
    if (isValidEmail(email)) {
      print("$email은(는) 유효한 이메일 주소입니다.");
    } else {
      print("$email은(는) 유효하지 않은 이메일 주소입니다.");
    }
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
                controller: _id,
                validator: (value) => (value!.isEmpty) ? "아이디를 입력해 주세요" : null,
                style: TextStyle(),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key),
                    labelText: "아이디",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _pw,
                validator: (value) => (value!.isEmpty) ? "비밀번호를 입력해 주세요" : null,
                style: TextStyle(),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "비밀번호",
                    border: OutlineInputBorder()),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _pw2,
                validator: (value) => (value!.isEmpty) ? "비밀번호를 확인 해주세요" : null,
                style: TextStyle(),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "비밀번호 확인 ",
                    border: OutlineInputBorder()),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _email,
                validator: (value) => (value!.isEmpty) ? "이메일를 입력해 주세요" : null,
                style: TextStyle(),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.markunread_rounded),
                    labelText: "이메일 ",
                    border: OutlineInputBorder()),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _name,
                validator: (value) => (value!.isEmpty) ? "이름을 입력해 주세요" : null,
                style: TextStyle(),
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
                    join();
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
