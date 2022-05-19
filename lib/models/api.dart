import 'package:async/async.dart';
import 'package:dio/dio.dart';

const baseUrl = 'https://flagcdn.com/en/codes.json';

class API {

  static Future getData() {
     var url = baseUrl + "/data";
     return Dio().get(url);  
  }
}