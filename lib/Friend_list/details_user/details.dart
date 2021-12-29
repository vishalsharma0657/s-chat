import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> fetchUserDetails(String username) async {
  var wwe = 'https://schhat.herokuapp.com/user/$username';
  return await http.get(Uri.parse(wwe));
}

Future<http.Response> addFriend(String val, String username) {
  return http.post(
    Uri.parse('https://schhat.herokuapp.com/addFriend/$username'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'add': val,
    }),
  );
}

String usrname = '';
String phoneNo = '';
List<String> friends = [];
