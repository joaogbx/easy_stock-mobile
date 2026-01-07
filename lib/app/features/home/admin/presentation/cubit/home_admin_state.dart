part of 'home_admin_cubit.dart';

@freezed
abstract class HomeAdminState with _$HomeAdminState {
  factory HomeAdminState({
    DashboardModel? dashBoardData,
    @Default(false) bool loading,
  }) = _HomeAdminState;
}
