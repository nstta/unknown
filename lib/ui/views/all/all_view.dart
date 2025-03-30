import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:unknown/ui/common/ui_helpers.dart';
import 'package:unknown/ui/widgets/info_box.dart';
import 'package:unknown/ui/widgets/random_box.dart';

import 'all_viewmodel.dart';

class AllView extends StackedView<AllViewModel> {
  const AllView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AllViewModel viewModel,
    Widget? child,
  ) {
    double areaHeight = 500;
    double areaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.grey[200],
            ),
            const SizedBox(height: 40),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: lg),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: md,
                  mainAxisSpacing: md,
                ),
                itemBuilder: (context, index) {
                  return InfoBox(
                    title: viewModel.infoBoxes[index].title,
                    number: viewModel.infoBoxes[index].number,
                    subtitle: viewModel.infoBoxes[index].subtitle,
                  );
                },
                itemCount: viewModel.infoBoxes.length,
              ),
            ),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: areaWidth,
                  height: areaHeight,
                  color: Colors.yellow[200],
                  child: Stack(
                    children:
                        List.generate(viewModel.randomBoxes.length, (index) {
                      final box = viewModel.randomBoxes[index];
                      final position = viewModel.boxPositions[index];

                      return Positioned(
                        left: position.dx,
                        top: position.dy,
                        child: Draggable<int>(
                          data: index,
                          feedback: Material(
                            color: Colors.transparent,
                            child: RandomBox(
                              title: box.title,
                              asset: box.asset,
                              width: box.width,
                              height: box.height,
                              type: box.type,
                            ),
                          ),
                          childWhenDragging: Opacity(
                            opacity: 0,
                            child: RandomBox(
                              title: box.title,
                              asset: box.asset,
                              width: box.width,
                              height: box.height,
                              type: box.type,
                            ),
                          ),
                          onDragEnd: (details) {
                            RenderBox stackBox =
                                context.findRenderObject() as RenderBox;
                            Offset localOffset =
                                stackBox.globalToLocal(details.offset);

                            double newX = localOffset.dx
                                .clamp(0, constraints.maxWidth - box.width);
                            double newY = localOffset.dy
                                .clamp(0, areaHeight - box.height);

                            viewModel.updateBoxPosition(
                                index, Offset(newX, newY));
                          },
                          child: RandomBox(
                            title: box.title,
                            asset: box.asset,
                            width: box.width,
                            height: box.height,
                            type: box.type,
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  AllViewModel viewModelBuilder(BuildContext context) => AllViewModel();

  @override
  void onViewModelReady(AllViewModel viewModel) {
    double areaWidth = 500;
    double areaHeight = 500; // Set height of drag area
    viewModel.initializeBoxPositions(areaWidth, areaHeight);
    super.onViewModelReady(viewModel);
  }
}
