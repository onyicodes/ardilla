enum ListSpacingValue {
  spacingV100(100),
  spacingV80(80),
  spacingV54(54),
  spacingV48(48),
  spacingV32(32),
  spacingV24(24),
  spacingV16(16),
  spacingV12(12),
  spacingV8(8);

  const ListSpacingValue(this.value);
  final double value;
}


class GeneralConstants {
  static String emailHint = "Email address";
  static String phoneHint = "Phone Number";
  static String userNameHint = "Username";
  static String firstNameHint = "First Name";
  static String lastNameHint = "Last Name";
  static String refCodeHint = "Invitation code (optional)";
  static String passwordHint = "Password";
}


enum CurrencyType {
  NGN("₦"),
  USD("\$");

 const CurrencyType(this.symbol);
  final String symbol;
  
}


enum RankType {
  Cadet,
  Beginner; 
}


enum RequestStatus { initial, loading, success, error }
