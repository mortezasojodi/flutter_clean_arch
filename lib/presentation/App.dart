import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:fluttertest/app/config/app_constants.dart';
import 'package:fluttertest/presentation/pages/account/login.dart';
import 'package:fluttertest/presentation/pages/main_screen/main_screen.dart';
import 'package:fluttertest/presentation/pages/splash.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OneNotification<List<Locale>>(
      onVisited: (_, __) {},
      stopBubbling: true,
      rebuildOnNull: true,
      builder: (context, dataLocale) {
        if (dataLocale != null) print('Set Locale: $dataLocale');

        return OneNotification<OneThemeChangerEvent>(
            onVisited: (_, __) {},
            stopBubbling: true,
            builder: (context, data) {
              return MaterialApp(
                navigatorObservers: [OneContext().heroController],
                theme: ThemeData(
                  fontFamily: 'IRANSansMobile',
                  textTheme: TextTheme(
                          // bodyText1: TextStyle(height: Textheight),
                          // bodyText2: TextStyle(height: Textheight),
                          // subtitle1: TextStyle(height: Textheight),
                          // subtitle2: TextStyle(height: Textheight),
                          // button: TextStyle(height: Textheight),
                          )
                      .apply(),
                  scaffoldBackgroundColor: Colors.white,
                  cupertinoOverrideTheme: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                    dateTimePickerTextStyle:
                        TextStyle(fontSize: 19, color: Colors.black),
                    pickerTextStyle:
                        TextStyle(fontSize: 19, color: Colors.black),
                  )),
                ),
                debugShowCheckedModeBanner: false,
                title: 'varzheshgah',
                builder: OneContext().builder,
                navigatorKey: OneContext().key,
                home: Directionality(
                    textDirection: textDirection, child: splash()),
                routes: <String, WidgetBuilder>{
                  '/MainScreen': (BuildContext context) => new mainScreen(),
                  '/login': (BuildContext context) => new login(),
                },
              );
            });
      },
    );
  }
}
