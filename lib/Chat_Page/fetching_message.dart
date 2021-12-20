import 'package:http/http.dart' as http;

Future<http.Response> fetchMedicine(int k) async {
  var msg = 'https://schhat.herokuapp.com/msg/$k';
  return await http.get(Uri.parse(msg));
}

List<String> msg1 = [];
List<String> msg2 = [];
