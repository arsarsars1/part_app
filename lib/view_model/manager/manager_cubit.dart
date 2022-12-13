import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/flavors.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/model/service/api.dart';
import 'package:part_app/view_model/utils.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit() : super(ManagerInitial());

  final _managerService = ManagerService();

  ManagerRequest _managerRequest = const ManagerRequest();

  List<Manager>? _managers;
  Set<int> _selectedBranches = {};
  File? image, doc1, doc2;

  Manager? _manager;

  List<Manager>? get managers => _managers;

  ManagerRequest get managerRequest => _managerRequest;

  Manager? get manager => _manager;

  Set<int> get selectedBranches => _selectedBranches;

  set selectedBranches(Set<int> items) {
    _selectedBranches = items;
  }

  void updateRequest(
    ManagerRequest request, {
    File? image,
    File? doc1,
    File? doc2,
  }) {
    if (image != null) {
      this.image = image;
    }
    if (doc1 != null) {
      this.doc1 = doc1;
    }
    if (doc2 != null) {
      this.doc2 = doc2;
    }
    _managerRequest = request;
  }

  Future createManager() async {
    emit(CreatingManager());
    Map<String, dynamic> map = _managerRequest.toJson();

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
    Common? response = await _managerService.createManager(
      request: map,
    );

    if (response != null && response.status == 1) {
      await getManagers();
      emit(ManagerCreated());
    } else {
      emit(
        ManagerCreationFailed(response?.message ?? 'Failed to create manager'),
      );
    }
  }

  Future getManagers() async {
    emit(FetchingManagers());
    ManagerResponse? response = await _managerService.getManagers();

    if (response != null && response.status == 1) {
      _managers = response.managers?.data;
      emit(ManagersFetched());
    } else {
      emit(
        FetchingManagersFailed('Failed to get managers'),
      );
    }
  }

  Future getManagerById({required int id}) async {
    emit(FetchingManager());
    ManagerResponse? response = await _managerService.getManagerById(
      managerId: id,
    );

    if (response?.status == 1 && response?.manager != null) {
      _manager = response?.manager;

      // creates a set of branches the managers are assigned
      _selectedBranches =
          _manager?.managerDetail?[0].branches?.map((e) => e.id).toSet() ?? {};

      // emits to update the UI
      emit(ManagerFetched());
    } else {
      emit(FetchingManagerFailed('Fetching manager details failed.'));
    }
  }

  Future activateManager({required int id, required int status}) async {
    emit(FetchingManager());
    Common? response = await _managerService.activateManager(
      managerId: id,
      status: status,
    );

    if (response?.status == 1) {
      emit(ManagerFetched());
      await getManagers();
      await getManagerById(id: id);
    } else {
      emit(FetchingManagerFailed('Fetching manager details failed.'));
    }
  }

  void updateBranchSelection(int branchId) {
    if (_selectedBranches.contains(branchId)) {
      _selectedBranches.remove(branchId);
    } else {
      _selectedBranches.add(branchId);
    }
    emit(BranchSelectionUpdated());
  }

  Future updateManager(
      {required Map<String, dynamic> request, File? doc1, File? doc2}) async {
    emit(UpdatingManager());
    request.removeWhere((key, value) => value == null);
    if (doc1 != null) {
      MultipartFile? doc1File = await Utils().generateMultiPartFile(doc1);
      request.putIfAbsent('document_1', () => doc1File);
    }

    if (doc2 != null) {
      MultipartFile? doc2File = await Utils().generateMultiPartFile(doc2!);

      request.putIfAbsent('document_2', () => doc2File);
    }
    try {
      String id = '${manager?.managerDetail?[0].id}';
      Common? response = await _managerService.updateManager(
        data: request,
        branchId: id,
      );
      if (response?.status == 1) {
        await clearImageCache();
        await getManagerById(id: int.parse(id));
        await getManagers();
        emit(UpdatedManager());
      } else {
        emit(
          UpdatingManagerFailed(
              response?.message ?? 'Failed to update manager.'),
        );
      }
    } catch (e) {
      emit(UpdatingManagerFailed(e.toString()));
    }
  }

  Future updateProfile({required File profilePic}) async {
    emit(UpdatingManager());
    MultipartFile? picFile = await Utils().generateMultiPartFile(profilePic);
    Map<String, dynamic> request = {
      'profile_pic': picFile,
    };
    try {
      String id = '${manager?.managerDetail?[0].id}';
      Common? response = await _managerService.updateManager(
        data: request,
        branchId: id,
      );
      if (response?.status == 1) {
        await clearImageCache();
        await getManagerById(id: int.parse(id));
        await getManagers();
        emit(UpdatedManager());
      } else {
        emit(
          UpdatingManagerFailed(
              response?.message ?? 'Failed to update manager.'),
        );
      }
    } catch (e) {
      emit(UpdatingManagerFailed(e.toString()));
    }
  }

  void cleanup() {
    doc1 = null;
    doc2 = null;
    image = null;
    _managerRequest = const ManagerRequest();
  }

  Future clearImageCache() async {
    var tempTrainer = _manager!.managerDetail![0];
    var docUrl1 =
        '${F.baseUrl}/admin/documents/manager/${tempTrainer.id}/${tempTrainer.document_1}';
    var docUrl2 =
        '${F.baseUrl}/admin/documents/manager/${tempTrainer.id}/${tempTrainer.document_1}';

    var profileUrl =
        '${F.baseUrl}/admin/images/manager/${tempTrainer.id}/${tempTrainer.profilePic}';

    // clear doc 1
    await CachedNetworkImage.evictFromCache(docUrl1);
    // clear doc 2
    await CachedNetworkImage.evictFromCache(docUrl2);
    // clear profile pic
    await CachedNetworkImage.evictFromCache(profileUrl);
  }
}
