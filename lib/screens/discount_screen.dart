import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key, required this.mainColor});
final Color mainColor;
  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String gstAmount = "Discounted Price";
  double calculateDiscountedPrice(double originalPrice, double discountRate) {
    // Ensure the discount rate is within valid range (0 to 100)
    if (discountRate < 0 || discountRate > 100) {
      throw ArgumentError('Discount rate should be between 0 and 100.');
    }

    double discountedPrice =
        originalPrice - (originalPrice * (discountRate / 100.0));
    return discountedPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           
                        const SizedBox(height: 20),
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                 color: widget.mainColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.black, width: 4),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: const Text(
                'Discount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  InputWidget(
                    description: 'Amount',
                    controller: amountController,
                  ),
                  InputWidget(
                    description: 'Discount rate',
                    controller: percentageController,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 4),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(4, 4),
                          blurRadius: 0,
                        ),
                      ],
                    ),
                    child: Text(gstAmount),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          gstAmount = calculateDiscountedPrice(
                            double.tryParse(amountController.text) ?? 0.0,
                            double.tryParse(percentageController.text) ?? 0.0,
                          ).toString();
                        },
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Calculate discounted amount')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
