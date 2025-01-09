import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendhub/presentation/screens/home_screen.dart';
import 'data/services/github_trending_repository_service.dart';
import 'viewmodels/github_trending_repository_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: BlocProvider(
        create: (context) => GithubTrendingRepositoryCubit(GithubTrendingRepositoryService()),
        child: HomeScreen(onThemeToggle: _toggleTheme),
      ),
    );
  }
}
