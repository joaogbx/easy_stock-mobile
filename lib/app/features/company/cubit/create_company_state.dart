part of 'create_company_cubit.dart';

@freezed
abstract class CreateCompanyState with _$CreateCompanyState {
  factory CreateCompanyState({
    @Default(false) bool loading,
    @Default(null) company,
    @Default(null) errorMessage,
  }) = $CreateCompanyState;
}
