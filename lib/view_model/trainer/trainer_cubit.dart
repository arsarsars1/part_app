// ignore_for_file: unused_field

import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/salary_slip.dart';
import 'package:part_app/model/data_model/trainer_request.dart';
import 'package:part_app/model/data_model/trainer_response.dart';
import 'package:part_app/model/data_model/trainer_salary_slip.dart';
import 'package:part_app/model/service/admin/branch.dart';
import 'package:part_app/model/service/admin/trainer.dart';
import 'package:part_app/view_model/utils.dart';

part 'trainer_state.dart';

class TrainerCubit extends Cubit<TrainerState> {
  TrainerCubit() : super(TrainerInitial());

  final _trainerService = TrainerService();
  final _branchService = BranchService();

  int page = 1;
  String? nextPageUrl = '';
  List<Data> salaryInvoice = [];
  late Data? slipDetails;
  late Data? trainerSlipDetails = Data();
  int? branchId;
  int? year;
  int? month;

  void clean() {
    page = 1;
    nextPageUrl = '';
    salaryInvoice.clear();
    emit(TrainerInitial());
  }

  Trainer? _trainer;
  List<Trainer>? _trainers;

  List<Trainer> _filteredTrainers = [];
  List<int> _selectedBranches = [];

  Trainer? get trainer => _trainer;

  List<Trainer>? get trainers => _trainers;

  List<Trainer> get filteredTrainers => _filteredTrainers;

  final bool _isActive = true;

  TrainerResponse? tempResponse;

  TrainerRequest _request = const TrainerRequest();

  TrainerRequest get request => _request;

  File? image, doc1, doc2;

  List<int> get selectedBranches => _selectedBranches;

  set selectedBranches(List<int> branches) {
    _selectedBranches.clear();
    _selectedBranches.addAll(branches);
  }

  bool fromBranch = false;

  set trainer(Trainer? temp) {
    _trainer = temp;
    emit(TrainerDetailsLoaded());
  }

  set filteredTrainers(List<Trainer> temp) {
    _filteredTrainers = temp;
    emit(TrainersFetched());
  }

  Future getTrainerDetails({required int trainerId}) async {
    emit(TrainerDetailsLoading());
    Trainer? temp = await _trainerService.getTrainerById(trainerId: trainerId);
    if (temp != null && temp.trainerDetail != null) {
      trainer = temp;
      _selectedBranches =
          trainer!.trainerDetail![0].branches?.map((e) => e.id).toList() ?? [];
      emit(TrainerDetailsLoaded());
      return;
    }
    emit(TrainerDetailsFailed('Failed to load the trainer details'));
  }

  void clearTrainers() {
    _trainers?.clear();
  }

  void updateBranchSelection(int branchId) {
    if (_selectedBranches.contains(branchId)) {
      _selectedBranches.remove(branchId);
    } else {
      _selectedBranches.add(branchId);
    }
    emit(BranchesUpdated());
  }

  Future getTrainers({bool nextPage = false}) async {
    emit(FetchingTrainers());
    TrainerResponse? response = await _trainerService.getTrainers();
    tempResponse = response;

    if (response?.trainers != null) {
      _trainers = response?.trainers?.data ?? [];
      // filterTrainers(active: _isActive);
    } else {
      emit(FailedToFetchTrainers('Failed to fetch the trainers'));
    }
  }

  /// reset
  void reset() {
    _trainers?.clear();
    emit(TrainerInitial());
  }

  Future getActiveInactiveTrainers(
      {int? branchId,
      bool nextPage = false,
      active = false,
      clean = false}) async {
    emit(FetchingTrainers());
    TrainerResponse? response = active
        ? await _trainerService.getActiveTrainers(
            branchId: branchId, active: active)
        : await _trainerService.getActiveTrainers(branchId: branchId);
    tempResponse = response;

    if (response?.trainers?.data != null) {
      _trainers = response?.trainers?.data ?? [];
      emit(TrainersFetched());
      // filterTrainers(active: _isActive);
    } else {
      emit(FailedToFetchTrainers('Failed to fetch the trainers'));
    }
  }

