import 'dart:convert';

import 'package:envioflorestest/config/constants/enviroments.dart';
import 'package:envioflorestest/domain/datasource/github_user_datasource.dart';
import 'package:envioflorestest/domain/entities/github_user_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_followers_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_repositories_entity.dart';
import 'package:envioflorestest/domain/infrastructure/models/github_user_model.dart';

class GithubUsersDatasource extends GithubUserDatasource {
  final dio = Enviroments.dio;

  @override
  Future<GithubUserEntity> getUser(String username) async {
    final response = await dio.get(username);

    final userData = GitHubUser.fromJson(response.data);

    final githubUser = GithubUserEntity(
      username: userData.login,
      avatarUrl: userData.avatarUrl,
      followers: userData.followers,
    );

    return githubUser;
  }

  @override
  Future<List<GithubUserRepositoriesEntity>> getRepositories(String username) async {
    final response = await dio.get('$username/repos');

    final repositoryData = response.data as List<dynamic>;

    final githubUserRepositories = repositoryData
        .map<GithubUserRepositoriesEntity>((repo) => GithubUserRepositoriesEntity(
              name: repo['name'],
              description: repo['description'] ?? '',
              htmlUrl: repo['html_url'],
              language: repo['language'],
            ))
        .toList();

    return githubUserRepositories;
  }

  @override
  Future<List<GithubUserFollowersEntity>> getFollowers(String username) async{
    final response = await dio.get('$username/followers');
    final followersData = response.data as List<dynamic>;
    final githubUserFollowers = followersData
        .map<GithubUserFollowersEntity>((follower) => GithubUserFollowersEntity(
              avatarUrl: follower['avatar_url'],
              username: follower['login'],
            ))
        .toList();
    return githubUserFollowers;
  }
}
