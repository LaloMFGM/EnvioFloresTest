import 'package:envioflorestest/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:envioflorestest/presentation/providers/github_user_provider.dart';

class GitHubUserView extends StatelessWidget {
  final double size;

  const GitHubUserView({super.key, this.size = 200});

  @override
  Widget build(BuildContext context) {
    return Consumer<GithubUserProvider>(
      builder: (context, githubProvider, child) {
        final user = githubProvider.user;
        final repos = githubProvider.repositories;

        if (user == null) return const SizedBox();

        return Column(
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    child: InteractiveViewer(child: Image.network(user.avatarUrl, fit: BoxFit.contain)),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        user.avatarUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, size: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            vSpace(8),
            Text('Usuario: ${user.username}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            vSpace(8),
            ElevatedButton(
              onPressed: () => showFollowers(context, githubProvider),
              child: Text('Seguidores: ${user.followers}', style: const TextStyle(fontSize: 16)),
            ),
            vSpace(4),

            if (repos != null) ...[
              const Text('Repositorios:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              vSpace(8),
              ...repos
                  .take(2)
                  .map(
                    (repo) => Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                      child: ListTile(
                        title: Text(repo.name),
                        subtitle: Text(repo.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
            ] else if (githubProvider.isLoading)
              const CircularProgressIndicator()
            else ...[
              vSpace(16),
              const Text('No se encontraron repositorios'),
            ],

            vSpace(16),

            ElevatedButton(
              onPressed: () {
                context.push('/repositories');
              },
              child: const Text('Cargar Repositorios'),
            ),
          ],
        );
      },
    );
  }

  void showFollowers(BuildContext context, GithubUserProvider githubProvider) async {
    await githubProvider.loadFollowers();

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (_) {
        final followers = githubProvider.followers ?? [];
        return AlertDialog(
          title: const Text('Seguidores'),
          content: followers.isEmpty
              ? const Text('Este usuario no tiene seguidores.')
              : SizedBox(
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: followers.length,
                    itemBuilder: (context, index) {
                      final follower = followers[index];
                      return ListTile(
                        leading: CircleAvatar(backgroundImage: NetworkImage(follower.avatarUrl)),
                        title: Text(follower.username),
                      );
                    },
                  ),
                ),
          actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cerrar'))],
        );
      },
    );
  }
}
