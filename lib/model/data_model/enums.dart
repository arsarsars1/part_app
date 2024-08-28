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
    return this
        .replaceAll(PhoneNumberCharacter.plus.char, '')
        .replaceAll(PhoneNumberCharacter.space.char, '')
        .replaceAll(PhoneNumberCharacter.dash.char, '')
        .replaceAll(PhoneNumberCharacter.openParen.char, '')
        .replaceAll(PhoneNumberCharacter.closeParen.char, '');
  }

  String removeCountryCode(String code) {
    if (startsWith(code)) {
      return substring(code.length);
    }
    return this;
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
