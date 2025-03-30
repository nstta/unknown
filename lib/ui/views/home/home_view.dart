import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unknown/ui/widgets/justify_text.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFEC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16,
          children: [
            const JustifyText(
                text: 'HI, i\'m NSTTA ✸\nyou here to get my secret, right?'),
            IconButton(
              onPressed: () {
                viewModel.navigateToAllView();
              },
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.zero,
              splashRadius: 1,
              icon: const Icon(
                Icons.folder,
                color: Colors.black,
                size: 50,
              ),
            ),
            const JustifyText(text: '( Tap the folder to get my secret )'),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
