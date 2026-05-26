abstract class GetAddressesState {}

class GetAddressesInitial extends GetAddressesState {}

class GetAddressesLoading extends GetAddressesState {}

class GetAddressesSuccess extends GetAddressesState {
  final List<dynamic> addresses;
  GetAddressesSuccess(this.addresses);
}

class GetAddressesError extends GetAddressesState {
  final String error;
  GetAddressesError(this.error);
}