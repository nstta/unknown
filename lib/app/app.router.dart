// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:stacked/stacked.dart' as _i7;
import 'package:stacked_services/stacked_services.dart' as _i6;

import '../ui/views/all/all_view.dart' as _i3;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/receipt/receipt_view.dart' as _i4;
import '../ui/views/slip/slip_view.dart' as _i5;
import '../ui/views/startup/startup_view.dart' as _i2;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i6.StackedService.navigatorKey);

class StackedRouterWeb extends _i7.RootStackRouter {
  StackedRouterWeb({_i8.GlobalKey<_i8.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    StartupViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StartupView(),
      );
    },
    AllViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AllView(),
      );
    },
    ReceiptViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ReceiptView(),
      );
    },
    SlipViewRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SlipView(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i7.RouteConfig(
          StartupViewRoute.name,
          path: '/startup-view',
        ),
        _i7.RouteConfig(
          AllViewRoute.name,
          path: '/all-view',
        ),
        _i7.RouteConfig(
          ReceiptViewRoute.name,
          path: '/receipt-view',
        ),
        _i7.RouteConfig(
          SlipViewRoute.name,
          path: '/slip-view',
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/home-view',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.StartupView]
class StartupViewRoute extends _i7.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/startup-view',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i3.AllView]
class AllViewRoute extends _i7.PageRouteInfo<void> {
  const AllViewRoute()
      : super(
          AllViewRoute.name,
          path: '/all-view',
        );

  static const String name = 'AllView';
}

/// generated route for
/// [_i4.ReceiptView]
class ReceiptViewRoute extends _i7.PageRouteInfo<void> {
  const ReceiptViewRoute()
      : super(
          ReceiptViewRoute.name,
          path: '/receipt-view',
        );

  static const String name = 'ReceiptView';
}

/// generated route for
/// [_i5.SlipView]
class SlipViewRoute extends _i7.PageRouteInfo<void> {
  const SlipViewRoute()
      : super(
          SlipViewRoute.name,
          path: '/slip-view',
        );

  static const String name = 'SlipView';
}

extension RouterStateExtension on _i6.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToStartupView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToAllView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const AllViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToReceiptView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const ReceiptViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToSlipView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const SlipViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithAllView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const AllViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithReceiptView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const ReceiptViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithSlipView(
      {void Function(_i7.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const SlipViewRoute(),
      onFailure: onFailure,
    );
  }
}
