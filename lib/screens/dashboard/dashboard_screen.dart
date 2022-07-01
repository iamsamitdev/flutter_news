// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_news/screens/bottomnavmenu/home/home_screen.dart';
import 'package:flutter_news/screens/bottomnavmenu/notification/notification_screen.dart';
import 'package:flutter_news/screens/bottomnavmenu/profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  // สร้างตัวแปรแบบ list เก็บรายการของหน้า tab bottom
  int _currentIndex = 0;
  String _title = 'หน้าหลัก';

  List<Widget> _children = [
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  // เขียนเงื่อนไขเพื่อทำการสลับ tab
  void onTapTapped(int index){
    setState(() {
      _currentIndex = index;
      switch(index){
        case 0: _title = 'หน้าหลัก'; break;
        case 1: _title = 'แจ้งเตือน'; break;
        case 2: _title = 'โปรไฟล์'; break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
      ),
      body: _children[_currentIndex],
      drawer: Drawer(
        backgroundColor: Colors.teal,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/samit_profile.jpg'),
              ),
              accountName: Text('Samit Koyom'), 
              accountEmail: Text('samit@email.com'),
              decoration: BoxDecoration(
                color: Colors.deepPurple
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white,),
              title: Text('Home', style: TextStyle(color: Colors.white),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white,),
              title: Text('About', style: TextStyle(color: Colors.white),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.white,),
              title: Text('Contact', style: TextStyle(color: Colors.white),),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white,),
              title: Text('Logout', style: TextStyle(color: Colors.white),),
              onTap: (){},
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'หน้าหลัก'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'แจ้งเตือน'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'โปรไฟล์'
          )
        ]
      ),
    );
  }
}