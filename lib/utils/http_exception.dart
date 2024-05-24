abstract class HttpException implements Exception {
  const HttpException(
    this.error,
    this.statusCode,
  );

  final String error;
  final int statusCode;
}

class NotFoundException extends HttpException {
  NotFoundException([String? error, int? statusCode])
      : super(error ?? 'Não foi possivel encontrar o endereço!',
            statusCode ?? 404);
}

class InternalServerException extends HttpException {
  InternalServerException([String? error, int? statusCode])
      : super(error ?? 'Erro interno no servidor!', statusCode ?? 500);
}