  Future getRestOfTheTrainers({bool nextPage = false}) async {
    String? arg = "";
    if (tempResponse?.trainers?.nextPageUrl != null) {
      arg = tempResponse?.trainers?.nextPageUrl?.split("?")[1];
    }
    if (nextPage) {
      TrainerResponse? response1 =
          await _trainerService.getRestOfTheTrainers(path: arg);
      if (response1?.trainers != null) {
        for (Trainer element in response1?.trainers?.data ?? []) {
          if (_trainers?.contains(element) == false) {
            _trainers = [...?_trainers, element];
          }
        }
        // filterTrainers(active: _isActive);
      }
    }
  }

  // List<Trainer>? filterTrainers({required bool active}) {
  //   _isActive = active;
  //   log("=======================================================================");
  //   _trainers?.forEach((element) {
  //     log(element.toJson().toString());
  //   });
  //   log("=======================================================================");
  //   List<Trainer>? list = _trainers?.where((element) {
  //     if (active) {
  //       return element.trainerDetail?[0].isActive == 1;
  //     } else {
  //       return element.trainerDetail?[0].isActive == 0;
  //     }
  //   }).toList();

  //   filteredTrainers = list ?? [];

  //   return list;
  // }

  Future searchTrainers(int? branchID, {String? query}) async {
    _trainers = [];
    emit(FetchingTrainers());

    if (branchID != null && query == null) {
      var response = await _branchService.getTrainers(
        branchId: branchID.toString(),
      );
      _trainers = response?.trainers?.data;
    }

    if (query != null) {
      _trainers = await _trainerService.searchTrainer(
        branchID,
        query: query,
      );
    }

    if (_trainers != null) {
      // filterTrainers(active: _isActive);
      emit(SearchedTrainers());
    } else {
      emit(FailedToFetchTrainers('Failed to fetch the trainers'));
    }
  }

  void updateRequest(
    TrainerRequest trainerRequest, {
    File? image,
    File? doc1,
    File? doc2,
  }) async {
    if (image != null) {
      this.image = image;
    }
    if (doc1 != null) {
      this.doc1 = doc1;
    }
    if (doc2 != null) {
      this.doc2 = doc2;
    }
    _request = trainerRequest;
    if (kDebugMode) {
      log(_request.toString());
    }
  }

  Future createTrainer() async {
    emit(CreatingTrainer());
    Map<String, dynamic> map = _request.toJson();

    /// prepare files for upload
    if (image != null) {
      MultipartFile? imageFile = await Utils().generateMultiPartFile(image!);
      map.putIfAbsent('profile_pic', () => imageFile);
    }

    if (doc1 != null) {
      MultipartFile? doc1File = await Utils().generateMultiPartFile(doc1!);
      map.putIfAbsent('document_1', () => doc1File);
    }

    if (doc2 != null) {
      MultipartFile? doc2File = await Utils().generateMultiPartFile(doc2!);

      map.putIfAbsent('document_2', () => doc2File);
    }
    Common? response = await _trainerService.createTrainer(map);

    if (response != null && response.status == 1) {
      emit(TrainerCreated(fromBranch));
    } else {
      emit(
        CreatingTrainerFailed(
          response?.message ?? 'Failed to create the trainer',
        ),
      );
    }
  }

  Future trainerStatus({required int id, required int status}) async {
    emit(UpdatingTrainer());
    Common? response = await _trainerService.updateTrainerStatus(
      trainerId: id,
      status: status,
    );

    if (response?.status == 1) {
      emit(TrainerStatusUpdated(status == 1));
      await getTrainers();
      await getTrainerDetails(trainerId: id);
    } else {
      emit(UpdatingTrainerFailed('Fetching manager details failed.'));
    }
  }

