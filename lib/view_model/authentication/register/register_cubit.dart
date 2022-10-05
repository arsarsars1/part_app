import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  String? _phoneNo;
  String? _countryCode;

  String get phoneNumber => '+$_countryCode $_phoneNo';
}
