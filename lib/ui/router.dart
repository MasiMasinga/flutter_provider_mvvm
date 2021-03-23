import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/core/models/post.dart';
import 'package:flutter_provider_mvvm/ui/views/home_view.dart';
import 'package:flutter_provider_mvvm/ui/views/login_view.dart';
import 'package:flutter_provider_mvvm/ui/views/post_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'post':
        return MaterialPageRoute(builder: (_) => PostView());
      case 'post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No Route Defined For ${settings.name}'),
              ),
            );
          },
        );
    }
  }
}
