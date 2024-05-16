import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:untitled2/model/song_model.dart';
import 'package:untitled2/song/popularity.dart';
import 'package:untitled2/song/recent.dart';
import 'package:untitled2/song/recommend.dart';
import 'package:untitled2/bottombar/locker.dart';
import 'package:untitled2/bottombar/setting.dart';
import 'package:untitled2/login/login1.dart';
import 'package:untitled2/apppage/membership.dart';
import 'package:untitled2/bottombar/search.dart';
import 'package:untitled2/apppage/firebase_options.dart';

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
  //list를 전역에 해준다.
  //List 안에 SongModel list [] 배열로 담아준다.
  List<SongModel> list = [];
  List<SongModel> songlist = [];

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
        baseUrl: "http://192.168.45.63:9090",
        contentType: "application/json",
      ),
    );

    try {
      final res = await dio.get("/Book/test");

      if (res.statusCode == 200) {
        print(res.data);
      } else {
        print("Error: ${res.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getSongList();
  }

//getSongList라는 메서드를 비동기 통신으로 하기 위해 async를 사용해준다.
  void getSongList() async {
    //dio에 url를 json형식을 담아주기 위해 만들어줌
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.45.63:9090",
        contentType: "application/json",
      ),
    );

    Response res = await dio.post("/song/list");
    //만약에 res.statusCode 값이 성공일 경우 res.data를 출력해준다.
    if (res.statusCode == 200) {
      print(res.data);
      //list
      list = (res.data as List).map((e) => SongModel.fromJson(e)).toList();
      print(list);

      setState(() {});
    }
    void getListList() async {
      Dio dio = Dio(
        BaseOptions(
          baseUrl: "http://192.168.45.63:9090",
          contentType: "application/json",
        ),
      );
      Response res = await dio.post("/song/hit");

      if (res.statusCode == 200) {
        print(res.data);

        songlist =
            (res.data as List).map((e) => SongModel.fromJson(e)).toList();
        print(songlist);
      }
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          ));
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
                          ));
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
                        ));
                      },
                    )
                  ],
                ),
              ),

              // 추천곡 리스트 뷰
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAlias,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: InkWell(
                                    child: Image.network(
                                      list[index].image_path ?? "",
                                      width: 100,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: InkWell(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            list[index].artist ?? "",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 1),
                                          child: Text(
                                            list[index].title ?? "",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(
                                                0xFF5F5F5F,
                                              ),
                                            ),
                                          ),
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
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
                        ));
                      },
                    )
                  ],
                ),
              ),

              // 최신곡 리스트 뷰
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.antiAlias,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Row(
                        children: [
                          InkWell(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: InkWell(
                                    child: Image.network(
                                      list[index].image_path ?? "",
                                      width: 100,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                  child: InkWell(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: Text(
                                            list[index].artist ?? "",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 1),
                                          child: Text(
                                            list[index].title ?? "",
                                            style: TextStyle(
                                              fontSize: 9,
                                              color: Color(
                                                0xFF5F5F5F,
                                              ),
                                            ),
                                          ),
                                          width: 100,
                                        ),
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Text(
                            "인기 곡 〉",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Popularity(),
                        ));
                      },
                    )
                  ],
                ),
              ),

              // 인기곡 리스트
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Row(
                        children: [
                          InkWell(
                            child: Row(
                              children: [
                                Container(

                                  child: Image.network(
                                    list[index].image_path ?? " ",
                                    width: 70,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        list[index].title ?? " ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      width: 240,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        list[index].artist ?? " ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF5F5F5F)),
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
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "좋아요 순 〉",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Popularity(),
                        ));
                      },
                    )
                  ],
                ),
              ),

              // 인기곡 리스트
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, top: 10),
                      child: Row(
                        children: [
                          InkWell(
                            child: Row(
                              children: [
                                Container(
                                  child: Image.network(
                                    list[index].image_path ?? " ",
                                    width: 70,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        list[index].title ?? " ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      width: 240,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 20),
                                      child: Text(
                                        list[index].artist ?? " ",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFF5F5F5F)),
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
                    );
                  },
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
                  )),
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
