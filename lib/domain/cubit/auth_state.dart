part of 'auth_cubit.dart';

enum Status { initial, loading, loaded, error }

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(Status.initial) Status status,
    @Default(null) Credentials? credentials,
    @Default('') String message,
  }) = _AuthState;
}
