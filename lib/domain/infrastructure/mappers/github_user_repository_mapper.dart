import 'package:envioflorestest/domain/entities/github_user_repositories_entity.dart';
import 'package:envioflorestest/domain/infrastructure/models/github_user_repositories_model.dart';

class GithubUserRepositoryMapper {
  static GithubUserRepositoriesEntity gitHubUserRepositoryToEntity(GithubUserRepositories user) =>
      GithubUserRepositoriesEntity(
        name: user.name,
        description: user.description ?? '',
        language: user.language,
        htmlUrl: user.htmlUrl,
      );
}
