import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> sendMessage(String val, String id, String sender) {
  return http.post(
    Uri.parse('https://schhat.herokuapp.com/msg/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'sender': sender,
      'msg': val,
    }),
  );
}