  Future updateTrainer(TrainerRequest request, {File? doc1, File? doc2}) async {
    emit(UpdatingTrainer());
    Map<String, dynamic> data = request.toJson();

    data.removeWhere((key, value) => value == null);

    if (doc1 != null) {
      MultipartFile? doc1File = await Utils().generateMultiPartFile(doc1);
      data.putIfAbsent('document_1', () => doc1File);
    }

    if (doc2 != null) {
      MultipartFile? doc2File = await Utils().generateMultiPartFile(doc2);

      data.putIfAbsent('document_2', () => doc2File);
    }

    Common? common = await _trainerService.updateTrainer(
      data,
      trainer!.trainerDetail![0].id,
    );

    if (common?.status == 1) {
      await clearImageCache();
      await getTrainerDetails(
        trainerId: trainer!.trainerDetail![0].id,
      );
      await getTrainers();
      emit(TrainerUpdated());
    } else {
      emit(
        UpdatingTrainerFailed(common?.message ?? 'Failed to update trainer'),
      );
    }
  }

  Future updateProfilePic({required File profilePic}) async {
    emit(UpdatingTrainer());
    MultipartFile? picFile = await Utils().generateMultiPartFile(profilePic);
    Map<String, dynamic> data = {
      'profile_pic': picFile,
    };
    Common? common = await _trainerService.updateTrainer(
      data,
      trainer!.trainerDetail![0].id,
    );
    if (common?.status == 1) {
      await clearImageCache();
      await getTrainerDetails(
        trainerId: trainer!.trainerDetail![0].id,
      );
      await getTrainers();
      emit(TrainerUpdated());
    } else {
      emit(
        UpdatingTrainerFailed(common?.message ?? 'Failed to update trainer'),
      );
    }
  }

  void cleanup() {
    doc1 = null;
    doc2 = null;
    image = null;

    _request = const TrainerRequest();
  }

  Future clearImageCache() async {
    var tempTrainer = trainer!.trainerDetail![0];
    var docUrl1 =
        '${F.baseUrl}/admin/documents/trainer/${tempTrainer.id}/${tempTrainer.document1}';
    var docUrl2 =
        '${F.baseUrl}/admin/documents/trainer/${tempTrainer.id}/${tempTrainer.document2}';

    var profileUrl =
        '${F.baseUrl}/admin/images/trainer/${tempTrainer.id}/${tempTrainer.profilePic}';

    // clear doc 1
    await CachedNetworkImage.evictFromCache(docUrl1);
    // clear doc 2
    await CachedNetworkImage.evictFromCache(docUrl2);
    // clear profile pic
    await CachedNetworkImage.evictFromCache(profileUrl);
  }

