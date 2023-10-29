import 'package:fin_calc/screens/cagr_screen.dart';
import 'package:fin_calc/screens/compound_interest_screen.dart';
import 'package:fin_calc/screens/discount_screen.dart';
import 'package:fin_calc/screens/doubling_time_screen.dart';
import 'package:fin_calc/screens/gst_screen.dart';
import 'package:fin_calc/screens/loan_emi_screen.dart';
import 'package:fin_calc/screens/percentage_screen.dart';
import 'package:fin_calc/screens/recurring_screen.dart';
import 'package:fin_calc/screens/return_on_investment_screen.dart';
import 'package:fin_calc/screens/simple_interest_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/calculator_widgets/calc_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: ListView(
              children: [
                const Text(
                  'Interest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SimpleInterestScreen(
                                mainColor: Colors.pinkAccent.shade100,
                              )),
                    );
                  },
                  child: CalcButton(
                    description: 'Simple Interest',
                    buttonColor: Colors.pinkAccent.shade100,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompoundInterestScreen(
                                mainColor: Colors.greenAccent,
                              )),
                    );
                  },
                  child: const CalcButton(
                    description: 'Compound Interest',
                    buttonColor: Colors.greenAccent,
                    imagePath: 'assets/icons/abacus.png',
                  ),
                ),
                const Text(
                  'General',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  GstScreen(
                                mainColor: Colors.blueAccent.shade100,
                              )),
                    );
                  },
                  child: CalcButton(
                    description: 'GST',
                    buttonColor: Colors.blueAccent.shade100,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  DiscountScreen(
                                mainColor: Colors.yellowAccent.shade100,
                              )),
                    );
                  },
                  child: CalcButton(
                    description: 'Discount',
                    buttonColor: Colors.yellowAccent.shade100,
                    imagePath: 'assets/icons/abacus.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  PercentageScreen(
                                mainColor: Colors.blueAccent.shade100,
                              )),
                    );
                  },
                  child: CalcButton(
                    description: 'Percentage',
                    buttonColor: Colors.blueAccent.shade100,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                const Text(
                  'Loan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  LoanEmiScreen(
                                mainColor: Colors.purpleAccent.shade100,
                              )),
                    );
                  },
                  child: CalcButton(
                    description: 'Loan EMI',
                    buttonColor: Colors.purpleAccent.shade100,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                // const CalcButton(
                //   description: 'Compare Loan',
                //   buttonColor: Colors.blueAccent,
                //   imagePath: 'assets/icons/abacus.png',
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  LoanEmiScreen(
                                mainColor: Colors.purpleAccent.shade100,
                              )),
                    );
                  },
                  child: CalcButton(
                    description: 'Loan Affordability',
                    buttonColor: Colors.purpleAccent.shade100,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                const Text(
                  'Saving and Investment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RecurringDepositScreen(
                                mainColor: Colors.tealAccent,
                              )),
                    );
                  },
                  child: const CalcButton(
                    description: 'Recurring deposit',
                    buttonColor: Colors.tealAccent,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReturnOnInvestmentScreen(
                                mainColor: Colors.blue,
                              )),
                    );
                  },
                  child: const CalcButton(
                    description: 'Return on investment',
                    buttonColor: Colors.blue,
                    imagePath: 'assets/icons/abacus.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CAGRScreen(
                                mainColor: Colors.tealAccent,
                              )),
                    );
                  },
                  child: const CalcButton(
                    description: 'Compound annual growth rate',
                    buttonColor: Colors.tealAccent,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoublingTimeScreen(
                                mainColor: Colors.blue,
                              )),
                    );
                  },
                  child: const CalcButton(
                    description: 'Doubling time',
                    buttonColor: Colors.blue,
                    imagePath: 'assets/icons/calculator.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
