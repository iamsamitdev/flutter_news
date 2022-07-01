// ignore_for_file: unnecessary_null_comparison, library_prefixes

import 'package:flutter_news/models/NewsModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_news/utils/constants.dart' as Constant;

class CallAPI {

  // กำหนด header ของ api
   _setHeaders() => {
    'Content-Type':'application/json',
    'Accept':'application/json'
  };

  // ฟังก์ชันสำหรับอ่านข่าวทั้งหมดออกมาแสดง
  // Asychronous
  Future<List<NewsModel>?> getAllNews() async {
    final response = await http.get(
      Uri.parse(Constant.baseAPIURL+'news'),
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsModelFromJson(response.body);
    }else{
      return null;
    }
  }

  // อ่านข่าวล่าสุด 5 รายการ
  Future<List<NewsModel>?> getLastNews() async {
    final response = await http.get(
      Uri.parse(Constant.baseAPIURL+'lastnews'),
      headers: _setHeaders()
    );
    if(response.body != null){
      return newsModelFromJson(response.body);
    }else{
      return null;
    }
  }

}