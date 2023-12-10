import 'dart:async';
import 'dart:developer';

import 'package:coffee_wonders_for_technical/core/resources/color_manager.dart';

import '../../../core/resources/routes_manager.dart';
import '../../../main.dart';
import '../data/params.dart';
import '../data/repo/auth_repo.dart';
import '/core/resources/constants_manager.dart';
import '/core/services/shared_prefrences/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<AuthLoginEvent>(onLoginEvent);

    on<AuthLogoutEvent>(onLogoutEvent);
  }

  bool isLoading = false;

  FutureOr<void> onLoginEvent(
      AuthLoginEvent event, Emitter<AuthState> emit) async {
    isLoading = true;
    emit(AuthLoginLoading());
    final result = await _authRepository.login(
      LoginParams(
        email: event.params.email,
        password: event.params.password,
      ),
    );
    log(isLoading.toString());

    result.fold(
      (failure) {
        isLoading = false;

        ScaffoldMessenger.of(event.context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: ColorManager.error,
          ),
        );
        emit(AuthLoginFailure(failure.message));
      },
      (success) {
        isLoading = false;
        _saveTokenToSharedPref(
          token: success.data.token,
          technicalName: success.data.user.name,
          technicalEmail: success.data.user.email,
        );
        log('token: ${success.data.token}');
        Navigator.pushNamedAndRemoveUntil(
          event.context,
          Routes.homeRoute,
          (route) => false,
        );
        emit(AuthLoginSuccess());
      },
    );
  }

  Future<FutureOr<void>> onLogoutEvent(
      AuthLogoutEvent event, Emitter<AuthState> emit) async {
    _removeTokenFromSharedPref();
    Navigator.pushNamedAndRemoveUntil(
      event.context,
      Routes.loginRoute,
      (route) => false,
    );
  }

  _saveTokenToSharedPref({
    required String token,
    required String technicalName,
    required String technicalEmail,
  }) async {
    AppConstants.token = token;
    AppConstants.technicalName = technicalName;
    AppConstants.technicalEmail = technicalEmail;

    await sl<SharedPreferences>().setString(SharedKey.token.name, token);
    await sl<SharedPreferences>()
        .setString(SharedKey.technicalName.name, technicalName);
    await sl<SharedPreferences>()
        .setString(SharedKey.technicalEmail.name, technicalEmail);
  }

  _removeTokenFromSharedPref() async {
    AppConstants.token = '';
    AppConstants.technicalName = '';
    AppConstants.technicalEmail = '';

    await sl<SharedPreferences>().remove(SharedKey.token.name);
    await sl<SharedPreferences>().remove(SharedKey.technicalName.name);
    await sl<SharedPreferences>().remove(SharedKey.technicalEmail.name);
  }
}
