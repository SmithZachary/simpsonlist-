// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    ViewerDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ViewerDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ViewerDetailScreen(
          key: args.key,
          relatedTopics: args.relatedTopics,
        ),
      );
    },
    ViewerListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ViewerListScreen(),
      );
    },
  };
}

/// generated route for
/// [ViewerDetailScreen]
class ViewerDetailRoute extends PageRouteInfo<ViewerDetailRouteArgs> {
  ViewerDetailRoute({
    Key? key,
    required RelatedTopics? relatedTopics,
    List<PageRouteInfo>? children,
  }) : super(
          ViewerDetailRoute.name,
          args: ViewerDetailRouteArgs(
            key: key,
            relatedTopics: relatedTopics,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewerDetailRoute';

  static const PageInfo<ViewerDetailRouteArgs> page =
      PageInfo<ViewerDetailRouteArgs>(name);
}

class ViewerDetailRouteArgs {
  const ViewerDetailRouteArgs({
    this.key,
    required this.relatedTopics,
  });

  final Key? key;

  final RelatedTopics? relatedTopics;

  @override
  String toString() {
    return 'ViewerDetailRouteArgs{key: $key, relatedTopics: $relatedTopics}';
  }
}

/// generated route for
/// [ViewerListScreen]
class ViewerListRoute extends PageRouteInfo<void> {
  const ViewerListRoute({List<PageRouteInfo>? children})
      : super(
          ViewerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ViewerListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
