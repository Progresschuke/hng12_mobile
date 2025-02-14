class NetworkResponse<T> {
  final T? data;
  final RequestStatus status;
  final String? message;

  NetworkResponse({this.data, required this.status, this.message});
}

const timeoutDuration = Duration(seconds: 30);

enum RequestStatus {
  initial,
  loading,
  failed,
  success,
  noNetwork,
}
