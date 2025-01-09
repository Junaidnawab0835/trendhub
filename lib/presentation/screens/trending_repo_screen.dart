import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/github_trending_repository_model.dart';
import '../widgets/trending_repo_card.dart';

class TrendingReposScreen extends StatelessWidget {
  final List<GitHubTrendingRepository> repositories;

  const TrendingReposScreen(this.repositories, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repo = repositories[index];
        return TrendingRepoCard(repo: repo);
      },
    );
  }
}
