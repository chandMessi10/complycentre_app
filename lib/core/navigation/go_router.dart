import 'package:complycentre_app/features/auth/presentation/ui/login_screen.dart';
import 'package:complycentre_app/features/business_management/presentation/ui/add_business_screen.dart';
import 'package:complycentre_app/features/dashboard/presentation/ui/screens/dashboard_screen.dart';
import 'package:complycentre_app/features/user_management/presentation/ui/invite_user_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'go_router.g.dart';

enum AppRoute { login, dashboard, inviteUser, addBusiness }

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        name: AppRoute.dashboard.name,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/invite-user',
        name: AppRoute.inviteUser.name,
        builder: (context, state) => const InviteUserScreen(),
      ),
      GoRoute(
        path: '/add-business',
        name: AppRoute.addBusiness.name,
        builder: (context, state) => const AddBusinessScreen(),
      ),
    ],
  );
}
