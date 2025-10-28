import 'package:envioflorestest/domain/datasource/github_user_datasource.dart';
import 'package:envioflorestest/domain/entities/github_user_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_followers_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_repositories_entity.dart';
import 'package:envioflorestest/domain/repository/github_user_repository.dart';

class GithubUsersRepositoryImpl extends GithubUserRepository {
  final GithubUserDatasource gitHubUserDatasource;
  GithubUsersRepositoryImpl({required this.gitHubUserDatasource});

  @override
  Future<GithubUserEntity> getUser(String username) {
    return gitHubUserDatasource.getUser(username);
  }

  @override
  Future<List<GithubUserRepositoriesEntity>> getRepositories(String username) {
    return gitHubUserDatasource.getRepositories(username);
  }

  @override
  Future<List<GithubUserFollowersEntity>> getFollowers(String username) {
    return gitHubUserDatasource.getFollowers(username);
  }
  
}
