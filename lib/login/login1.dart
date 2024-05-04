import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/membership.dart';
import 'package:untitled2/membership1.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/bottombar/setting.dart';
import 'package:untitled2/bottombar/search.dart';


class login1 extends StatelessWidget {
  login1({super.key});

  final idController = TextEditingController();   // 한번만 사용 Text컨트롤러
  final pwController = TextEditingController();

  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }


  bool login(String id, String pw) {
    bool result = false;
    if (id.length < 5) {      // id의 문자열 길이가 5보다 짧으면
      return result;
    }
    if (pw.length < 5 || pw.contains(RegExp(r'[!@#$%^&*(),.?:{}|<>]'))) {
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
                        color: const Color(0xff0085FF)
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 230),
                  child: InkWell(
                    child: Image.asset(
                      "assets/x.png",
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
              child: Text(
                "로그인",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0085FF)),
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
                          child: Image.asset(
                            "assets/kakao.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Container(
                          child: Text(
                            "카카오톡으로 시작하기",
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
                  onTap: () {
                    kakaoLogin();
                  },
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
                          child: Image.asset(
                            "assets/Apple.png",
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Container(
                          child: Text(
                            "Apple로 시작하기",
                            style: TextStyle(fontSize: 18, color: Colors.white),
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
                controller: idController, // controller 컨트롤러 변수
              ),
            ),
            Container(
              width: 300,
              child: TextField(
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                keyboardType: TextInputType.emailAddress,
                controller: pwController,
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
                  child: Text(
                    "로 그 인",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                onTap: () {
                  String id = idController.text;
                  String pw = pwController.text;
                  bool result = login(id, pw);
                  if (result) {
                    Navigator.of(context).pop();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        backgroundColor: Color(0xffDEE2E6),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 150,
                                child: Center(
                                  child: Text("아이디 및 비밀번호를 확인해주세요.",
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 30,
                                    margin: EdgeInsets.only(right: 20, bottom: 20),
                                    child: Text("확인",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff0085FF),
                                    ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                      ),
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 85, top: 10),
                  child: InkWell(
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                        fontSize: 18,
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
                  margin: EdgeInsets.only(top: 10),
                  child: InkWell(
                    child: Text(
                      "아이디 비밀번호 찾기",
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
      ),
    );
  }
}
