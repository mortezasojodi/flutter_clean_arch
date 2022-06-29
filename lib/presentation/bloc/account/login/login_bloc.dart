import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/core/injection.dart';
import 'package:fluttertest/app/services/localStroage.dart';

import 'package:fluttertest/app/services/local_storage_service.dart';
import 'package:fluttertest/domain/usecase/auth/login_usecase.dart';
import 'package:fluttertest/presentation/bloc/account/login/login_event.dart';
import 'package:fluttertest/presentation/bloc/account/login/login_state.dart';

class loginBloc extends Bloc<loginEvent, LoginState> {
  final setLoginuc _setLogin;

  loginBloc(this._setLogin) : super(LoginEmpty()) {
    on<setLoginEvent>(_onLoginFetch);
  }

  Future<void> _onLoginFetch(
    setLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(loginLoading());
    final result = await _setLogin.execute(event.email, event.password);
    result.fold(
      (failure) {
        emit(loginError(failure.message));
      },
      (data) {
        var myAppModel = locator.get<LocalStorageService>();
        myAppModel.instance!.localStorageSet(
          prefName: "Token",
          prefValue: data,
        );
        emit(loginSuccess());
      },
    );
  }
}
