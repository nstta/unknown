import 'package:flutter/material.dart';
import 'package:unknown/app/app.bottomsheets.dart';
import 'package:unknown/app/app.dialogs.dart';
import 'package:unknown/app/app.locator.dart';
import 'package:unknown/app/app.router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: stackedRouter.delegate(
        initialRoutes: [
          const ReceiptViewRoute(),
        ],
      ),
      routeInformationParser: stackedRouter.defaultRouteParser(),
    );
  }
}
