import 'package:bankcard/core/singletons/service_locator.dart';
import 'package:bankcard/core/singletons/storage.dart';
import 'package:bankcard/features/main/main_view.dart';
import 'package:bankcard/features/main/presentation/controllers/card/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.getInstance();
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardBloc(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Banking App',
      theme: ThemeData(appBarTheme: const AppBarTheme(centerTitle: true)),
      home: const MainView(),
    );
  }
}
