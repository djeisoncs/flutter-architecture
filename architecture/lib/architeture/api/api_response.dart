
class ApiResponse<T> {

  bool ok;
  String msg;
  T result;
  List<T> entidades;

  ApiResponse.ok({this.result, this.msg}) {
    ok = true;
  }

  ApiResponse.addResponses(this.entidades) {
    ok = true;
  }

  ApiResponse.addResponse(this.result) {
    ok = true;
  }

  ApiResponse.error({this.result, this.msg}) {
    ok = false;
  }
}