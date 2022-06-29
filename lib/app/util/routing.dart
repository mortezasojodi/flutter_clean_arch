import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

Future<void> VzpushNamedAndRemoveUntil(
    String pagename, bool Function(Route<dynamic>)? predicate,
    {BuildContext? context}) {
  return OneContext()
      .pushNamedAndRemoveUntil(pagename, predicate ?? (c) => false);
}

Future<void> VzpushAndRemoveUntil(Widget widget,
    {BuildContext? context, bool Function(Route<dynamic>)? predicate}) {
  return OneContext().pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => widget),
      predicate ?? (route) => false);
}

Future<void> VzpushReplacementNamed(String pagename, {BuildContext? context}) {
  return OneContext().pushReplacementNamed(pagename);
}

Future<void> VzpushNamed(String pagename, {BuildContext? context}) {
  return OneContext().pushNamed(pagename);
}

Future<dynamic> VzPush(Widget widget, {BuildContext? context}) {
  return OneContext().push(MaterialPageRoute(builder: (ctx) => widget));
}

void VzPop({dynamic data, BuildContext? context, bool rootNavigator = false}) {
  return OneContext().pop(data);
}
