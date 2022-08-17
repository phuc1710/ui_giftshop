// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    GiftFindingByAgeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GiftFindingByAgeView());
    },
    GiftFindingByOccasionRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GiftFindingByOccasionView());
    },
    GiftFindingResultRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const GiftFindingResultView());
    },
    GiftDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GiftDetailRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: GiftDetailView(
              key: args.key,
              name: args.name,
              price: args.price,
              imagePath: args.imagePath,
              description: args.description));
    },
    CartRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CartView());
    },
    PaymentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PaymentView());
    },
    CompletePaymentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const CompletePaymentView());
    },
    TrackingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TrackingView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(GiftFindingByAgeRoute.name, path: '/gift_finding_by_age'),
        RouteConfig(GiftFindingByOccasionRoute.name,
            path: '/gift_finding_by_occasion'),
        RouteConfig(GiftFindingResultRoute.name, path: '/gift_finding_result'),
        RouteConfig(GiftDetailRoute.name, path: '/gift_detail'),
        RouteConfig(CartRoute.name, path: '/cart'),
        RouteConfig(PaymentRoute.name, path: '/payment'),
        RouteConfig(CompletePaymentRoute.name, path: '/complete_payment'),
        RouteConfig(TrackingRoute.name, path: '/tracking')
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [GiftFindingByAgeView]
class GiftFindingByAgeRoute extends PageRouteInfo<void> {
  const GiftFindingByAgeRoute()
      : super(GiftFindingByAgeRoute.name, path: '/gift_finding_by_age');

  static const String name = 'GiftFindingByAgeRoute';
}

/// generated route for
/// [GiftFindingByOccasionView]
class GiftFindingByOccasionRoute extends PageRouteInfo<void> {
  const GiftFindingByOccasionRoute()
      : super(GiftFindingByOccasionRoute.name,
            path: '/gift_finding_by_occasion');

  static const String name = 'GiftFindingByOccasionRoute';
}

/// generated route for
/// [GiftFindingResultView]
class GiftFindingResultRoute extends PageRouteInfo<void> {
  const GiftFindingResultRoute()
      : super(GiftFindingResultRoute.name, path: '/gift_finding_result');

  static const String name = 'GiftFindingResultRoute';
}

/// generated route for
/// [GiftDetailView]
class GiftDetailRoute extends PageRouteInfo<GiftDetailRouteArgs> {
  GiftDetailRoute(
      {Key? key,
      required String name,
      required String price,
      required String imagePath,
      required String description})
      : super(GiftDetailRoute.name,
            path: '/gift_detail',
            args: GiftDetailRouteArgs(
                key: key,
                name: name,
                price: price,
                imagePath: imagePath,
                description: description));

  static const String name = 'GiftDetailRoute';
}

class GiftDetailRouteArgs {
  const GiftDetailRouteArgs(
      {this.key,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.description});

  final Key? key;

  final String name;

  final String price;

  final String imagePath;

  final String description;

  @override
  String toString() {
    return 'GiftDetailRouteArgs{key: $key, name: $name, price: $price, imagePath: $imagePath, description: $description}';
  }
}

/// generated route for
/// [CartView]
class CartRoute extends PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '/cart');

  static const String name = 'CartRoute';
}

/// generated route for
/// [PaymentView]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute() : super(PaymentRoute.name, path: '/payment');

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [CompletePaymentView]
class CompletePaymentRoute extends PageRouteInfo<void> {
  const CompletePaymentRoute()
      : super(CompletePaymentRoute.name, path: '/complete_payment');

  static const String name = 'CompletePaymentRoute';
}

/// generated route for
/// [TrackingView]
class TrackingRoute extends PageRouteInfo<void> {
  const TrackingRoute() : super(TrackingRoute.name, path: '/tracking');

  static const String name = 'TrackingRoute';
}
