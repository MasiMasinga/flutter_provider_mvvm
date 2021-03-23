import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/ui/router.dart';
import 'package:provider/provider.dart';
import 'core/models/user.dart';
import 'core/services/authentication_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: 'login',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
