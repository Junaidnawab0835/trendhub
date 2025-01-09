import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trendhub/presentation/screens/trending_repo_screen.dart';
import '../../viewmodels/github_trending_repository_cubit.dart';
import 'error_screen.dart';
import 'loading_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;

  const HomeScreen({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    final repositoryCubit = context.read<GithubTrendingRepositoryCubit>();
    repositoryCubit.fetchRepositories();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrendHub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onThemeToggle,
          ),
        ],
      ),
      body: BlocBuilder<GithubTrendingRepositoryCubit, GithubTrendingRepositoryState>(
        builder: (context, state) {
          if (state is RepositoryLoading) {
            return const LoadingScreen();
          } else if (state is RepositoryLoaded) {
            return TrendingReposScreen(state.repositories);
          } else if (state is RepositoryError) {
            return ErrorScreen(onRetry: repositoryCubit.fetchRepositories);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
