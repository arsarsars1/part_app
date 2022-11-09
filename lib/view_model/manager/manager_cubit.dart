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

  List<Manager>? get managers => _managers;

  ManagerRequest get managerRequest => _managerRequest;

  void updateRequest(ManagerRequest request) {
    _managerRequest = request;
  }

  Future createManager() async {
    emit(CreatingManager());
    Common? response = await _managerService.createManager(
      request: _managerRequest,
    );

    if (response != null && response.status == 1) {
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
        FetchingManagerFailed('Failed to get managers'),
      );
    }
  }
}
