import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class PercentageScreen extends StatefulWidget {
  const PercentageScreen({super.key, required this.mainColor});
  final Color mainColor;
  @override
  State<PercentageScreen> createState() => _PercentageScreenState();
}

class _PercentageScreenState extends State<PercentageScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController perAmountController = TextEditingController();
  String percentageAmount = "Calculated percentage";
  double calculatePercentage(double amount, double percentage) {
    if (amount < 0 || percentage < 0) {
      throw ArgumentError("Amount and percentage must be non-negative.");
    }

    double percentageAmount = (percentage / 100) * amount;
    return percentageAmount;
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
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: const Text(
                'Percentage',
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
                    description: 'Percentage',
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
                    child: Text(percentageAmount),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        perAmountController.text = calculatePercentage(
                                double.tryParse(amountController.text) ?? 0.0,
                                double.tryParse(percentageController.text) ??
                                    0.0)
                            .toString();
                        percentageAmount = calculatePercentage(
                                double.tryParse(amountController.text) ?? 0.0,
                                double.tryParse(percentageController.text) ??
                                    0.0)
                            .toString();
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Calculate Percentage')),
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
