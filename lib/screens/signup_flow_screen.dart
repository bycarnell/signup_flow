import 'package:flutter/material.dart';
import 'package:signup_flow/screens/steps/personal_info_step.dart';
import 'package:signup_flow/screens/steps/contact_step.dart';
import 'package:signup_flow/screens/steps/confirmation_step.dart';

class SignupFlowScreen extends StatefulWidget {
  const SignupFlowScreen({super.key});

  @override
  State<SignupFlowScreen> createState() => _SignupFlowScreenState();
}

class _SignupFlowScreenState extends State<SignupFlowScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  void _goTo(int page) {
    setState(() => _currentPage = page);
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inscription')),
      body: Column(
        children: [
          LinearProgressIndicator(value: (_currentPage + 1) / 3),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                PersonalInfoStep(onNext: () => _goTo(1)),
                ContactStep(onNext: () => _goTo(2), onBack: () => _goTo(0)),
                ConfirmationStep(onBack: () => _goTo(1)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
