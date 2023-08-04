import 'package:http/http.dart' as http;

class httpLoader {
  Future<String> httpGET(String server, String path) async {
    var url = Uri.https(server, path, {'q': '{http}', 'element': '1'});
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print("Retrieved from AWS ${response.body}");
      return response.body;
    } else {
      print("Request failed +${response.statusCode}");
      return "Could not load";
    }
  }

  Future<String> getData() {
    Future<String> data = httpGET('', '');
    return data;
  }
}
