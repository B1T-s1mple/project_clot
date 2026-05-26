
class AddCard {
  final String cardnumber;
  final String ccv;
  final String exp;
  final String cardholdername;

  AddCard({
    required this.cardnumber,
    required this.ccv,
    required this.exp,
    required this.cardholdername,
  });

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardnumber,
      'ccv': ccv,
      'exp': exp,
      'cardholder_name': cardholdername,
    };
  }
}