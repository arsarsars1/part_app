import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/membership.dart';
import 'package:part_app/model/service/membership/membership.dart';

part 'membership_state.dart';

class MembershipCubit extends Cubit<MembershipState> {
  MembershipCubit() : super(MembershipInitial());

  final _membershipService = MembershipService();

  List<Membership> _memberships = [];

  List<Membership> _filteredMemberships = [];

  List<Membership> get memberships => _memberships;

  List<Membership> get filteredMemberships => _filteredMemberships;

  Membership? _selectedMembership;

  Membership? get selectedMembership => _selectedMembership;

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
}
