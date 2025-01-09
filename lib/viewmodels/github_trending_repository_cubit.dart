import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/github_trending_repository_model.dart';
import '../data/services/github_trending_repository_service.dart';


abstract class GithubTrendingRepositoryState {}

class RepositoryLoading extends GithubTrendingRepositoryState {}

class RepositoryLoaded extends GithubTrendingRepositoryState {
  final List<GitHubTrendingRepository> repositories;

  RepositoryLoaded(this.repositories);
}

class RepositoryError extends GithubTrendingRepositoryState {
  final String message;

  RepositoryError(this.message);
}

class GithubTrendingRepositoryCubit extends Cubit<GithubTrendingRepositoryState> {
  final GithubTrendingRepositoryService _service;

  GithubTrendingRepositoryCubit(this._service) : super(RepositoryLoading());

  void fetchRepositories() async {
    emit(RepositoryLoading());
    try {
      final repos = await _service.fetchTrendingRepositories();
      emit(RepositoryLoaded(repos));
    } catch (e) {
      emit(RepositoryError('Failed to load repositories'));
    }
  }
}
