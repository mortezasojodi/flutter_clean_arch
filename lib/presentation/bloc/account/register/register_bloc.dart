import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/component/Dialog/OverLayDialog/DialogHelper.dart';
import 'package:fluttertest/app/core/context.dart';
import 'package:fluttertest/app/core/injection.dart';
import 'package:fluttertest/app/services/localStroage.dart';
import 'package:fluttertest/app/services/local_storage_service.dart';
import 'package:fluttertest/domain/usecase/auth/login_usecase.dart';
import 'package:fluttertest/domain/usecase/auth/register_usecase.dart';
import 'package:fluttertest/presentation/bloc/account/register/register_event.dart';
import 'package:fluttertest/presentation/bloc/account/register/register_state.dart';

class registerBloc extends Bloc<registerEvent, registerState> {
  final setRegisteruc _setRegister;
  final setLoginuc _setLogin;
  registerBloc(this._setRegister, this._setLogin) : super(registerEmpty()) {
    on<setRegisterEvent>(_onLoginFetch);
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> FormKey = new GlobalKey<FormState>();
  Future<void> _onLoginFetch(
    setRegisterEvent event,
    Emitter<registerState> emit,
  ) async {
    if (FormKey.currentState!.validate()) {
      emit(registerLoading());
      final result =
          await _setRegister.execute(email.text, password.text, name.text);
      await result.fold(
        (failure) {
          emit(registerError(failure.message));
        },
        (data) async {
          final resultlogin = await _setLogin.execute(
            email.text,
            password.text,
          );
          resultlogin.fold(
            (failure) {
              emit(registerError(failure.message));
            },
            (data) {
              var ls = locator.get<LocalStorageService>();
              ls.instance?.localStorageSet(
                prefName: "Token",
                prefValue: data,
              );
              var temp = DialogHelper();
              temp.hide(Vzcontext(), id: "registerpage");
              emit(registerSuccess());
            },
          );
        },
      );
    }
  }
}
