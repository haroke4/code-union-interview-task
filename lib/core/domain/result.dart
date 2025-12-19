/// T is for succes type
/// F is for failure type
///
/// Usually failure would be the [Failure] class
/// But if u have unusual case, you can use any class you want
///
sealed class ResultCustom<T, F> {
  const ResultCustom();
  R? match<R>({R Function(T)? ok, R Function(F)? err});

  bool isErr() => this is Err;
  bool isOk() => this is Ok;
  T get okValue => switch (this) {
    Ok(:final value) => value,
    Err(:final failure) =>
      failure is Failure
          ? throw failure
          : throw UnexpectedFailure(failure.toString()),
  };
  F get errValue => switch (this) {
    Ok(:final value) =>
      value is Failure
          ? throw value
          : throw UnexpectedFailure(value.toString()),
    Err(:final failure) => failure,
  };
}

typedef Result<T> = ResultCustom<T, Failure>;

final class Ok<T, F> extends ResultCustom<T, F> {
  const Ok(this.value);
  final T value;

  R? when<R>({R Function(T)? ok, R Function(F)? err}) => ok?.call(value);
  @override
  R? match<R>({R Function(T)? ok, R Function(F)? err}) => ok?.call(value);
}

final class Err<T, F> extends ResultCustom<T, F> {
  const Err(this.failure);
  final F failure;

  @override
  R? match<R>({R Function(T)? ok, R Function(F)? err}) => err?.call(failure);
}

class Failure {
  const Failure();
}

class NetworkFailure extends Failure {
  const NetworkFailure(); // No internet, DNS fail, etc.
}

class ServerFailure extends Failure {
  final int? code; // HTTP 5xx, 4xx, or unknown
  const ServerFailure([this.code]);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure(); // Token expired, invalid credentials
}

class UnexpectedFailure extends Failure {
  final String message;
  const UnexpectedFailure([this.message = 'Unexpected error']);
}
