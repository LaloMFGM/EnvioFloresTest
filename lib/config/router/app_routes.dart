import 'package:envioflorestest/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/repositories', name: RepositoriesView.name, builder: (context, state) => const RepositoriesView()),
    GoRoute(path: '/', name: SearchView.name, builder: (context, state) => const SearchView()),
  ],
);
