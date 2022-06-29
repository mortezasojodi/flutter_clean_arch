import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttertest/app/component/button.dart';
import 'package:fluttertest/app/component/entryfieald.dart';

import 'package:fluttertest/app/config/color_constants.dart';
import 'package:fluttertest/app/util/routing.dart';

import 'package:fluttertest/data/repositorys/auth_repository_imp.dart';
import 'package:fluttertest/domain/usecase/auth/login_usecase.dart';
import 'package:fluttertest/domain/usecase/auth/register_usecase.dart';
import 'package:fluttertest/presentation/bloc/account/register/register_bloc.dart';
import 'package:fluttertest/presentation/bloc/account/register/register_event.dart';
import 'package:fluttertest/presentation/bloc/account/register/register_state.dart';
import 'package:fluttertest/presentation/pages/main_screen/main_screen.dart';

class register extends StatelessWidget {
  const register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (c) => registerBloc(setRegisteruc(authRepositoryImpl()),
          setLoginuc(authRepositoryImpl())),
      child:
          BlocConsumer<registerBloc, registerState>(listener: (context, state) {
        if (state is registerSuccess) {
          VzPush(mainScreen());
        }
      }, builder: (ctx, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: Form(
                  key: ctx.read<registerBloc>().FormKey,
                  child: ListView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: mainBlue),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Your privacy is important!"),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "About Your Privacy",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 22),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: AutoSizeText(
                                '''specifically American football or Canadian football); Australian rules football; rugby union and rugby league; and Gaelic football.[1] These various forms of football share to varying extent common origins and are known as football codes.''',
                                maxFontSize: 12,
                                minFontSize: 8,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: cdarkGrey),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please enter your name :",
                            style: TextStyle(color: cdarkGrey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: entryField("Name", validator: (value) {
                          if (value!.isEmpty) {
                            return "Cannot be Blank!";
                          }
                          return null;
                        },
                            Controller: ctx.read<registerBloc>().name,
                            maxLines: 1,
                            contentPadding: EdgeInsets.zero,
                            textAlign: TextAlign.center,
                            filledcolor: Colors.white,
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
                              borderSide: BorderSide(color: cdarkGrey),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: cdarkGrey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please enter your email :",
                            style: TextStyle(color: cdarkGrey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: entryField("Email", validator: (value) {
                          if (value!.isEmpty) {
                            return "Cannot be Blank!";
                          }
                          return null;
                        },
                            Controller: ctx.read<registerBloc>().email,
                            maxLines: 1,
                            contentPadding: EdgeInsets.zero,
                            textAlign: TextAlign.center,
                            filledcolor: Colors.white,
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
                              borderSide: BorderSide(color: cdarkGrey),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: cdarkGrey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Please enter your password :",
                            style: TextStyle(color: cdarkGrey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: entryField("Password", validator: (value) {
                          if (value!.isEmpty) {
                            return "Cannot be Blank!";
                          }
                          return null;
                        },
                            Controller: ctx.read<registerBloc>().password,
                            maxLines: 1,
                            contentPadding: EdgeInsets.zero,
                            textAlign: TextAlign.center,
                            filledcolor: Colors.white,
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
                              borderSide: BorderSide(color: cdarkGrey),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: cdarkGrey),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            )),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text("Please choose your gender (optional):"),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     MyRadioListTile<int>(
                      //       value: 2,
                      //       groupValue: 1,
                      //       leading: 'B',
                      //       title: Text(
                      //         'Male',
                      //         style: TextStyle(
                      //             height: 2, fontWeight: FontWeight.bold),
                      //       ),
                      //       onChanged: (value) {},
                      //     ),
                      //     MyRadioListTile<int>(
                      //       value: 3,
                      //       groupValue: 1,
                      //       leading: 'C',
                      //       title: Text(
                      //         'Female',
                      //         style: TextStyle(
                      //             height: 2, fontWeight: FontWeight.bold),
                      //       ),
                      //       onChanged: (value) {},
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       "Learn how we manage your data",
                      //       style: TextStyle(
                      //           color: yelloLight,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 17),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
                child: CustomButton(
                  onTap: () {
                    ctx.read<registerBloc>().add(setRegisterEvent());
                  },
                  borderRadius: 0,
                  width: null,
                  height: 60,
                  color: nearYeallow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Agree to Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _customRadioButton,
            SizedBox(width: 12),
            if (title != null) title,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : null,
        border: Border.all(
          color: isSelected ? Colors.blue : Colors.black,
          width: 2,
        ),
      ),
    );
  }
}
