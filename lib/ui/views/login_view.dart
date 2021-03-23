import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/core/enums/viewstate.dart';
import 'package:flutter_provider_mvvm/core/viewmodels/login_model.dart';
import 'package:flutter_provider_mvvm/ui/shared/app_colors.dart';
import 'package:flutter_provider_mvvm/ui/widgets/login_header.dart';
import 'base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(
              validationMessage: model.errorMessage,
              controller: controller,
            ),
            model.state == ViewState.Busy
                ? CircularProgressIndicator()
                : FlatButton(
                    color: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () async {
                      var loginSuccess = await model.login(controller.text);
                      if (loginSuccess) {
                        // Navigate to the home view
                        Navigator.pushNamed(context, '/');
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
