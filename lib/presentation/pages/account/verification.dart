import 'package:flutter/material.dart';

import 'package:fluttertest/app/component/Dialog/OverLayDialog/DialogHelper.dart';
import 'package:fluttertest/app/component/Dialog/OverLayDialog/DialogWidget.dart';
import 'package:fluttertest/app/component/button.dart';

import 'package:fluttertest/app/config/color_constants.dart';
import 'package:fluttertest/presentation/pages/account/register.dart';

class verification extends StatefulWidget {
  const verification({Key? key}) : super(key: key);

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      backgroundColor: lightBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Text(
              "No Account Found",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "Would you like to create a new account with:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "mortezasojodi70@gmai.com",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
            Text("Use a diffrent email",
                style: TextStyle(
                    color: cneargold,
                    fontWeight: FontWeight.w700,
                    fontSize: 22)),
            Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
