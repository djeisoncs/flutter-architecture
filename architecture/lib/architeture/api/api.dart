import 'dart:convert' as convert;

import 'package:architecture/architeture/api/api_response.dart';
import 'package:architecture/architeture/api/base_api.dart';
import 'package:architecture/architeture/entity/entity.dart';
import 'package:architecture/architeture/entity/paginator.dart';
import 'package:architecture/architeture/utils/util.dart';

abstract class Api<T extends Entity> extends BaseApi {

  T fromJson(Map<String, dynamic> map);

  Future<ApiResponse<T>> list(Paginator paginator) async {
    var response = await post(url: "///list", body: paginator);

    return ApiResponse<T>.addResponses(convert.json
        .decode(response.body)
        .map<T>((map) => fromJson(map))
        .toList());
  }

  Future<ApiResponse<T>> getById(String id) async {
    var response = await get(url: "/$id");
    return ApiResponse.ok(
        result: fromJson(convert.json.decode(response.body)));
  }

  Future<ApiResponse<T>> save(T entity) async {
    ApiResponse<T> apiResponse;
    try {
      String json = entity.toJson();

      var response = await (isNullAndEmpity(entity.getId())
          ? post(body: json)
          : put(body: json));

      if (response.statusCode == 200 || response.statusCode == 201) {
        apiResponse = ApiResponse.ok(
            result: fromJson(convert.json.decode(response.body)));
      } else if (isNullAndEmpity(response.body)) {
        apiResponse =
            ApiResponse.error(msg: "Não foi possivel realizar a ação");
      } else {
        Map mapResponse = convert.json.decode(response.body);
        apiResponse = ApiResponse.error(msg: mapResponse["error"]);
      }
    } catch (error) {
      apiResponse = ApiResponse.error(msg: "Não foi possivel realizar a ação");
    }

    return apiResponse;
  }

  Future<ApiResponse> deletar(T entity) async {
    ApiResponse apiResponse;
    try {
      var response = await delete(url: "/${entity.getId()}");

      if (response.statusCode == 200) {
        apiResponse = ApiResponse.ok(result: true);
      } else {
        apiResponse = ApiResponse.error(msg: "Erro não previsto");
      }
    } catch (error) {
      apiResponse = ApiResponse.error(msg: "Não foi possivel realizar a ação");
    }

    return apiResponse;
  }
}
