import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/core/injection.dart';
import 'package:fluttertest/app/services/localStroage.dart';
import 'package:fluttertest/app/services/local_storage_service.dart';
import 'package:fluttertest/domain/usecase/auth/login_usecase.dart';
import 'package:fluttertest/presentation/bloc/core/app_bloc.dart';
import 'package:fluttertest/presentation/bloc/splash/splashEvent.dart';
import 'package:fluttertest/presentation/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final setLoginToken _loginuc;
  SplashBloc(this._loginuc) : super(SplashLoading()) {
    on<splashLoginEvent>(
      initial,
    );
  }

  void initial(
    SplashEvent event,
    Emitter<SplashState> emit,
  ) async {
    try {
      var ls = locator.get<LocalStorageService>();
      if (ls.token != null) {
        final result = await _loginuc.execute(ls.token!);
        result.fold(
          (failure) {
            emit(SplashSuccessNotAutorized());
          },
          (data) {
            var myAppModel = locator.get<appBloc>();

            myAppModel.addToken(ls.token!);
            emit(SplashSuccessAutorized());
          },
        );
      } else {
        emit(SplashSuccessNotAutorized());
      }
    } catch (_) {
      emit(SplashError());
    }
  }
}
