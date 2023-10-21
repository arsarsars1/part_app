// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  int _i = 1;

  emitProfileLoaded(String url) {
    emit(ProfileLoaded('$url?v=$_i'));
    _i++;
  }

  emitProfileInitial() {
    emit(ProfileInitial());
  }
}
