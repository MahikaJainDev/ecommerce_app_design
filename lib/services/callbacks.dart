class RequestStatus {
  late bool result;
  String? _message;
  List<dynamic>? _body;

  bool get isFailed => !result;

  RequestStatus.success(List<dynamic> list) {
    result = true;
    _body = list;
  }

  RequestStatus.failure(String errorMessage) {
    result = false;
    _message = errorMessage;
  }

  get getMessage => _message ?? 'Something went wrong';

  List<dynamic> get getBody => _body ?? [];

  void setBody(body) => _body = body;
}
