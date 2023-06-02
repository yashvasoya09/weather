import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/screen/model/w%20model.dart';
class apiHelper
{
  static apiHelper apihelper = apiHelper();
  Future<WModel> api_helper(String lat,String log)
  async {
    String? link='https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$log&appid=6e2a97e08f38f6d24bc52bc3f1a5c97a';
    var responce = await http.get(Uri.parse(link));
    var Json = jsonDecode(responce.body);
    return await WModel.fromJson(Json);
      }
}