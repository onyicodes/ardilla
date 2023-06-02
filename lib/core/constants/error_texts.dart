class AuthFieldValidationErrorMessage {
  static const String emailEmpty = 'Email field cannot be empty';
  static const String fieldEmpty = 'This field is required';
  static const String emailFormatWrong = 'Enter a valid email address';
  static const String phoneEmpty = 'Phone number has not been entered';
  static const String phoneFormatWrong = 'Invalid phone entered';
  static const String userNameEmpty = 'Username is required';
  static const String firstNameEmpty = 'First name is required';
  static const String lastNameEmpty = 'Last name is required';
  static const String passwordEmpty = 'Password is required';
  static const String passwordFormatWrong =
      'Password must be between 8 to 12 characters';
}

enum ErrorMessage {
  networkError('Connection error'),
  serverError('Server error occurred'),
  notAuthorized('You are not authorized to perform this action'),
  cachingFailed('Cache failure'),
  unknownError('an unknown error occurred'),
  noResultFound('Result not found'),
  accountAlreadyExists('account already exists'),
  failedLogin('You have entered an invalid username or password'),
  accountNotFound('account not found');

  const ErrorMessage(this.message);
  final String message;
}

enum PublishDealValidationErrorMessage {
  nameEmpty('Name field is required '),
  descriptionEmpty('Description field is required '),
  newPrice('Enter new price'),
  validFromEmpty('ValidFrom is required'),
  validToEmpty('ValidTo is required'),
  validToNotValid('Select a date ahead of valid from field'),
  categoryEmpty('Category field is required');

  const PublishDealValidationErrorMessage(this.message);
  final String message;
}

enum DealDetailsErrorMessage {
  messageEmpty('Review field cannot be empty'),
  rating('You must provide rating to proceed');

  const DealDetailsErrorMessage(this.message);
  final String message;
}

enum BusinessInfoErrorMessage {
  locationEmpty('Location field is required'),
  businessNameEmpty('Business name field is required '),
  businessDescriptionEmpty('Business description field is required '),
  businessPhoneEmpty('Business phone field is required '),
  businessTypeEmpty('Business Type field is required');

  const BusinessInfoErrorMessage(this.message);
  final String message;
}
