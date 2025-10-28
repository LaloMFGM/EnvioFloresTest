
import 'package:envioflorestest/presentation/providers/github_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RepositoriesView extends StatelessWidget{
  static const name = 'repositories_view';

  const RepositoriesView({super.key});

  @override
  Widget build(BuildContext context) {

    final githubProvider = Provider.of<GithubUserProvider>(context);
    String username = githubProvider.username ?? 'Usuario';
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Repositorios de $username'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (githubProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (githubProvider.error != null)
              Center(child: Text('Error: ${githubProvider.error}'))
            else if (githubProvider.repositories != null && githubProvider.repositories!.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: githubProvider.repositories!.length,
                itemBuilder: (context, index) {
                  final repo = githubProvider.repositories![index];
                  return ListTile(
                    title: Text(repo.name),
                    subtitle: Text(repo.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, size: 16),
                        const SizedBox(width: 4),
                       
                      ],
                    ),
                  );
                },
              )
            else
              const Center(child: Text('No se encontraron repositorios')),
          ],
        ),
      )
    );
  }
}