import 'package:flutter_provider_mvvm/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';
import 'dart:async';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Not real login, we'll just request the user profile
    var fetcheduser = await _api.getUserProfile(userId);
    var hasUser = fetcheduser != null;
    if (hasUser) {
      userController.add(fetcheduser);
    }

    return hasUser;
  }
}