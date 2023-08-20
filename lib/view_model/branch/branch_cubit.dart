// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/branch_response.dart';
import 'package:part_app/model/data_model/class_model.dart';
import 'package:part_app/model/data_model/class_response.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/drop_down_item.dart';
import 'package:part_app/model/data_model/trainer_model.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/service/admin/branch.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());
  final _branchService = BranchService();

  List<Branch> _branches = [];
  final List<Trainer> _trainers = [];
  List<ClassModel> _classes = [];
  List<ClassModel> _newClasses = [];

  Branch? _branch;

  List<Branch> get branches => _branches;

  List<Branch> get activeBranches =>
      _branches.where((element) => element.isActive == 1).toList();

  List<Trainer>? get trainers => _trainers;

  List<ClassModel>? get classes => _classes;

  List<ClassModel>? get newClasses => _newClasses;

  @Deprecated('Moved the type to TrainerModel')
  List<Trainer>? get activeTrainers => _trainers
      .where((element) => element.trainerDetail?[0].isActive == 1)
      .toList();

  List<TrainerModel> get trainersList =>
      activeTrainers?.map((e) => TrainerModel.fromEntity(e)).toList() ?? [];

  Branch? get branch => _branch;

  // pagination
  int page = 1;
  String? nextPageUrl = '';

  set branch(Branch? tempBranch) {
    _branch = tempBranch;
    emit(BranchLoaded());
  }

  set branches(List<Branch> tempBranches) {
    _branches = tempBranches;
    emit(BranchesLoaded());
  }

  // set trainers(List<Trainer>? tempTrainers) {
  //   _trainers = tempTrainers;
  //   emit(TrainersLoaded());
  // }

  /// METHOD TO GET THE LIST OF BRANCHES
  /// for the logged in admin user

  void clean() {
    page = 1;
    nextPageUrl = '';
    _trainers.clear();
  }

  Future getBranches() async {
    emit(BranchesLoading());
    List<Branch>? list = await _branchService.getBranches();

    branches = list ?? [];
  }

  Future getStudentAppBranches({int? studentId}) async {
    emit(BranchesLoading());
    List<Branch>? list =
        await _branchService.getStudentAppBranches(studentId: studentId);

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
  Future getBranchTrainers({
    required String branchId,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _trainers.clear();
      emit(TrainersLoading());
    } else {
      emit(TrainersLoading(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(TrainersLoaded());
      return;
    }

    var temp = await _branchService.getTrainers(
      branchId: branchId,
      pageNo: page,
    );
    if (temp?.status == 1) {
      nextPageUrl = temp?.trainers?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      _trainers.addAll(temp!.trainers!.data);
      emit(TrainersLoaded());
    } else {
      emit(TrainersFailed('Failed to get the trainers list'));
    }
  }

  Future getBatchTrainers({
    required String batchId,
    bool clean = false,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      _trainers.clear();
      emit(TrainersLoading());
    } else {
      emit(TrainersLoading(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(TrainersLoaded());
      return;
    }

    var temp = await _branchService.getBatchTrainers(
      batchId: batchId,
      pageNo: page,
    );
    if (temp?.status == 1) {
      nextPageUrl = temp?.trainers?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }
      _trainers.addAll(temp!.trainers!.data);
      emit(TrainersLoaded());
    } else {
      emit(TrainersFailed('Failed to get the trainers list'));
    }
  }

  Future getBatchClassesOfDate({
    required String batchId,
    required String branchId,
    required String date,
    bool clean = false,
  }) async {
    // if (clean) {
    //   page = 1;
    //   nextPageUrl = '';
    //   _classes.clear();
    //   // emit(ClassesLoading());
    // }

    // if (nextPageUrl == null) {
    //   emit(ClassesLoaded());
    //   return;
    // }
    emit(ClassesLoading());
    _classes.clear();

    ClassResponse? temp = await _branchService.getBatchClasses(
      batchId: batchId,
      brabchId: branchId,
      date: date,
      pageNo: page,
    );
    if (temp?.status == 1) {
      // nextPageUrl = temp?.trainers?.nextPageUrl;
      // if (nextPageUrl != null) {
      //   page++;
      // }
      var items =
          temp?.classes?.map((e) => ClassModel.fromEntity(e)).toList() ?? [];
      _classes = items;
      // _classes.addAll(temp!.classes);
      emit(ClassesLoaded());
    } else {
      emit(ClassesFailed('Failed to get the class list'));
    }
  }

  Future getBranchClassesOfDate({
    required String branchId,
    required String date,
    bool clean = false,
  }) async {
    _newClasses.clear();

    ClassResponse? temp = await _branchService.getBranchClasses(
      branchId: branchId,
      date: date,
      pageNo: page,
    );
    if (temp?.status == 1) {
      // nextPageUrl = temp?.trainers?.nextPageUrl;
      // if (nextPageUrl != null) {
      //   page++;
      // }
      var items =
          temp?.classes?.map((e) => ClassModel.fromEntity(e)).toList() ?? [];
      _newClasses = items;
      // _classes.addAll(temp!.classes);
      emit(ClassesLoaded());
    } else {
      emit(ClassesFailed('Failed to get the class list'));
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
    } else if (common == null) {
      emit(BranchNetworkError());
    } else {
      // update the UI when the branch adding API failed
      emit(
        AddingBranchFailed(
          common.message ?? 'Failed to add branch, please try gain.',
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
    return _branches
        .where((element) => element.isActive == 1)
        .map((e) => DropDownItem(id: e.id, title: e.branchName, item: e))
        .toList();
  }

  List<DropDownItem> branchesWithoutManager() {
    return _branches
        .where(
            (element) => element.managerDetail == null && element.isActive == 1)
        .map((e) => DropDownItem(id: e.id, title: e.branchName, item: e))
        .toList();
  }

  List<Branch> branchesForManager(int? managerId) {
    return _branches.where((element) {
      if (element.managerDetail?.id == managerId && element.isActive == 1) {
        return true;
      }
      if (element.managerDetail == null && element.isActive == 1) {
        return true;
      }
      return false;
    }).toList();
  }

  DropDownItem? initialBranch(int? branchId) {
    if (branchId == null) return null;
    Branch? item = _branches.firstWhere((element) => element.id == branchId);

    return DropDownItem(id: item.id, title: item.branchName, item: item);
  }
}
