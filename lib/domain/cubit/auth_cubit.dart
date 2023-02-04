import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_ehrlich_weather/data/repositories/repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repository}) : super(const AuthState());

  final AuthRepositories repository;

  void login() async {
    try {
      emit(state.copyWith(status: Status.loading));
      final credentials = await repository.login();
      emit(state.copyWith(status: Status.loaded, credentials: credentials));
    } catch (e) {
      emit(state.copyWith(status: Status.error, message: e.toString()));
    }
  }

  void logout() async {
    try {
      emit(state.copyWith(status: Status.loading));
      await repository.logout();
      emit(state.copyWith(status: Status.loaded));
    } catch (e) {
      emit(state.copyWith(status: Status.error, message: e.toString()));
    }
  }
}
