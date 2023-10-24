import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:viewer/feature/viewer/presentation/bloc/viewer_bloc.dart';
import 'package:viewer/router/router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ViewerBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 786, name: MOBILE),
              const Breakpoint(start: 786, end: 1200, name: TABLET),
              const Breakpoint(
                  start: 1200, end: double.infinity, name: DESKTOP),
            ],
          );
        },
        routerConfig: appRouter.config(),
      ),
    );
  }
}
