import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class GstScreen extends StatefulWidget {
  const GstScreen({super.key, required this.mainColor});
  final Color mainColor;
  @override
  State<GstScreen> createState() => _GstScreenState();
}

class _GstScreenState extends State<GstScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String gstAmount = "Amount after GST";
  double calculateGST(double amount, double gstRate) {
    double gstAmount = (amount * gstRate) / 100.0;
    return amount + gstAmount;
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
                'GST',
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
                    description: 'GST rate',
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
                          gstAmount = calculateGST(
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
                        child: const Text('Calculate GST amount')),
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
