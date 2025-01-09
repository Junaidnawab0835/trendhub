import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendhub/data/models/github_trending_repository_model.dart';

class TrendingRepoCard extends StatelessWidget {
  final GitHubTrendingRepository repo;
  const TrendingRepoCard({super.key, required this.repo});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(repo.ownerAvatar),
      ),
      title: Text(repo.name),
      subtitle: Text(repo.description),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/ic_star.svg',
            colorFilter: const ColorFilter.mode(
              Colors.amber,
              BlendMode.srcIn,
            ),
          ),
          Text('${repo.stars}'),
        ],
      ),
    );
  }
}
