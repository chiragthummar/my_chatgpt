import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chatgpt/core/http_certificate_manager.dart';
import 'package:my_chatgpt/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import './features/app/routes/on_generate_routes.dart';
import './features/app/home/home.dart';
import 'features/app/splash/splash_screen.dart';
import 'injection_container.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TextCompletionCubit>(),)
      ],
      child: MaterialApp(
        title: 'My ChatGPT Sample',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(brightness: Brightness.dark),
        initialRoute: "/",
        routes: {
          "/": (context) {
            return SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
