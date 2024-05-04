import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recent extends StatelessWidget {
  const Recent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDEE2E6),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      margin: EdgeInsets.only(right: 30,top: 10),
                      child: Text(
                        "Music",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff0085FF)),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/m_recent/Smoothie.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Smoothie",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "NCT DREAM",
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/m_recent/Sorry.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "미안해 미워해 사랑해",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Crush",
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/m_recent/Holssi.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "홀씨",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "아이유(IU)",
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/m_recent/First.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "첫 만남은 계획대로 되지 않아",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "TWS (투어스)",
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/m_recent/To.x.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "To.X",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "태연 (TAEYEON)",
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
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
                                        fontSize: 16,
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/image 38.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Love Lee",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "AKMU (악뮤)",
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



              ],
            ),
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
        )
    );
  }

}
