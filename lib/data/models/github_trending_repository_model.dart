class GitHubTrendingRepository {
  final String name;
  final String ownerAvatar;
  final String description;
  final int stars;
  final String? language;

  GitHubTrendingRepository({
    required this.name,
    required this.ownerAvatar,
    required this.description,
    required this.stars,
    this.language,
  });

  factory GitHubTrendingRepository.fromJson(Map<String, dynamic> json) {
    return GitHubTrendingRepository(
      name: json['name'],
      ownerAvatar: json['owner']['avatar_url'],
      description: json['description'] ?? '',
      stars: json['stargazers_count'],
      language: json['language'],
    );
  }
}
