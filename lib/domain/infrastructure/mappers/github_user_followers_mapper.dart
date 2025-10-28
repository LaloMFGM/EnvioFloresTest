import 'package:envioflorestest/domain/entities/github_user_followers_entity.dart';
import 'package:envioflorestest/domain/infrastructure/models/github_user_model.dart';

class GithubUserFollowersMapper {
  static GithubUserFollowersEntity gitHubUserFollowesToEntity(GitHubUser user) =>
      GithubUserFollowersEntity(username: user.login, avatarUrl: user.avatarUrl);
}
