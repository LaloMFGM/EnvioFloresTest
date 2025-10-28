

import 'package:envioflorestest/domain/entities/github_user_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_followers_entity.dart';
import 'package:envioflorestest/domain/entities/github_user_repositories_entity.dart';

abstract class GithubUserRepository {

  Future<GithubUserEntity> getUser(String username);

  Future<List<GithubUserRepositoriesEntity>> getRepositories(String username);

  Future<List<GithubUserFollowersEntity>> getFollowers(String username);

}