import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/service/admin/branch.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());
  final _branchService = BranchService();

  List<Branch> _branches = [];

  List<Branch> get branches => _branches;

  set branches(List<Branch> tempBranches) {
    _branches = tempBranches;
    emit(BranchesLoaded());
  }

  Future getBranches() async {
    emit(BranchesLoading());
    List<Branch>? list = await _branchService.getBranches();
    branches = list ?? [];
  }

  Future addBranch({
    required String stateId,
    required String branchName,
    required String countryId,
    required String districtId,
    required String location,
    required String address,
    required String pinCode,
  }) async {
    // informs the UI to show the Loader
    emit(AddingBranch());

    // requests the API to create a new Branch
    Common? common = await _branchService.create(
      stateId: stateId,
      branchName: branchName,
      countryId: countryId,
      districtId: districtId,
      location: location,
      address: address,
      pinCode: pinCode,
    );

    if (common != null && common.status == 1) {
      // if success ca get the branches from API & update the UI
      getBranches();
      emit(BranchAdded());
    } else {
      // update the UI when the branch adding API failed
      emit(
        AddingBranchFailed(
          common?.message ?? 'Failed to add branch, please try gain.',
        ),
      );
    }
  }
}
