import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/common.dart';
import 'package:part_app/model/data_model/manager_request.dart';
import 'package:part_app/model/data_model/manager_response.dart';
import 'package:part_app/model/service/api.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  ManagerCubit() : super(ManagerInitial());

  final _managerService = ManagerService();

  ManagerRequest _managerRequest = const ManagerRequest();

  List<Manager>? _managers;

  Manager? _manager;

  List<Manager>? get managers => _managers;

  ManagerRequest get managerRequest => _managerRequest;

  Manager? get manager => _manager;

  void updateRequest(ManagerRequest request) {
    _managerRequest = request;
  }

  Future createManager() async {
    emit(CreatingManager());
    Common? response = await _managerService.createManager(
      request: _managerRequest,
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
      _managers = response.managers;
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
}
