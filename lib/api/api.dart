import 'dart:convert';
import 'package:http/http.dart';

const String host = '192.168.0.108:8080';
const String baseUrl = 'http://' + host + '/';

Future<Map<String, dynamic>?> getCat(String catname) async {
  Map<String, dynamic>? ret;
  Response response = await get(
    Uri.parse(
      baseUrl + 'cat/$catname',
    ),
  );
  if (response.statusCode == 200) {
    ret = json.decode(
      response.body,
    );
  }
  return ret;
}

Future<Map<String, dynamic>?> search(String query) async {
  Map<String, dynamic>? ret;
  Response response = await get(
    Uri.parse(
      baseUrl + 'search/$query',
    ),
  );
  if (response.statusCode == 200) {
    ret = json.decode(
      response.body,
    );
  }
  return ret;
}

Future<Map<String, dynamic>?> getJson(String path) async {
  Map<String, dynamic>? ret;
  Response response = await get(
    Uri.parse(
      baseUrl + path,
    ),
  );
  if (response.statusCode == 200) {
    ret = json.decode(
      response.body,
    );
  }
  return ret;
}
