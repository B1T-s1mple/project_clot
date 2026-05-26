abstract class AddadresState {}

class Addadresinittial extends AddadresState {}

class AddadresLoadind extends AddadresState {}

class AddadresSucces extends AddadresState {
  final String message;
  AddadresSucces(this.message);
}

class AddDed extends AddadresState {
  final int userId;
  AddDed(this.userId);
}

class AddadresError extends AddadresState {
  final String error;
  AddadresError(this.error);
}
