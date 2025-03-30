import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unknown/app/app.locator.dart';
import 'package:unknown/app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();

  void navigateToAllView() {
    _routerService.navigateTo(const AllViewRoute());
  }
}
