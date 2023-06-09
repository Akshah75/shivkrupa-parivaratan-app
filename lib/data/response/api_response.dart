import 'package:parivartan_app/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loadding() : status = Status.loading;
  ApiResponse.completed() : status = Status.complet;
  ApiResponse.error() : status = Status.error;

  //
  @override
  String toString() {
    return "Status:$status \n Message : $message \n Data :$data";
  }
}
