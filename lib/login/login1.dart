import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login1 extends StatelessWidget {
  const Login1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea(
        // 상태바,네비게이션바 간격 제거
        top: true, // 탑의 여백을 쓰겠다.
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    "Music",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff0085FF)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 230),
                  child: InkWell(
                    child: Image.asset("assets/x.png",
                      width: 40,
                      height: 40,
                    ),
                    onTap: () {
                      Navigator.of(context).pop(); // 현재 페이지의 상태값 context
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text("로그인",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                    color: Color(0xff0085FF)
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
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset("assets/kakao.png",
                          width: 40,
                            height: 40,
                          ),
                        ),
                        Container(
                          child: Text("카카오톡으로 시작하기",
                          style: TextStyle(
                            fontSize: 18,

                          ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset("assets/Apple.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Container(
                          child: Text("Apple로 시작하기",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: 300,
              child: TextField(
                decoration: InputDecoration(labelText: 'email'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                maxLength: 10,
                decoration: InputDecoration(labelText: 'Password',
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff0085FF),
              ),
              margin: EdgeInsets.only(top: 20),
              width: 300,
              height: 50,
              child: InkWell(
                child: Center(
                    child: Text("로 그 인",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                ),
                onTap: () {},
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 85, top: 10),
                  child: InkWell(
                    child: Text("회원가입",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: Text("아이디 비밀번호 찾기",
                      style: TextStyle(
                        fontSize: 18,

                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                ],
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
              child: Container(
                width: 90,
                height: 50,
                child: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child: Container(
                  width: 90,
                  height: 50,
                  child: Icon(
                    Icons.search_rounded,
                    size: 30,
                  )),
              onTap: () {},
            ),
            InkWell(
              child: Container(
                width: 90,
                child: Image.asset(
                  "assets/keep.png",
                  width: 50,
                ),
              ),
              onTap: () {},
            ),
            InkWell(
              child: Container(
                width: 90,
                child: Image.asset(
                  "assets/setting.png",
                  width: 50,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}