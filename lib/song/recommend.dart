import 'package:flutter/material.dart';

class Recommend extends StatelessWidget {
  const Recommend({super.key});

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
                              "assets/image1.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "잊혀지는 사랑인가요",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "헤이즈(feat.BIG Naughty)",
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
                              "assets/image 4.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "다시 걸을때",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "TOIL(Feat. 헤이즈, BIGNaughty)",
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
                              "assets/image 5.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "봄이 와도",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "로이킴",
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
                              "assets/image 34.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "I AM",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "IVE(아이브)",
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
                              "assets/image 35.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "천상연",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "이창섭",
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
                              "assets/image 36.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "그대만 있다면 (여름날 우리 X 너드커넥션 (Nerd Connection))",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                width: 240,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "너드커넥션 (Nerd Connection)",
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
                              "assets/image 37.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "ETA",
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

              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15),
                child: Row(
                  children: [
                    InkWell(
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              "assets/image 39.png",
                              width: 70,
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Hype Boy",
                                  style: TextStyle(
                                      fontSize: 16,
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
