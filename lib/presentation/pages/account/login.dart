import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertest/app/component/Dialog/OverLayDialog/DialogHelper.dart';
import 'package:fluttertest/app/component/Dialog/OverLayDialog/DialogWidget.dart';
import 'package:fluttertest/app/component/button.dart';

import 'package:fluttertest/app/component/entryfieald.dart';
import 'package:fluttertest/app/config/app_constants.dart';
import 'package:fluttertest/app/config/color_constants.dart';
import 'package:fluttertest/app/util/routing.dart';

import 'package:fluttertest/data/repositorys/auth_repository_imp.dart';
import 'package:fluttertest/domain/usecase/auth/login_usecase.dart';
import 'package:fluttertest/presentation/bloc/account/login/login_bloc.dart';
import 'package:fluttertest/presentation/bloc/account/login/login_event.dart';
import 'package:fluttertest/presentation/bloc/account/login/login_state.dart';
import 'package:fluttertest/presentation/pages/account/register.dart';
import 'package:fluttertest/presentation/pages/main_screen/main_screen.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((c) => loginBloc(setLoginuc(authRepositoryImpl()))),
      child: BlocConsumer<loginBloc, LoginState>(listener: (context, state) {
        if (state is loginSuccess) {
          VzpushAndRemoveUntil(mainScreen());
        }
      }, builder: (ctx, state) {
        return Scaffold(
          backgroundColor: lightBlue,
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 4,
                    ),
                    entryField(
                      "Email Address",
                      contentPadding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                      filledcolor: Colors.white,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.mail_outline,
                              color: cdarkGrey,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: cdarkGrey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cdarkGrey),
                      ),
                      hintstyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: cdarkGrey,
                          height: 2.3),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    entryField(
                      "Password",
                      isPassword: true,
                      maxLines: 1,
                      contentPadding: EdgeInsets.fromLTRB(12, 15, 12, 15),
                      filledcolor: Colors.white,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.key,
                              color: cdarkGrey,
                            ),
                          ),
                        ],
                      ),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: cdarkGrey),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cdarkGrey),
                      ),
                      hintstyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: cdarkGrey,
                          height: 2.3),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CustomButton(
                        onTap: () {
                          ctx.read<loginBloc>().add(
                              setLoginEvent("admin@mail.com", r'$tad183Qu9'));
                        },
                        borderRadius: 40,
                        width: null,
                        height: 60,
                        color: nearYeallow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (state is loginLoading)
                                ? SpinKitThreeBounce(
                                    color: Colors.white,
                                    size: 20,
                                  )
                                : Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: CustomButton(
                        onTap: () {
                          var temp = DialogHelper();
                          temp.BACKGROUND_COLOR = Colors.transparent;
                          temp.show(
                              context,
                              DialogWidget.custom(
                                closable: true,
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  height: MediaQuery.of(context).size.height -
                                      ((MediaQuery.of(context).padding.top +
                                              kToolbarHeight) *
                                          2),
                                  color: Colors.white,
                                  child: register(),
                                ),
                              ),
                              animationController: animationController,
                              id: "registerpage");
                        },
                        borderRadius: 40,
                        width: null,
                        height: 60,
                        color: nearYeallow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text.rich(
                            TextSpan(children: <InlineSpan>[
                              TextSpan(
                                  text:
                                      "By starting this game, you agree to our ",
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: "Term of Use",
                                  style: TextStyle(color: yelloLight)),
                              TextSpan(
                                  text: " and ",
                                  style: TextStyle(color: Colors.white)),
                              TextSpan(
                                  text: " Privacy Policy",
                                  style: TextStyle(color: yelloLight)),
                            ]),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
