import 'package:fluttertest/data/constants.dart';
import 'package:fluttertest/data/network/api_provider.dart';
import 'package:fluttertest/data/network/api_request_representable.dart';

enum AuthType { signin, signun, loginToken }

class AuthAPI implements APIRequestRepresentable {
  final AuthType type;
  String? username;
  String? password;
  String? token;
  String? name;
  AuthAPI._(
      {required this.type,
      this.password,
      this.username,
      this.token,
      this.name});

  AuthAPI.signin(String username, String password)
      : this._(type: AuthType.signin, username: username, password: password);
  AuthAPI.loginToken(String token)
      : this._(type: AuthType.loginToken, token: token);
  AuthAPI.signup(String name, String username, String password)
      : this._(
            type: AuthType.signun,
            username: username,
            password: password,
            name: name);

  @override
  String get endpoint => Urls.baseUrl;

  String get path {
    switch (type) {
      case AuthType.signin:
        return "/signin";
      case AuthType.signun:
        return "/signup";
      default:
        return "/is-authenticated";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.post;
  }

  Map<String, String> get headers {
    switch (type) {
      case AuthType.signin:
        return {};
      case AuthType.signun:
        return {};
      default:
        return {"Authorization": "Bearer " + token!};
    }
  }

  Map<String, String> get query {
    switch (type) {
      case AuthType.signin:
        return {};
      case AuthType.signun:
        return {};
      default:
        return {};
    }
  }

  @override
  get body {
    switch (type) {
      case AuthType.signin:
        return {"email": username, "password": password};
      case AuthType.signun:
        return {"email": username, "password": password, "name": name};
      default:
        return {};
    }
  }

  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + "/v1/users";
}
