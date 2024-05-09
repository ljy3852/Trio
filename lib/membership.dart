import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:untitled2/loginMain.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/membership1.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/bottombar/search.dart';
import 'package:untitled2/bottombar/setting.dart';


void navigator(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => LoginMain(),
  ));
}

void kakaoLogin() async {
// 카카오 로그인 구현 예제

// 카카오톡 실행 가능 여부 확인
// 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
  if (await isKakaoTalkInstalled()) {
    try {
      await UserApi.instance.loginWithKakaoTalk();
      print('카카오톡으로 로그인 성공');
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  } else {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      print('카카오계정으로 로그인 성공');
    } catch (error) {
      print('카카오계정으로 로그인 실패 $error');
    }
  }
}

Future<void> kakaoLogout() async {
  try {
    await UserApi.instance.logout();
    print('로그아웃 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('로그아웃 실패, SDK에서 토큰 삭제 $error');
  }
}

class Membership extends StatelessWidget {
  const Membership({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea( // 상태바,네비게이션바 간격 제거
        top: true, // 탑의 여백을 쓰겠다.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
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
            Padding(
              padding: const EdgeInsets.only(top: 50),
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
                      color: const Color(0xff0085FF),
                    ),
                    width: 300,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Icon(Icons.email,
                          color: Colors.white,
                          ),
                            width: 40,
                            height: 40,
                          ),
                        Container(
                          child: Text("이메일 아이디로 시작하기",
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
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Membership1(),
                    )
                    );
                  },
                ),
              ),
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