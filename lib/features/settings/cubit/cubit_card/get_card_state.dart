abstract class GetCardState {}

class GetcardInitial extends GetCardState {}

class GetcardLoading extends GetCardState {}

class Getcardsucces extends GetCardState {
  final List<dynamic> addresses;
  Getcardsucces(this.addresses);
}

class GetcardError extends GetCardState {
  final String error;
  GetcardError(this.error);
}