import 'package:envioflorestest/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/user', name: UsersView.name, builder: (context, state) => const UsersView()),
    GoRoute(path: '/', name: SearchView.name, builder: (context, state) => const SearchView()),
  ],
);
