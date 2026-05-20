enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete,
}

enum ResponseType {
  json,
  plain,
  bytes,
  stream,
}

class HttpRequest {
  const HttpRequest({
    required this.path,
    required this.method,
    this.data,
    this.queryParameters,
    this.responseType = ResponseType.json,
  });

  final String path;
  final HttpMethod method;

  final dynamic data;

  final Map<String, dynamic>? queryParameters;
  final ResponseType responseType;
}

class HttpResponse<T> {
  const HttpResponse({
    required this.data,
    required this.statusCode,
    required this.headers,
  });
  final T data;
  final int statusCode;
  final Map<String, List<String>> headers;
}
