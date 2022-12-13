import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_base/data_base.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/model/data_model/user_response.dart';
import 'package:part_app/model/service/membership/membership_service.dart';
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
    emit(SalesOTPSending());
    if (!resend) {
      _salesManPhoneNo = phoneNo;
    }

    var userStr = await Database().getUser();
    if (userStr != null) {
      var userResp = userResponseFromJson(userStr);
      Common value = await _membershipService.getOTPForSales(
        academyId: userResp.user?.adminDetail?.academy?.id,
        membershipID: _selectedMembership?.id,
        phoneNo: _salesManPhoneNo!,
      );

      if (value.status != 0) {
        emit(SalesOTPSent(resend));
      } else {
        emit(SalesOTPFailed(value.message ?? 'Failed to send OTP.'));
      }
    } else {
      emit(SalesOTPFailed('Failed to send OTP.'));
    }
  }

  Future addMemberShip({
    String? paymentCode,
    String? paymentMethod = 'offline',
    String? orderId,
    String? paymentId,
  }) async {
    var userStr = await Database().getUser();
    emit(CreatingMembership());
    if (userStr != null) {
      try {
        var userResp = userResponseFromJson(userStr);
        Common value = await _membershipService.addMembership(
          academyId: userResp.user?.adminDetail?.academy?.id,
          membershipID: _selectedMembership?.id,
          paymentMethod: paymentMethod,
          salesManOtp: paymentCode,
          orderId: orderId,
          paymentId: paymentId,
        );

        if (value.status == 1) {
          await authCubit.getUser();
          emit(MembershipSuccess());
        } else {
          emit(MembershipFailed(value.message));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(MembershipFailed(e.toString()));
      }
    } else {
      emit(MembershipFailed('Failed to process the request!'));
    }
  }

// Future generateOrderId() {}
}
