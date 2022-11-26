import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/admin/branch.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());
  final _branchService = BranchService();

  List<Branch> _branches = [];
  List<Trainer>? _trainers = [];

  Branch? _branch;

  List<Branch> get branches => _branches;

  List<Trainer>? get trainers => _trainers;

  Branch? get branch => _branch;

  set branch(Branch? tempBranch) {
    _branch = tempBranch;
    emit(BranchLoaded());
  }

  set branches(List<Branch> tempBranches) {
    _branches = tempBranches;
    emit(BranchesLoaded());
  }

  set trainers(List<Trainer>? tempTrainers) {
    _trainers = tempTrainers;
    emit(TrainersLoaded());
  }

  /// METHOD TO GET THE LIST OF BRANCHES
  /// for the logged in admin user

  Future getBranches() async {
    emit(BranchesLoading());
    List<Branch>? list = await _branchService.getBranches();

    branches = list ?? [];
  }

  /// Method to get thr details for the specific branch
  /// [ id ] is the branch Id and is required
  Future getBranchById({required String id}) async {
    emit(BranchLoading());
    Branch? temp = await _branchService.getBranchById(id: id);

    if (temp != null) {
      branch = temp;
    } else {
      emit(BranchLoadingFailed());
    }
  }

  /// Method to get thr trainers list for the specific branch
  /// [ branchId ] is the branch Id and is required
  Future getBranchTrainers({required String branchId}) async {
    emit(TrainersLoading());
    List<Trainer>? temp = await _branchService.getTrainers(
      branchId: branchId,
    );
    if (temp != null) {
      trainers = temp;
      emit(TrainersLoaded());
    } else {
      emit(TrainersFailed('Failed to get the trainers list'));
    }
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

  Future updateBranch({
    required String stateId,
    required String branchName,
    required String countryId,
    required String districtId,
    required String location,
    required String address,
    required String pinCode,
    required int isActive,
  }) async {
    // informs the UI to show the Loader
    emit(UpdatingBranch());

    // requests the API to create a new Branch
    Common? common = await _branchService.update(
      stateId: stateId,
      branchName: branchName,
      countryId: countryId,
      districtId: districtId,
      location: location,
      address: address,
      pinCode: pinCode,
      branchId: branch?.id,
      isActive: isActive,
    );

    if (common != null && common.status == 1) {
      // if success ca get the branches from API & update the UI
      await getBranchById(id: '${branch?.id}');
      await getBranches();
      emit(UpdatedBranch());
    } else {
      // update the UI when the branch adding API failed
      emit(
        UpdateBranchFailed(
          common?.message ?? 'Failed to add branch, please try gain.',
        ),
      );
    }
  }

  @Deprecated('This feature is removed and the same is moved to update API')
  Future changeBranchStatus({
    required int status,
  }) async {
    await _branchService.changeBranchStatus(
      status: status,
      branchId: branch!.id,
    );

    await getBranchById(id: '${branch?.id}');
  }

  List<DropDownItem> dropDownBranches() {
    return _branches.where((element) => element.isActive ==1)
        .map((e) => DropDownItem(id: e.id, title: e.branchName, item: e))
        .toList();
  }

  List<DropDownItem> branchesWithoutManager() {
    return _branches
        .where((element) => element.managerDetail == null)
        .map((e) => DropDownItem(id: e.id, title: e.branchName, item: e))
        .toList();
  }
}
