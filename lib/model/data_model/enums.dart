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

  bool allowIndianNumberOnly() {
    return cleanPhoneNumber().length < 10 ||
        cleanPhoneNumber().toString() == "+91" ||
        cleanPhoneNumber().toString() == "91";
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
