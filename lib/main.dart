import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:untitled2/song/popularity.dart';
import 'package:untitled2/song/recent.dart';
import 'package:untitled2/song/recommend.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/bottombar/setting.dart';
import 'package:untitled2/login/login1.dart';
import 'package:untitled2/membership.dart';
import 'package:untitled2/bottombar/search.dart';

import 'firebase_options.dart';

void main() async {
  // kakao login
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: '0fe127c1dcaa790f313189c8115bffab',
    javaScriptAppKey: '0fe127c1dcaa790f313189c8115bffab',
  );

  KakaoSdk.init(nativeAppKey: '0fe127c1dcaa790f313189c8115bffab');
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TabController? controller;
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  void test() async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://192.168.0.10:9090",
        contentType: "application/json",
      ),
    );
    final res = await dio.get("/Book/test");

    if(res.statusCode == 200) {
      print(res.data);
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Music",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff0085FF)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 150),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "로그인",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => login1(),
                          )
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            "회원가입",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Membership(),
                          )
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "추천 곡 〉",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Recommend(),
                        )
                        );
                      },
                    )
                  ],
                ),
              ),

              // 추천곡 리스트 뷰
              SizedBox(
                height: 160,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: InkWell(
                                child: Image.asset("assets/image1.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "잊혀지는 사랑인가요",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "헤이즈(feat.BIG Naughty)",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: InkWell(
                                child: Image.asset("assets/image 4.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "다시 걸을때",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "TOIL(Feat. 헤이즈, BIG \nNaughty)",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15),
                              child: InkWell(
                                child: Image.asset("assets/image 5.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "봄이 와도",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "로이킴",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15),
                              child: InkWell(
                                child: Image.asset("assets/image 34.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "I AM",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "IVE(아이브)",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15),
                              child: InkWell(
                                child: Image.asset("assets/image 35.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "천상연",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "이창섭",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        child: Text(
                          "최신 곡 〉",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Recent(),
                        )
                        );
                      },
                    )
                  ],
                ),
              ),

              // 최신곡 리스트 뷰
              SizedBox(
                height: 160,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: InkWell(
                                child:
                                    Image.asset("assets/m_recent/Smoothie.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "Smoothie",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "NCT DREAM",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 15),
                              child: InkWell(
                                child: Image.asset("assets/m_recent/Sorry.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "미안해 미워해 사랑해",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "Crush",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15),
                              child: InkWell(
                                child:
                                    Image.asset("assets/m_recent/Holssi.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "홀씨",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "아이유(IU)",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15),
                              child: InkWell(
                                child: Image.asset("assets/m_recent/First.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "첫 만남은 계획대로 되지 않아",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "TWS (투어스)",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 15, top: 15),
                              child: InkWell(
                                child: Image.asset("assets/m_recent/To.x.png"),
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: InkWell(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      child: Text(
                                        "To.X",
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        "태연 (TAEYEON)",
                                        style: TextStyle(
                                            fontSize: 8,
                                            color: Color(0xFF5F5F5F)),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        child: Text(
                          "인기 곡 〉",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Popularity(),
                        )
                        );
                      },
                    )
                  ],
                ),
              ),

              // 인기곡 리스트
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/m_popularity/beojkkoch.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "벚꽃엔딩",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "버스커버스커",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5F5F5F)),
                                ),
                                width: 240,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 70,
                        width: 40,
                        child: Icon(Icons.more_vert),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/m_popularity/jilsaeg.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "나는 아픈 건 딱 질색이니까",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "(여자)아이들",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5F5F5F)),
                                ),
                                width: 240,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 70,
                        width: 40,
                        child: Icon(Icons.more_vert),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/m_popularity/Yanggaeng.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "밤양갱",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "비비(BIBI)",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5F5F5F)),
                                ),
                                width: 240,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 70,
                        width: 40,
                        child: Icon(Icons.more_vert),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 10),
                child: Row(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/m_popularity/YouLikeMe.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "좋다고 말해",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "볼빨간사춘기",
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF5F5F5F)),
                                ),
                                width: 240,
                              ),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 70,
                        width: 40,
                        child: Icon(Icons.more_vert),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        "장르 컬렉션",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 160,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                            child: Image.asset("assets/m_genre/Ballade.png"),
                            onTap: () {},
                          ),
                          width: 130,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                            child: Image.asset("assets/m_genre/recent.png"),
                            onTap: () {},
                          ),
                          width: 130,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                            child: Image.asset("assets/m_genre/Overseas.png"),
                            onTap: () {},
                          ),
                          width: 130,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    test();
                  },
                    child: Text("button")
                )
              )
            ],
          ),
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
