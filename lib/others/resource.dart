abstract class Resource<T> {
  final T? data;
  final String error;

  Resource(this.data, this.error);

}

class Success<T> extends Resource<T> {
  final T Data;

  Success(this.Data) : super(Data, "");

  bool get hasData => data != null;
}

class Failure<T> extends Resource<T> {
  final String Error;

  Failure(this.Error) : super(null, Error);
}
