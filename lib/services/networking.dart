import 'dart:convert';
import 'package:http/http.dart';

class Network_Helper {
  String url;

  Network_Helper(this.url);

  Future getData() async {
    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
