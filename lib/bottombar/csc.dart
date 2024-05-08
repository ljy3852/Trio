import 'package:flutter/material.dart';
import 'package:untitled2/bottombar/setting.dart';

void main() {
  runApp(Csc());
}

class Csc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '고객센터',
      home: CustomerServiceForm(),
    );
  }
}

class CustomerServiceForm extends StatefulWidget {
  @override
  _CustomerServiceFormState createState() => _CustomerServiceFormState();
}

class _CustomerServiceFormState extends State<CustomerServiceForm> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _writerController = TextEditingController();
  TextEditingController _contextController = TextEditingController();
  // 파일 첨부를 위한 변수나 기능은 이곳에 추가할 수 있습니다.

  @override
  void dispose() {
    _titleController.dispose();
    _writerController.dispose();
    _contextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('고객센터'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '제목',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _writerController,
              decoration: InputDecoration(
                labelText: '작성자',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _contextController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: '내용',
                alignLabelWithHint: true,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  // 글쓰기 버튼을 누르면 이곳에서 데이터를 처리하고 저장하는 로직을 추가하세요.
                  _submitForm();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0085FF),
                ),
                child: Text('등록하기',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    // 글쓰기 버튼을 눌렀을 때 이 메서드에서 데이터를 처리하고 저장하는 로직을 작성하세요.
    String title = _titleController.text;
    String writer = _writerController.text;
    String context = _contextController.text;

    // 여기에 데이터를 처리하고 저장하는 로직을 추가하세요.

    // 처리 후 필드를 비워줍니다.
    _titleController.clear();
    _writerController.clear();
    _contextController.clear();
  }
}