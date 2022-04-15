//1) create abstract class that will hold an error or a successful response
abstract class Result<T> {}

class Success<T> extends Result<T>{
  final T value;

  Success(this.value);
}

class Error<T> extends Result<T>{
  final Exception exception;

  Error(this.exception);
}