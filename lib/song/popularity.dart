import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Popularity extends StatelessWidget {
  const Popularity({super.key});

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


                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          "인기 곡",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      )
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
                                "assets/m_genre/image 25.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Super Shy",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "NewJeans",
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
                                "assets/m_genre/image 26.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "퀸카 (Queencard)",
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
                  padding: const EdgeInsets.only(left: 15,top: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                "assets/m_genre/image 27.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Ditto",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "NewJeans",
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
                                "assets/m_genre/Rectangle 288.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Get A Guitar",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "RIIZE",
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
                                "assets/m_genre/image 28.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "EASY",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "LE SSERAFIM (르세라핌)",
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
                                "assets/m_genre/image 29.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Love wins all",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "아이유 (IU)",
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
                                "assets/m_genre/image 30.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Perfect Night",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "LE SSERAFIM (르세라핌)",
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
                                "assets/m_genre/image 31.png",
                                width: 70,
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "한 페이지가 될 수 있게",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  width: 240,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "DAY6 (데이식스)",
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
