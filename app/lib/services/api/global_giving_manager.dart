import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class GlobalGivingManager {
  final String _key;
  final String _protocol;
  final String _domain;

  /* CONSTRUCTOR */
  GlobalGivingManager()
      : _key = "f5c3464c-53db-4e72-9b81-bad08dec4b37",
        _protocol = "https://",
        _domain = "api.globalgiving.org";

  /* METHODS */
  _downloadProjects() {

  }

  getActiveProjects() async {
    final query = "/api/public/projectservice/all/projects/active/download.xml?api_key=$_key";

    final response = await http.get(
      Uri.parse("$_protocol$_domain$query"),
    );

    if (response.statusCode == 200){
      final xmlData = response.body;


    }
  }
}
