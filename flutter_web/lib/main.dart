import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/songs_list/hot_list.dart';

void main() {
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffDEE2E6),
        body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 300, top: 20),
                        child: Text(
                          "Music",
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff0085FF)),
                        ),
                      ),
                      Container(
                        width: 500,
                        height: 40,
                        margin: EdgeInsets.only(top: 20, right: 150),
                        child: SearchBar(
                            leading: Icon(Icons.search),
                            hintText: "검색어를 입력하세요",
                            backgroundColor: MaterialStatePropertyAll(
                              Color(0xffDEE2E6),
                            )),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 100, top: 20),
                          child: InkWell(onTap: () {}, child: Text("로그인")),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, top: 20),
                          child: InkWell(onTap: () {}, child: Text("회원가입")),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 50),
                        child: Container(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "추천 곡 〉",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 400),
                        child: Container(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "최신 곡 〉",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 400),
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => hot_list(),
                              ));
                            },
                            child: Text(
                              "인기 곡 〉",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 2.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "잊혀지는 사랑인가요",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "헤이즈(feat.BIG Naughty)",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 4.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "다시 걸을때",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "TOIL(Feat. 헤이즈, BIG Naughty)",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 100),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 25.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "첫 만남은 계획대로 되지 않아",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "TWS(투어스)",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 14.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "To.X",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "TAEYEON",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 100),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 33.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "벚꽃 엔딩",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "버스커 버스커",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 17.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "좋다고 말해",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "볼빨간 사춘기",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF5F5F5F)),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 5.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "봄이 와도",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "로이킴",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child: Image.asset(
                                  "assets/mainImages/Rectangle 292.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "Off The Record",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "IVE (아이브)",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 100),
                            child: InkWell(
                              child: Image.asset(
                                  "assets/mainImages/image 14-1.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "홀씨",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "아이유(IU)",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 32.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "Wife",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "(여자)아이들",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 100),
                            child: InkWell(
                              child:
                                  Image.asset("assets/mainImages/image 13.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "또 한 번의 밤을 보내며",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "PATEKO(파테코) 및 Kid Wine",
                                      style: TextStyle(
                                          fontSize: 10,
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
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, left: 50),
                            child: InkWell(
                              child: Image.asset(
                                  "assets/mainImages/image 33-1.png"),
                              onTap: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: InkWell(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "천상연",
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "이창섭",
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF5F5F5F)),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40, left: 50),
                        child: Container(
                          child: Text(
                            "장르 컬랙션",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 20),
                        child: Container(
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "assets/mainImages/IMG_9104 2.png",
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 20),
                        child: Container(
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "assets/mainImages/IMG_9105.png",
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 20),
                        child: Container(
                          child: InkWell(
                            onTap: () {},
                            child: Image.asset(
                              "assets/mainImages/IMG_9106.png",
                              width: 200,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
