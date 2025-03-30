import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:unknown/constants/assets.dart';
import 'package:unknown/ui/common/ui_helpers.dart';
import 'package:unknown/ui/widgets/general_button.dart';

import 'slip_viewmodel.dart';

class SlipView extends StackedView<SlipViewModel> {
  const SlipView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, SlipViewModel viewModel, Widget? child) {
    final TextStyle info = GoogleFonts.spaceMono(fontSize: 12);
    final String formattedDate = DateFormat('MMMM d, y hh:mm').format(DateTime.now());

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(md),
            child: Column(
              children: [
                RepaintBoundary(
                  key: viewModel.globalKey,
                  child: Container(
                    width: 380,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(md),
                      child: Column(
                        children: [
                          Text('RECEIPT',
                              style: GoogleFonts.spaceMono(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 20),
                          Text('SOMCHAI LOCAL STORE', style: info),
                          Text('45/3 Sukhumvit Road, Bangkok, Thailand', style: info),
                          Text(formattedDate, style: info),
                          Text('Open: 08:00 AM - 10:00 PM', style: info),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: md),
                            child: Text('*' * 44, style: info),
                          ),
                          Text('Please do not forget to give me a tip!', style: info),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: md),
                            child: Text('*' * 44, style: info),
                          ),
                          ListView.builder(
                            itemCount: viewModel.selectedProducts.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: md),
                            itemBuilder: (context, index) {
                              final product =
                                  viewModel.selectedProducts.keys.toList()[index];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(product.name, style: info),
                                  Text(product.price.toStringAsFixed(2), style: info),
                                ],
                              );
                            },
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: ti, horizontal: sm),
                              child: Text('*' * 20, style: info, textAlign: TextAlign.right),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: sm),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Subtotal:', style: info),
                                Text('${NumberFormat("#,##0.00", "en_US").format(viewModel.subtotal)} THB', style: info),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: sm),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('VAT (7%):', style: info),
                                Text('${viewModel.vat.toStringAsFixed(2)} THB', style: info),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: sm),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total:', style: info),
                                Text('${NumberFormat("#,##0.00", "en_US").format(viewModel.total)} THB', style: info),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: sm),
                            child: Row(
                              children: [
                                Text('Paid By: ', style: info),
                                Text('NSTTA', style: info),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Text('Thank you for your purchase!', style: info),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: md),
                            child: Text('*' * 44, style: info),
                          ),
                          Text('Thank you for shopping at Somchai Local!', style: info),
                          Text('Please come again!', style: info),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: md),
                            child: Text('*' * 44, style: info),
                          ),
                          const SizedBox(height: 16),
                          Text('Have a great day! 😊', style: info),
                          const SizedBox(height: 32),
                          Image.asset(
                            Assets.assetsImagesBarcode
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GeneralButton(
                  onPressed: viewModel.captureAndSave,
                  text: 'Download Receipt',
                  backgroundColor: const  Color(0xffFFFFEC),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SlipViewModel viewModelBuilder(BuildContext context) => SlipViewModel();
}
