import 'package:http/http.dart' as http;
import 'utils/http_util.dart';

class HttpManager with HttpUtil {
  HttpManager({
    required this.url,
    this.headers,
  });

  final String url;
  final Map<String, String>? headers;

  Future<http.Response> get() async {
    final uri = Uri.parse(url);
    http.Response response = await http.get(uri, headers: headers);

    return handleResponse(response);
  }
}
