import 'package:complycentre_app/core/navigation/go_router.dart';
import 'package:complycentre_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: AppTheme.getTheme(context),
          routerConfig: ref.watch(goRouterProvider),
        );
      },
    );
  }
}
