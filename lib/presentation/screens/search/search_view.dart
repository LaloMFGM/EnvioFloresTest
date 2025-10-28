import 'package:envioflorestest/presentation/providers/github_user_provider.dart';
import 'package:envioflorestest/presentation/screens/github_profile/github_user_view.dart';
import 'package:envioflorestest/widgets/bezier.dart';
import 'package:envioflorestest/widgets/spacers.dart';
import 'package:envioflorestest/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  static const name = 'search_view';

  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final githubProvider = Provider.of<GithubUserProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  const Positioned.fill(child: BezierView()),

                  SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            const Text(
                              'Envio Flores Github Viewer ',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Visualiza tus repositorios y seguidores',
                              style: TextStyle(fontSize: 16, color: Colors.white70),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 180),
                            CustomTextFormField(
                              hintText: 'Buscar usuario de GitHub',
                              updateUsername: (value) {
                                githubProvider.username = value;
                              },
                              onTaped: () => searchUser(githubProvider, context),
                              onSubmitted: (username) {
                                githubProvider.loadUser(username);
                                githubProvider.loadRepositories();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              vSpace(32),

              GitHubUserView(),
            ],
          ),
        ),
      ),
    );
  }

  void searchUser(GithubUserProvider githubProvider, BuildContext dialogContext) {
    final username = githubProvider.username;

    if (username == null) {
      showDialog(
        context: dialogContext,
        builder: (_) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Por favor ingresa un nombre de usuario de GitHub'),
          actions: [TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: const Text('OK'))],
        ),
      );
    } else {
      githubProvider.loadUser(username);
      githubProvider.loadRepositories();
    }
  }
}
