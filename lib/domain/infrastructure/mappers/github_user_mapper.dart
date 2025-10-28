import 'package:envioflorestest/domain/entities/github_user_entity.dart';
import 'package:envioflorestest/domain/infrastructure/models/github_user_model.dart';

class GithubUserMapper {
  static GithubUserEntity gitHubUserToEntity(GitHubUser user) =>
      GithubUserEntity(username: user.login, avatarUrl: user.avatarUrl, followers: user.followers);
}
