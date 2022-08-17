import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../presentation/cart/view/cart_view.dart';
import '../../presentation/complete_payment/view/complete_payment_view.dart';
import '../../presentation/gift_detail/view/gift_detail_view.dart';
import '../../presentation/gift_finding/view/gift_finding_by_age_view.dart';
import '../../presentation/gift_finding/view/gift_finding_by_occasion_view.dart';
import '../../presentation/gift_finding/view/gift_finding_result_view.dart';
import '../../presentation/home/view/home_view.dart';
import '../../presentation/payment/view/payment_view.dart';
import '../../presentation/tracking/view/tracking_view.dart';
import 'routes.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AutoRoute<dynamic>(page: HomeView, path: Routes.home, initial: true),
    AutoRoute<dynamic>(
      page: GiftFindingByAgeView,
      path: Routes.giftFindingByAge,
    ),
    AutoRoute<dynamic>(
      page: GiftFindingByOccasionView,
      path: Routes.giftFindingByOccasion,
    ),
    AutoRoute<dynamic>(
      page: GiftFindingResultView,
      path: Routes.giftFindingResult,
    ),
    AutoRoute<dynamic>(page: GiftDetailView, path: Routes.giftDetail),
    AutoRoute<dynamic>(page: CartView, path: Routes.cart),
    AutoRoute<dynamic>(page: PaymentView, path: Routes.payment),
    AutoRoute<dynamic>(page: CompletePaymentView, path: Routes.completePayment),
    AutoRoute<dynamic>(page: TrackingView, path: Routes.tracking)
  ],
)
class AppRouter extends _$AppRouter {}
