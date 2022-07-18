abstract class IUserError {
  final String message;

  final StackTrace? strackTrace;

  const IUserError(this.message, [this.strackTrace]);
}

class ArgumentsException extends IUserError {
  ArgumentsException(
    String message,
    StackTrace? stackTrace,
  ) : super(
          message,
          stackTrace,
        );
}

class DataSouceException extends IUserError {
  DataSouceException(
    String message,
    StackTrace? stackTrace,
  ) : super(
          message,
          stackTrace,
        );
}
