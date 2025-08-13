
abstract class Failure {
  final String message;
  Failure({required this.message});
}

class ServerFailure extends Failure {
  // ignore: use_super_parameters
  ServerFailure({required String message}) : super(message: message);
}

