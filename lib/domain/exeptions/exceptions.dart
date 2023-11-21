class GenericError {
  final String? message;

  GenericError({this.message});

  @override
  String toString() {
    return message ?? "";
  }
}

class Unauthorized {
  final String? message;

  Unauthorized({this.message});

  @override
  String toString() {
    return message ?? "";
  }
}

class AlreadyExist {
  final String? message;

  AlreadyExist({this.message});

  @override
  String toString() {
    return message ?? "";
  }
}
