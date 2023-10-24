import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:viewer/feature/viewer/domain/model/viewer.dart';
import 'package:viewer/feature/viewer/presentation/view/viewer_list_screen.dart';
import 'package:viewer/feature/viewer/reviewer_detail/presentation/viewer_detail_screen.dart';
import 'package:viewer/router/router_path.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: ViewerListRoute.page,
          initial: true,
          path: RouterPath.viewerListScreen,
        ),
        AutoRoute(
          page: ViewerDetailRoute.page,
          path: RouterPath.viewerDetailScreen,
        ),
      ];
}
