import 'package:classly_app/core/network/http_request.dart';

/// we ignore the one_member_abstracts lint here because we want to keep the
/// interface for the http client, even if it only has one method
// ignore: one_member_abstracts
abstract interface class IHttpClient {
  Future<HttpResponse<dynamic>> request(
    HttpRequest request,
  );
}
