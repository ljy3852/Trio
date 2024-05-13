import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class hot_list extends StatelessWidget {
  const hot_list({super.key});

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 50, top: 20),
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
                    margin: EdgeInsets.only(top: 20, left: 300),
                    child: SearchBar(
                        leading: Icon(Icons.search),
                        hintText: "검색어를 입력하세요",
                        backgroundColor: MaterialStatePropertyAll(
                          Color(0xffDEE2E6),
                        )),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 10),
                width: 1200,
                height: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 120),
                    child: Text("번호"),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 100),
                    child: Text("곡 정보"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 100),
                    child: Text("앨범"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 200),
                    child: Text("좋아요"),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 150),
                    child: Text("듣기"),
                  ),
                  Container(
                    child: Text("담기"),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 130),
                    child: Text("상세"),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 1200,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
