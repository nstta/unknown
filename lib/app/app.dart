import 'package:unknown/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:unknown/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:unknown/ui/views/home/home_view.dart';
import 'package:unknown/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:unknown/ui/views/all/all_view.dart';
import 'package:unknown/ui/views/receipt/receipt_view.dart';
import 'package:unknown/ui/views/slip/slip_view.dart';
import 'package:unknown/services/store_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: AllView),
    MaterialRoute(page: ReceiptView),
    MaterialRoute(page: SlipView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    LazySingleton(classType: StoreService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
