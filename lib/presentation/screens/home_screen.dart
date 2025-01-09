import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../viewmodels/github_trending_repository_cubit.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    final repositoryCubit = context.read<GithubTrendingRepositoryCubit>();
    repositoryCubit.fetchRepositories();
    return const Placeholder();
  }
}
