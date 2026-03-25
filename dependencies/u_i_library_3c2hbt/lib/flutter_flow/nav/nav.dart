import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/main.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__u_i_library_3c2hbt';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Image.asset(
                  'packages/u_i_library_3c2hbt/assets/images/designkit_cover.png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : ExperimentalWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Image.asset(
                      'packages/u_i_library_3c2hbt/assets/images/designkit_cover.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : ExperimentalWidget(),
        ),
        FFRoute(
          name: CoverWidget.routeName,
          path: CoverWidget.routePath,
          builder: (context, params) => CoverWidget(),
        ),
        FFRoute(
          name: ColumnStackedChartWidget.routeName,
          path: ColumnStackedChartWidget.routePath,
          builder: (context, params) => ColumnStackedChartWidget(),
        ),
        FFRoute(
          name: BarStackedChartWidget.routeName,
          path: BarStackedChartWidget.routePath,
          builder: (context, params) => BarStackedChartWidget(),
        ),
        FFRoute(
          name: ColumnChartWidget.routeName,
          path: ColumnChartWidget.routePath,
          builder: (context, params) => ColumnChartWidget(),
        ),
        FFRoute(
          name: PreviewSpikeChartWidget.routeName,
          path: PreviewSpikeChartWidget.routePath,
          builder: (context, params) => PreviewSpikeChartWidget(),
        ),
        FFRoute(
          name: RippleDemoWidget.routeName,
          path: RippleDemoWidget.routePath,
          builder: (context, params) => RippleDemoWidget(),
        ),
        FFRoute(
          name: SliverWidget.routeName,
          path: SliverWidget.routePath,
          builder: (context, params) => SliverWidget(),
        ),
        FFRoute(
          name: StepperDemoWidget.routeName,
          path: StepperDemoWidget.routePath,
          builder: (context, params) => StepperDemoWidget(),
        ),
        FFRoute(
          name: StaticLabelDemoWidget.routeName,
          path: StaticLabelDemoWidget.routePath,
          builder: (context, params) => StaticLabelDemoWidget(),
        ),
        FFRoute(
          name: AnimatedListDemoWidget.routeName,
          path: AnimatedListDemoWidget.routePath,
          builder: (context, params) => AnimatedListDemoWidget(),
        ),
        FFRoute(
          name: MultipleSelectableSearchDemoWidget.routeName,
          path: MultipleSelectableSearchDemoWidget.routePath,
          builder: (context, params) => MultipleSelectableSearchDemoWidget(),
        ),
        FFRoute(
          name: ExperimentalWidget.routeName,
          path: ExperimentalWidget.routePath,
          builder: (context, params) => ExperimentalWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

void initializeRoutes({
  String? coverWidgetName,
  String? coverWidgetPath,
  String? columnStackedChartWidgetName,
  String? columnStackedChartWidgetPath,
  String? barStackedChartWidgetName,
  String? barStackedChartWidgetPath,
  String? columnChartWidgetName,
  String? columnChartWidgetPath,
  String? previewSpikeChartWidgetName,
  String? previewSpikeChartWidgetPath,
  String? rippleDemoWidgetName,
  String? rippleDemoWidgetPath,
  String? sliverWidgetName,
  String? sliverWidgetPath,
  String? stepperDemoWidgetName,
  String? stepperDemoWidgetPath,
  String? staticLabelDemoWidgetName,
  String? staticLabelDemoWidgetPath,
  String? animatedListDemoWidgetName,
  String? animatedListDemoWidgetPath,
  String? multipleSelectableSearchDemoWidgetName,
  String? multipleSelectableSearchDemoWidgetPath,
  String? experimentalWidgetName,
  String? experimentalWidgetPath,
}) {
  CoverWidget.maybeSetRouteName(coverWidgetName);
  CoverWidget.maybeSetRoutePath(coverWidgetPath);
  ColumnStackedChartWidget.maybeSetRouteName(columnStackedChartWidgetName);
  ColumnStackedChartWidget.maybeSetRoutePath(columnStackedChartWidgetPath);
  BarStackedChartWidget.maybeSetRouteName(barStackedChartWidgetName);
  BarStackedChartWidget.maybeSetRoutePath(barStackedChartWidgetPath);
  ColumnChartWidget.maybeSetRouteName(columnChartWidgetName);
  ColumnChartWidget.maybeSetRoutePath(columnChartWidgetPath);
  PreviewSpikeChartWidget.maybeSetRouteName(previewSpikeChartWidgetName);
  PreviewSpikeChartWidget.maybeSetRoutePath(previewSpikeChartWidgetPath);
  RippleDemoWidget.maybeSetRouteName(rippleDemoWidgetName);
  RippleDemoWidget.maybeSetRoutePath(rippleDemoWidgetPath);
  SliverWidget.maybeSetRouteName(sliverWidgetName);
  SliverWidget.maybeSetRoutePath(sliverWidgetPath);
  StepperDemoWidget.maybeSetRouteName(stepperDemoWidgetName);
  StepperDemoWidget.maybeSetRoutePath(stepperDemoWidgetPath);
  StaticLabelDemoWidget.maybeSetRouteName(staticLabelDemoWidgetName);
  StaticLabelDemoWidget.maybeSetRoutePath(staticLabelDemoWidgetPath);
  AnimatedListDemoWidget.maybeSetRouteName(animatedListDemoWidgetName);
  AnimatedListDemoWidget.maybeSetRoutePath(animatedListDemoWidgetPath);
  MultipleSelectableSearchDemoWidget.maybeSetRouteName(
      multipleSelectableSearchDemoWidgetName);
  MultipleSelectableSearchDemoWidget.maybeSetRoutePath(
      multipleSelectableSearchDemoWidgetPath);
  ExperimentalWidget.maybeSetRouteName(experimentalWidgetName);
  ExperimentalWidget.maybeSetRoutePath(experimentalWidgetPath);
}

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
