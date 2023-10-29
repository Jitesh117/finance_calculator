import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/input_widget.dart';

class LoanEmiScreen extends StatefulWidget {
  const LoanEmiScreen({super.key, required this.mainColor});
final Color mainColor;
  @override
  State<LoanEmiScreen> createState() => _LoanEmiScreenState();
}

class _LoanEmiScreenState extends State<LoanEmiScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController termController = TextEditingController();
  String emiAmount = "EMI amount";
  double calculateLoanEMI(
      double principal, double annualInterestRate, int loanTenureYears,
      {int installmentsPerYear = 12}) {
    // Convert annual interest rate to monthly interest rate
    double monthlyInterestRate =
        annualInterestRate / (installmentsPerYear * 100.0);

    // Total number of installments
    int totalInstallments = loanTenureYears * installmentsPerYear;

    // Calculate EMI using the formula: EMI = P * r * (1 + r)^n / ((1 + r)^n - 1)
    double emi = (principal *
            monthlyInterestRate *
            pow(1 + monthlyInterestRate, totalInstallments)) /
        (pow(1 + monthlyInterestRate, totalInstallments) - 1);

    return emi;
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
                'EMI',
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
                    description: 'Annual Interest rate',
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
                          emiAmount = calculateLoanEMI(
                            double.tryParse(amountController.text) ?? 0.0,
                            double.tryParse(rateController.text) ?? 0.0,
                            int.tryParse(termController.text) ?? 0,
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
                        child: const Text('Calculate EMI amount')),
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
