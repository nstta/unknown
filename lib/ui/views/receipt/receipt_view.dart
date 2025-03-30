import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:unknown/ui/common/ui_helpers.dart';
import 'package:unknown/ui/widgets/display_cart_card.dart';
import 'package:unknown/ui/widgets/general_button.dart';
import 'package:unknown/ui/widgets/product_card.dart';
import 'package:intl/intl.dart';

import 'receipt_viewmodel.dart';

class ReceiptView extends StackedView<ReceiptViewModel> {
  const ReceiptView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReceiptViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🌐 Welcome to ✶ somchai local',
            style: GoogleFonts.poppins(fontSize: 16)),
        backgroundColor: Colors.yellow[200],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.teal[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Flexible(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: sm,
                        crossAxisSpacing: sm,
                      ),
                      itemCount: viewModel.products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = viewModel.products[index];
                        return GestureDetector(
                          onTap: () {
                            viewModel.addProductToReceipt(product);
                          },
                          child: ProductCard(product: product),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.white,
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (viewModel.selectedProducts.isEmpty)
                      Text(
                        "Pay up, I gotta hit my quota 😩💸",
                        style: GoogleFonts.poppins(fontSize: 16),
                      )
                    else
                      Column(
                        children:
                            viewModel.selectedProducts.entries.map((entry) {
                          final product = entry.key;
                          final count = entry.value;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DisplayCartCard(
                                  name: product.name,
                                  price:
                                      '฿${(product.price * count).toStringAsFixed(2)}',
                                  image: product.image,
                                  count: count.toString(),
                                ),
                                IconButton(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  splashRadius: 1,
                                  icon: Icon(
                                    Icons.remove_circle,
                                    color: Colors.red[200],
                                  ),
                                  onPressed: () => viewModel
                                      .removeProductFromReceipt(product),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    const SizedBox(height: 20),
                    if (viewModel.selectedProducts.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '฿${NumberFormat("#,##0.00").format(viewModel.calculateTotal())}',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GeneralButton(
                            text: 'CLEAR ALL',
                            onPressed: viewModel.clearSelectedProducts),
                        GeneralButton(
                            text: 'PAY NOW',
                            onPressed: viewModel.navigateToPayment,
                            backgroundColor: Colors.yellow[200]),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  ReceiptViewModel viewModelBuilder(BuildContext context) => ReceiptViewModel();
}
