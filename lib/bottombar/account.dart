import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '계정 페이지',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _name = 'John Doe';
  String _userId = 'john_doe123';
  String _email = 'user@example.com';
  String _password = 'password123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('계정 페이지'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _showEditDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '계정 정보',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              _buildInfoItem('이름', _name),
              SizedBox(height: 20.0),
              _buildInfoItem('아이디', _userId),
              SizedBox(height: 20.0),
              _buildInfoItem('이메일', _email),
              SizedBox(height: 20.0),
              _buildInfoItem('비밀번호', _password),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _showDeleteConfirmationDialog(context);
                },
                child: Text('계정 삭제'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(value),
        ),
      ],
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('계정 삭제'),
          content: Text('정말로 계정을 삭제하시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                // 계정 삭제 기능 추가
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('계정이 삭제되었습니다.')),
                );
                // 여기에 계정 삭제에 대한 실제 로직을 추가하면 됩니다.
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('계정 정보 수정'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: Text('비밀번호 수정'),
                  onTap: () {
                    _showEditPasswordDialog(context);
                  },
                ),
                Padding(padding: EdgeInsets.all(10.0)),
                GestureDetector(
                  child: Text('이메일 수정'),
                  onTap: () {
                    _showEditEmailDialog(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showEditPasswordDialog(BuildContext context) {
    String newPassword = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('비밀번호 수정'),
          content: TextField(
            onChanged: (value) {
              newPassword = value;
            },
            decoration: InputDecoration(hintText: '새로운 비밀번호'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _password = newPassword;
                });
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  void _showEditEmailDialog(BuildContext context) {
    String newEmail = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('이메일 수정'),
          content: TextField(
            onChanged: (value) {
              newEmail = value;
            },
            decoration: InputDecoration(hintText: '새로운 이메일'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _email = newEmail;
                });
                Navigator.of(context).pop();
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }
}

