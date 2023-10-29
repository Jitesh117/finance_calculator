import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class ReturnOnInvestmentScreen extends StatefulWidget {
  const ReturnOnInvestmentScreen({super.key, required this.mainColor});
final Color mainColor;
  @override
  State<ReturnOnInvestmentScreen> createState() =>
      _ReturnOnInvestmentScreenState();
}

class _ReturnOnInvestmentScreenState extends State<ReturnOnInvestmentScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String emiAmount = "Return on Investment";
  double calculateROI(double initialValue, double finalValue) {
    // Ensure the initial value is greater than 0
    if (initialValue <= 0) {
      throw ArgumentError('Initial value should be greater than 0.');
    }

    // Calculate the return on investment (ROI)
    double roi = ((finalValue - initialValue) / initialValue) * 100;
    return roi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
          
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
                'ROI',
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
                    description: 'Initial Amount',
                    controller: amountController,
                  ),
                  InputWidget(
                    description: 'Final Amount',
                    controller: rateController,
                  ),
                  InputWidget(
                    description: 'Term in years',
                    controller: termController,
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
                    child: Text(emiAmount),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          emiAmount = calculateROI(
                            double.tryParse(amountController.text) ?? 0.0,
                            double.tryParse(rateController.text) ?? 0.0,
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
                        child: const Text('Calculate ROI amount')),
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
