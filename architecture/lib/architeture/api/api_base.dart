
import 'package:http/http.dart' as http;
import 'package:architecture/architeture/utils/constantes.dart' as Constantes;
import 'package:architecture/architeture/utils/util.dart' as util;

abstract class BaseApi<T> {

  Uri _getUrlEndPoint(String urlFinal) {
    String pathEndPoint = getPathEndPoint();
    String url;

    if (pathEndPoint.isNotEmpty && urlFinal.isNotEmpty) {
      url = "${Constantes.API_BASE_URL}/$pathEndPoint/$urlFinal";

    } else if (pathEndPoint.isNotEmpty) {
      url = "${Constantes.API_BASE_URL}/$pathEndPoint";
    } else {
      url = Constantes.API_BASE_URL;
    }

    return Uri.parse(util.removerBarrasDuplicadas(url));
  }

  String getPathEndPoint();

  Future<http.Response> get({String url}) async {
    final headers = await _headers();
    var response = await http.get(_getUrlEndPoint(url), headers: headers);
    return response;
  }

  Future<http.Response> post({String url, body}) async {
    final headers = await _headers();
    var response = await http.post(_getUrlEndPoint(url), body: body, headers: headers);
    return response;
  }

  Future<http.Response> put({String url, body}) async {
    final headers = await _headers();
    var response = await http.put(_getUrlEndPoint(url), body: body, headers: headers);
    return response;
  }

  Future<http.Response> delete({String url}) async {
    final headers = await _headers();
    var response = await http.delete(_getUrlEndPoint(url), headers: headers);
    return response;
  }

  Future<Map<String, String>> _headers() async {
    // Usuario user = await Usuario.get();

    Map<String, String> headers = {
      "Content-Type": "application/json"
      // "Authorization": "Bearer ${user.token}"
    };
    return headers;
  }
}