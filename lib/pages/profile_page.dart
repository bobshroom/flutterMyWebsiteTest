import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppBar(
              title: Text("ボブのプロファイル"),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              backgroundColor: Colors.cyan,
            ),
            SizedBox(height: 50),
            CircleAvatar(
            radius: 100,//半径
            backgroundColor: Colors.amber,//背景色
            backgroundImage: AssetImage('assets/images/real_eringi.png'),
            ),
            Text("bob(bobshroom)",
            style: TextStyle(fontSize: 50),),
            Text("じょぎのbobです。たまに現れてイベントに参加するやつです。よろしくお願いします。ゲームとかいろいろ作ってます。"),
            SizedBox(height: 100),
            Text("作った作品たち"),
          ],
        ),
      ),
    );
  }
}