import 'package:flutter/material.dart';

import 'csc.dart';

void main() {
  runApp(Board());
}

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '게시판',
      home: Scaffold(
        appBar: AppBar(
          title: Text('게시판'),
        ),
        body: NoticeList(),
      ),
    );
  }
}

class NoticeList extends StatelessWidget {
  final List<Map<String, dynamic>> notices = [
    {"bno": 1, "title": "플레이어에서 사용기기는 어떻게 등록하나요?", "writer": "music"},
    {"bno": 2, "title": "Mac에서 이용하고 싶어요.", "writer": "music"},
    {"bno": 3, "title": "멜론 플레이어에서 사용기기는 어떻게 등록하나요?", "writer": "music"},
    {"bno": 4, "title": "회원가입은 어떻게 하나요?", "writer": "music"},
    // 여기에 필요한 만큼 공지사항을 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: notices.length,
            itemBuilder: (context, index) {
              final notice = notices[index];
              return ListTile(
                title: Text('${notice["title"]}'),
                subtitle: Text('작성자: ${notice["writer"]}'),
                onTap: () {
                  // 공지사항 세부 정보 페이지로 이동하는 코드 추가
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoticeDetailPage(notice: notice),
                    ),
                  );
                },
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Csc()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0085FF)
            ),
            child: Text(
              '글쓰기',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NoticeDetailPage extends StatelessWidget {
  final Map<String, dynamic> notice;

  NoticeDetailPage({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항 상세 정보'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('글번호: ${notice["bno"]}'),
            SizedBox(height: 8),
            Text('제목: ${notice["title"]}'),
            SizedBox(height: 8),
            Text('글내용: ${notice["context"]}'),
            SizedBox(height: 20),
            Text('작성자: ${notice["writer"]}'),
            SizedBox(height: 8),
            // 공지사항의 내용이 있다면 여기에 추가할 수 있습니다.
          ],
        ),
      ),
    );
  }
}
