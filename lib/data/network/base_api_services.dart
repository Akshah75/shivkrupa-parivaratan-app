abstract class BaseApiServices {
  Future<dynamic> getGetResponse(String url);
  Future<dynamic> getPostResponse(
    String url,
    dynamic data,
  );
  Future<dynamic> getPostResponseForSearch(
    String url,
    String token,
  );
  Future<dynamic> getPostResponses(String url, dynamic data, String token);
}
