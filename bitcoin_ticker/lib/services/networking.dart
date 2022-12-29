import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getCoinData() async {
    Uri uri = Uri.parse(url);

    Response response = await get(uri);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
