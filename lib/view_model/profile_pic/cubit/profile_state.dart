// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String profilePic;

  ProfileLoaded(this.profilePic);

}
