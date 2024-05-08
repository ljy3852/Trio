import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/bottombar/board.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/bottombar/search.dart';
import 'package:untitled2/bottombar/csc.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Music",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff0085FF),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('계정'),
              onTap: () {
                // 계정 페이지로 이동하는 코드를 여기에 작성
              },
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('공지사항'),
              onTap: () {
                // 게시판 페이지로 이동하는 코드를 여기에 작성
                Navigator.push(context, MaterialPageRoute(builder: (context) => Board()),);
              },
            ),
            ListTile(
              leading: Icon(Icons.headset_mic_rounded),
              title: Text('고객센터'),
              onTap: () {
                // 고객센터 페이지로 이동하는 코드를 여기에 작성
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Csc()),
                );
              },
            ),
          ],
        ),
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
                ));
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
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(),
                ));
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
                ));
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
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
