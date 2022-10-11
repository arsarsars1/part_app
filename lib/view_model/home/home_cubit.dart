import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_app/model/data_model/dashboard.dart';
import 'package:part_app/model/service/dashboard/dashboard_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _service = DashboardService();
  List<Banner>? _banner;

  List<Banner>? get banner => _banner;

  Future getDashboard() async {
    emit(DashboardLoading());
    var tempDash = await _service.getDashboard();
    _banner = tempDash?.banners;

    emit(DashboardLoaded());
  }
}
