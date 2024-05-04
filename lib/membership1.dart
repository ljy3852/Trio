import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/bottombar/search.dart';
import 'package:untitled2/bottombar/setting.dart';

class Membership1 extends StatelessWidget {
  Membership1({super.key});

  final idController = TextEditingController();
  final pwController = TextEditingController();
  final brithController = TextEditingController();
  final telController = TextEditingController();

  void join(String id, String pw, String brith, String tel) {

    // 유효성 체크
    final db = FirebaseFirestore.instance;


    final user = {
      "id": id,
      "pw": pw,
      "brith": brith,
      "tel": tel,
    };
    db.collection("member").add(user);
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
                    child: Icon(Icons.arrow_back_ios_new),
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

            Container(
              margin: EdgeInsets.only(left: 30, top: 20, right: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "아이디(이메일)"),
                controller: idController,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 30,top: 20, right: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "비밀번호"),
                controller: pwController,
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 30,top: 20, right: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "비밀번호 확인"),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 30,top: 20, right: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "생년월일(ex:900726)"),
                controller: brithController,
              ),
            ),

            Container(
              width: 200,
              margin: EdgeInsets.only(left: 30,top: 20, right: 30),
              child: TextField(
                decoration: InputDecoration(labelText: "전화번호"),
                controller: telController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 40, right: 30),
              child: Container(
                child: InkWell(
                  onTap: () {
                    String id = idController.text;
                    String pw = pwController.text;
                    String brith = brithController.text;
                    String tel = telController.text;
                    join(id,pw,brith,tel);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff0085FF),
                    ),
                    child: Center(
                        child: Text("회 원 가 입",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        ),
                    ),
                    width: 80,
                    height: 50,
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
