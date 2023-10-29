import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class CAGRScreen extends StatefulWidget {
  const CAGRScreen({super.key, required this.mainColor});
  final Color mainColor;
  @override
  State<CAGRScreen> createState() => _CAGRScreenState();
}

class _CAGRScreenState extends State<CAGRScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String emiAmount = "CAGR";
  double calculateRecurringDepositMaturityAmount(double monthlyDeposit,
      double annualInterestRate, int months, int compoundingFrequencyPerYear) {
    // Convert the annual interest rate from percentage to decimal
    double decimalInterestRate = annualInterestRate / 100.0;

    // Convert the compounding frequency to monthly compounding rate
    double monthlyCompoundingRate =
        decimalInterestRate / compoundingFrequencyPerYear;

    // Calculate the maturity amount
    double maturityAmount = 0.0;
    for (int month = 1; month <= months; month++) {
      maturityAmount += monthlyDeposit;
      maturityAmount += maturityAmount * monthlyCompoundingRate;
    }

    return maturityAmount;
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
                'CAGR Calculator',
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
                    description: 'Initial value',
                    controller: amountController,
                  ),
                  InputWidget(
                    description: 'Final Value',
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
                          emiAmount = calculateRecurringDepositMaturityAmount(
                                  double.tryParse(amountController.text) ?? 0.0,
                                  double.tryParse(rateController.text) ?? 0.0,
                                  int.tryParse(termController.text) ?? 0,
                                  1)
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
                        child: const Text('Calculate CAGR amount')),
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
