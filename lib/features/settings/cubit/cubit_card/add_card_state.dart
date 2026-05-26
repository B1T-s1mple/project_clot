abstract class AddCardState {}

class Addcardinitial extends AddCardState {}

class Addcardloading extends AddCardState {}

class AddcardSucces extends AddCardState {
  final String message;
  AddcardSucces(this.message);
}

class AddDed extends AddCardState {
  final int userId;
  AddDed(this.userId);
}

class AddcardError extends AddCardState {
  final String error;
  AddcardError(this.error);
}
