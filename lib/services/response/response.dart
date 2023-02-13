class ServiceResponse {
  dynamic error;
  String? message;
  dynamic data;
  int? total;
  bool isError;

  ServiceResponse(
      {this.error, this.message, this.data, this.total, required this.isError});

  factory ServiceResponse.fromJson(
          bool isError, Function? fn, Map<String, dynamic> json) =>
      ServiceResponse(
        error: json['error'],
        message: json['message'],
        data: (fn != null) ? fn(json['data']) : json['data'],
        total: json['total'],
        isError: isError,
      );
}
