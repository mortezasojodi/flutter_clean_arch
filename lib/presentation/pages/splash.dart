import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/app/util/routing.dart';
import 'package:fluttertest/data/repositorys/auth_repository_imp.dart';
import 'package:fluttertest/domain/usecase/auth/login_usecase.dart';
import 'package:fluttertest/presentation/bloc/splash/splashEvent.dart';
import 'package:fluttertest/presentation/bloc/splash/splash_bloc.dart';
import 'package:fluttertest/presentation/bloc/splash/splash_state.dart';

class splash extends StatelessWidget {
  const splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (c) => SplashBloc(setLoginToken(authRepositoryImpl()))
          ..add(splashLoginEvent()),
        child: BlocConsumer<SplashBloc, SplashState>(listener: (c, state) {
          if (state is SplashSuccessAutorized) {
            VzpushNamedAndRemoveUntil("/MainScreen", null);
          } else if (state is SplashSuccessNotAutorized) {
            VzpushNamedAndRemoveUntil("/login", null);
          }
        }, builder: (context, s) {
          return Container();
        }));
  }
}
