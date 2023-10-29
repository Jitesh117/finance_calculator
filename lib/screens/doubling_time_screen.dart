import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class DoublingTimeScreen extends StatefulWidget {
  const DoublingTimeScreen({super.key, required this.mainColor});
final Color mainColor;
  @override
  State<DoublingTimeScreen> createState() => _DoublingTimeScreenState();
}

class _DoublingTimeScreenState extends State<DoublingTimeScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String doublingTime = "Doubling Time";
  double calculateDoublingTime(double growthRate) {
    // Ensure the growth rate is within valid range
    if (growthRate <= 0) {
      throw ArgumentError('Growth rate should be greater than 0.');
    }
    growthRate /= 100;
    // Calculate the doubling time
    double doublingTime = log(2) / log(1 + growthRate);
    return doublingTime;
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
                'Doubling Time',
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
                    description: 'Interest Rate',
                    controller: rateController,
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
                    child: Text(doublingTime),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          doublingTime = calculateDoublingTime(
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
                        child: const Text('Calculate Doubling time')),
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
