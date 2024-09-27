enum AccountType { admin, student, trainer, branchManager }

enum PhoneNumberCharacter {
  plus,
  space,
  dash,
  openParen,
  closeParen,
}

extension PhoneNumberCleaner on String {
  String cleanPhoneNumber() {
    return replaceAll(PhoneNumberCharacter.plus.char, '')
        .replaceAll(PhoneNumberCharacter.space.char, '')
        .replaceAll(PhoneNumberCharacter.dash.char, '')
        .replaceAll(PhoneNumberCharacter.openParen.char, '')
        .replaceAll(PhoneNumberCharacter.closeParen.char, '');
  }

  int getCountryCode() {
    if (startsWith('+')) {
      String possibleCountryCode = substring(1, 3);
      if (RegExp(r'^\d+$').hasMatch(possibleCountryCode)) {
        return int.parse(possibleCountryCode);
      }
    }
    return 91;
  }

  String removeCountryCode() {
    String cleanedPhone = cleanPhoneNumber();
    String countryCode = "+${getCountryCode().toString()}";

    if (cleanedPhone.startsWith(countryCode.substring(1))) {
      return cleanedPhone.substring(countryCode.length - 1);
    }

    return cleanedPhone;
  }
}

extension PhoneNumberCharacterExtension on PhoneNumberCharacter {
  String get char {
    switch (this) {
      case PhoneNumberCharacter.plus:
        return '+';
      case PhoneNumberCharacter.space:
        return ' ';
      case PhoneNumberCharacter.dash:
        return '-';
      case PhoneNumberCharacter.openParen:
        return '(';
      case PhoneNumberCharacter.closeParen:
        return ')';
    }
  }
}

class PhoneNumberValidator {
  static String? validateIndianPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number.';
    }

    String cleanedPhone = value.cleanPhoneNumber();

    if (cleanedPhone.length != 10) {
      return "Phone Number restricted to 10 digits";
    }

    if (value.getCountryCode() != 91) {
      return "Phone Number restricted to 10 digits";
      // return 'Phone number must be an Indian number (91).';
    }

    return null;
  }
}
