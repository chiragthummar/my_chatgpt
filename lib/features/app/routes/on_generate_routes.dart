import 'package:flutter/material.dart';
import 'package:my_chatgpt/features/about_us/presentation/pages/about_us.dart';
import '../app_constant/page_constant.dart';
import '../../text_completion/presentation/pages/text_completion_page.dart';
import '../../image_generations/presentation/pages/image_generations.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return pageRouteBuilder(
            widget: ErrorPage(),
          );
        }
      case PageConst.TextCompletionPage:
        {
          return pageRouteBuilder(
            widget: TextCompletionPage(),
          );
        }
      case PageConst.ImageGenerationPage:
        {
          return pageRouteBuilder(
            widget: ImageGenerationPage(),
          );
        }
      case PageConst.AboutAppPage:
        {
          return pageRouteBuilder(
            widget: AboutUs(),
          );
        }
      default:
        return pageRouteBuilder(
          widget: ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}

MaterialPageRoute pageRouteBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
