import 'package:architecture/architeture/api/api_path.dart';
import 'package:architecture/architeture/auth/entity/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:architecture/architeture/utils/util.dart' as util;

abstract class BaseApi<T> {
  Uri _getUrlEndPoint(String urlFinal, {Map<String, String> queryParams}) {
    String pathEndPoint = getPathEndPoint();
    String url;

    if (util.isNotNullAndNotEmpity(pathEndPoint) &&
        util.isNotNullAndNotEmpity(urlFinal) &&
        util.isNotNull(queryParams)) {

      url =
          "${getBasePathEndPoint()}/$pathEndPoint/$urlFinal?${Uri(queryParameters: queryParams).query}";

    } else if (util.isNotNullAndNotEmpity(pathEndPoint) &&
        util.isNotNull(queryParams)) {
      url =
          "${getBasePathEndPoint()}/$pathEndPoint?${Uri(queryParameters: queryParams).query}";

    } else if (util.isNotNullAndNotEmpity(pathEndPoint) &&
        util.isNotNullAndNotEmpity(urlFinal)) {

      url = "${getBasePathEndPoint()}/$pathEndPoint/$urlFinal";

    } else if (util.isNotNullAndNotEmpity(pathEndPoint)) {
      url = "${getBasePathEndPoint()}/$pathEndPoint";

    } else {
      url = getBasePathEndPoint();

    }

    return Uri.parse(util.removerBarrasDuplicadas(url));
  }

  String getBasePathEndPoint() => ApiPath.API_BASE_URL;

  String getPathEndPoint();

  Future<http.Response> get({String url}) async {
    final headers = await _headers();
    return await http.get(_getUrlEndPoint(url), headers: headers);
  }

  Future<http.Response> post(
      {String url,
      body,
      Map<String, String> headers,
      Map<String, String> queryParams}) async {
    headers = headers.isEmpty ? await _headers() : headers;
    return await http.post(_getUrlEndPoint(url, queryParams: queryParams),
        body: body, headers: headers);
  }

  Future<http.Response> put({String url, body}) async {
    final headers = await _headers();
    return await http.put(_getUrlEndPoint(url), body: body, headers: headers);
  }

  Future<http.Response> delete({String url}) async {
    final headers = await _headers();
    return await http.delete(_getUrlEndPoint(url), headers: headers);
  }

  Future<Map<String, String>> _headers() async {
    Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    return headers;
  }
}
