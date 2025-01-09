import 'package:dio/dio.dart';
import '../../core/utils/constants.dart';
import '../models/github_trending_repository_model.dart';

class GithubTrendingRepositoryService {
  final Dio _dio = Dio();

  Future<List<GitHubTrendingRepository>> fetchTrendingRepositories() async {
    const String url = "${Constants.baseUrl}${Constants.trendingRepositoriesEndpoint}";
    try {
      final response = await _dio.get(url);
      final items = response.data['items'] as List;
      return items.map((item) => GitHubTrendingRepository.fromJson(item)).toList();
    } catch (e) {
      throw Exception('Failed to load repositories: ${e.toString()}');
    }
  }
}
