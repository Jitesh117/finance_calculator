import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class CompoundInterestScreen extends StatefulWidget {
  const CompoundInterestScreen({super.key, required this.mainColor});
  final Color mainColor;

  @override
  State<CompoundInterestScreen> createState() => _CompoundInterestScreenState();
}

class _CompoundInterestScreenState extends State<CompoundInterestScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String interestAmount = "Amount after Interest";
  double calculateInterest(double principal, double rate, double time) {
    double compoundFrequency = 1;
    if (principal < 0 || rate < 0 || time < 0 || compoundFrequency < 1) {
      throw ArgumentError(
          "Principal, rate, time, and compound frequency must be valid.");
    }
    double decimalRate = rate / 100.0;
    double compoundInterest = principal *
            pow(1 + (decimalRate / compoundFrequency),
                compoundFrequency * time) -
        principal;

    return compoundInterest;
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
                'Compound Interest',
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
                    description: 'Interest',
                    controller: percentageController,
                  ),
                  InputWidget(
                    description: 'Term(Years)',
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
                    child: Text(interestAmount),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          interestAmount = calculateInterest(
                                  double.tryParse(amountController.text) ?? 0.0,
                                  double.tryParse(percentageController.text) ??
                                      0.0,
                                  double.tryParse(termController.text) ?? 0.0)
                              .toString();
                        },
                      );
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Calculate Interest')),
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
