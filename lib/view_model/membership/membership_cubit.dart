import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/model/service/membership/membership.dart';
import 'package:part_app/view_model/cubits.dart';

part 'membership_state.dart';

class MembershipCubit extends Cubit<MembershipState> {
  final AuthCubit authCubit;

  MembershipCubit({required this.authCubit}) : super(MembershipInitial());

  final _membershipService = MembershipService();

  List<Membership> _memberships = [];

  List<Membership> _filteredMemberships = [];

  String? _salesManPhoneNo;

  List<Membership> get memberships => _memberships;

  List<Membership> get filteredMemberships => _filteredMemberships;

  Membership? _selectedMembership;

  Membership? get selectedMembership => _selectedMembership;

  String? get salesManNumber => _salesManPhoneNo;

  set salesManNumber(String? phone) {
    _salesManPhoneNo = phone;
  }

  set selectedMembership(Membership? membership) {
    _selectedMembership = membership;
    emit(MembershipLoaded());
  }

  Future getMembership() async {
    emit(MembershipLoading());
    List<Membership> membership = await _membershipService.getMembershipTypes();
    _memberships = membership;
    filterMembership(true);
  }

  void filterMembership(bool free) {
    _selectedMembership = null;
    if (free) {
      _filteredMemberships = _memberships
          .where((element) => element.paymentType == 'free')
          .toList();
    } else {
      _filteredMemberships = _memberships
          .where((element) => element.paymentType != 'free')
          .toList();
    }
    emit(MembershipLoaded());
  }

  Future sendOTP({String? phoneNo, bool resend = false}) async {
    if (!resend) {
      _salesManPhoneNo = phoneNo;
    }
    var value = await _membershipService.getOTPForSales(
      academyId: authCubit.user?.adminDetail?.academy?.id,
      membershipID: _selectedMembership?.id,
      phoneNo: _salesManPhoneNo!,
    );
  }

  Future addMemberShip({required String paymentCode}) async {
    var value = await _membershipService.addMembership(
      academyId: authCubit.user?.adminDetail?.academy?.id,
      membershipID: _selectedMembership?.id,
      paymentMethod: 'offline', // todo
      salesManOtp: paymentCode,
    );
  }
}
