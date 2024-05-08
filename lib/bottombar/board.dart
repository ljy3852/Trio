import 'package:flutter/material.dart';

void main() {
  runApp(Board());
}

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '공지사항',
      home: Scaffold(
        appBar: AppBar(
          title: Text('공지사항'),
        ),
        body: NoticeList(),
      ),
    );
  }
}

class NoticeList extends StatelessWidget {
  final List<Map<String, dynamic>> notices = [
    {"bno": 1, "title": "서비스 점검 안내 (DB 업그레이드)", "writer": "music"},
    {"bno": 2, "title": "Windows 신규 플레이어 재생모듈 업그레이드 안내", "writer": "music"},
    {"bno": 3, "title": "우리카드/우리은행 전산 작업에 따른 우리카드 결제 불가", "writer": "music"},
    {"bno": 4, "title": "SBS 인기가요 사전투표 종료 안내", "writer": "music"},
    // 여기에 필요한 만큼 공지사항을 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
