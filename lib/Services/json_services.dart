import 'dart:convert';

import 'package:http/http.dart';
import 'package:xtra_firebase/Models/user.dart';

class jsonServices {
  final String baseUrl = 'http://192.168.1.132:8090/';

  Future<List<user>?> userLogin(String mobile) async {
    String url = '${baseUrl}Login?qn=${mobile}';
    var response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<user>((x) => user.fromJson(x)).toList();
      //return user.fromJson(jsonDecode(response.body)[0]);
    } else {
      throw '=>=>=>=>=>=>=>=>=>=>=>=> error while feching data';
    }
  }
}