  Future getSalaryDetails({
    int? trainerId,
    int? month,
    int? year,
    bool clean = false,
    String? searchQuery = '',
    int? branchId,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      salaryInvoice.clear();
      emit(FetchingTrainerSalary());
    } else {
      emit(FetchingTrainerSalary(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(TrainerSalaryFetched());
      return;
    }

    TrainerSalarySlip? response = await _trainerService.salaryDetails(
      month: month,
      year: year,
      trainerId: trainerId,
      pageNo: page,
      branchId: branchId,
      searchQuery: searchQuery,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.salarySlips?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      salaryInvoice.addAll(response?.salarySlips?.data ?? []);
      if (branchId == null) {
        salaryInvoice.removeWhere((element) =>
            element.trainerDetail?.name != trainer?.trainerDetail?[0].name);
      }
      emit(TrainerSalaryFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getSalaryDetailsForTrainer({
    int? trainerId,
    int? month,
    int? year,
    bool clean = false,
    String? searchQuery = '',
    int? branchId,
    String? trainerName,
  }) async {
    if (clean) {
      page = 1;
      nextPageUrl = '';
      salaryInvoice.clear();
      emit(FetchingTrainerSalary());
    } else {
      emit(FetchingTrainerSalary(pagination: true));
    }

    if (nextPageUrl == null) {
      emit(TrainerSalaryFetched());
      return;
    }

    TrainerSalarySlip? response = await _trainerService.salaryDetailsForTrainer(
      month: month,
      year: year,
      trainerId: trainerId,
      pageNo: page,
      branchId: branchId,
      searchQuery: searchQuery,
    );

    if (response?.status == 1) {
      nextPageUrl = response?.salarySlips?.nextPageUrl;
      if (nextPageUrl != null) {
        page++;
      }

      salaryInvoice.addAll(response?.salarySlips?.data ?? []);
      if (branchId == null) {
        salaryInvoice.removeWhere(
            (element) => element.trainerDetail?.name != trainerName);
      }
      emit(TrainerSalaryFetched(moreItems: nextPageUrl != null));
    }
  }

  Future getSalaryInvoice(int? trainerSlipId) async {
    emit(FetchingSalaryDetails());
    SalarySlip? response =
        await _trainerService.salaryPayments(trainerSlipId: trainerSlipId);
    if (response?.status == 1) {
      trainerSlipDetails = response?.salarySlip;
      emit(SalaryDetailsFetched());
    } else {
      emit(SalaryDetailsFetchFailed('Failed to add link.'));
    }
  }

  Future addSalary(int? slipId, Map<String, dynamic> data) async {
    try {
      emit(AddingSalary());
      Common? response = await _trainerService.addSalary(slipId, data);

      if (response?.status == 1) {
        emit(AddedSalary(response?.message ?? 'Salary Added'));
      } else {
        emit(AddSalaryFailed(response?.message ?? 'Failed to add.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future addAdvanceFees(Map<String, dynamic> data) async {
    try {
      emit(AddingSalary());
      Common? response = await _trainerService.addAdvanceFees(data);

      if (response?.status == 1) {
        emit(AddedSalary(response?.message ?? 'Salary Added'));
      } else {
        emit(AddSalaryFailed(response?.message ?? 'Failed to add salary.'));
      }
    } catch (e) {
      return null;
    }
  }

  Future closeOffSalary(Map<String, dynamic> request,
      {required int? slipId}) async {
    emit(ClosingSalary());
    Common? response = await _trainerService.closeOffFees(
      request,
      slipId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(ClosedSalary(response?.message ?? 'Salary Closed'));
    } else {
      emit(CloseSalaryFailed(response?.message ?? 'Failed to close salary'));
    }
  }

  Future deleteSalary({required int? slipId, required int? paymentId}) async {
    emit(DeletingSalary());
    Common? response = await _trainerService.deleteSalary(
      slipId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(DeletedSalary(response?.message ?? 'Salary Deleted'));
    } else {
      emit(DeleteSalaryFailed(response?.message ?? 'Salary Deletion Failed'));
    }
  }

  Future editSalary(Map<String, dynamic> request,
      {required int? slipId, required int? paymentId}) async {
    emit(EditingSalary());
    Common? response = await _trainerService.editSalary(
      request,
      slipId,
      paymentId,
    );
    if (response?.status == 1) {
      // await getRescheduledBatches();
      emit(EditedSalary(response?.message ?? 'Salary Editted'));
    } else {
      emit(EditSalaryFailed(response?.message ?? 'Failed to edit'));
    }
  }

  void clear() {}

  bool checkPhoneNumber(Contact contact) {
    String temp = (contact.phoneNumbers?.first ?? '').replaceAll(' ', '');
    if (RegExp(r'^\d+$').hasMatch(temp) ||
        (temp.startsWith('+') && RegExp(r'^\+\d+$').hasMatch(temp)) ||
        temp.length >= 10) {
      String prefix = temp.substring(0, temp.length - 10);
      if (prefix == "" || prefix == "0" || prefix == "+91" || prefix == "91") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  String get10DigitsPhoneNumber(Contact contact) {
    String temp = (contact.phoneNumbers?.first ?? '').replaceAll(' ', '');
    String? lastTenDigits = temp.substring(temp.length - 10);
    return lastTenDigits;
  }
}
