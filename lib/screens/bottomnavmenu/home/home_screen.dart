// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_news/models/NewsModel.dart';
import 'package:flutter_news/services/rest_api.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'ข่าวล่าสุด',
              style: TextStyle(
                fontSize: 24, 
                fontWeight:FontWeight.bold
              ),
            ),
          ),

          SizedBox(
            height: 210.0,
            child: FutureBuilder(
                future: CallAPI().getLastNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
                    return const Center(
                      child: Text('มีข้อผิดพลาดในการโหลดข้อมูล'),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.done) {
                    // ถ้าโหลดข้อมูลสำเร็จ
                    List<NewsModel> news = snapshot.data;
                    return _listViewLastNews(news);
                  } else {
                    return const Center(
                      // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
                      child: CircularProgressIndicator(),
                    );
                  }
                })
              ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'ข่าวประกาศทั้งหมด',
              style: TextStyle(
                fontSize: 24, 
                fontWeight:FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            // height: MediaQuery.of(context).size.height * 0.3,
            child: FutureBuilder(
                future: CallAPI().getAllNews(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    // ถ้าโหลดข้อมูลไม่ได้ หรือมีข้อผิดพลาด
                    return const Center(
                      child: Text('มีข้อผิดพลาดในการโหลดข้อมูล'),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.done) {
                    // ถ้าโหลดข้อมูลสำเร็จ
                    List<NewsModel> news = snapshot.data;
                    return _listViewAllNews(news);
                  } else {
                    return const Center(
                      // ระหว่างที่กำหลังโหลดข้อมูล สามารถใส่ loading...
                      child: CircularProgressIndicator(),
                    );
                  }
              })
          )
        ],
      ),
    );
  }

  //----------------------------------
  // สร้าง ListView สำหรับการแสดงข่าวทั้งหมด
  //----------------------------------
  Widget _listViewAllNews(List<NewsModel> news) {
    return ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: news.length,
        itemBuilder: (context, index) {
          // Load Model
          NewsModel newsModel = news[index];

          return ListTile(
            leading: const Icon(Icons.pages),
            title: Text(newsModel.topic, overflow: TextOverflow.ellipsis),
            subtitle: Text(newsModel.detail, overflow: TextOverflow.ellipsis),
            onTap: () {},
          );
        });
  }

  //----------------------------------
  // สร้าง ListView สำหรับการแสดงข่าวล่าสุด
  //----------------------------------
  Widget _listViewLastNews(List<NewsModel> news) {
    return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal, // Listview แนวนอน
        itemCount: news.length,
        itemBuilder: (context, index) {
          // Load Model
          NewsModel newsModel = news[index];
          // ออกแบบส่วนหน้าตาของการแสดงผล listview
          return Container(
            width: MediaQuery.of(context).size.width * 0.60,
            child: InkWell(
              onTap: () {},
              child: Card(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 125.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(newsModel.imageurl),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              newsModel.topic,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              newsModel.detail,
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }


} // class