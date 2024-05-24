import 'package:http/http.dart';
import 'http_exception.dart';

mixin HttpUtil {
  Response handleResponse(Response response) {
    try {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      }

      throw handleError(response, response.body);
    } on HttpException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  handleError(response, responseBody) {
    final code = response.statusCode;
    final isNotFound = code == 404;
    final isInternalError = code == 500;

    if (isNotFound) throw NotFoundException();
    if (isInternalError) throw InternalServerException();
    throw Exception('Erro desconhecido: $code');
  }
}
