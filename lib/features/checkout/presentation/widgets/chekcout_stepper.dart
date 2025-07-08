import 'package:electronics_shop/features/checkout/presentation/widgets/custom_stepper_circle_avatr.dart';
import 'package:flutter/material.dart';

class CheckouStepper extends StatelessWidget {
  const CheckouStepper({
    super.key,
    required this.isActiveOne,
    required this.isActiveTwo,
    required this.isActiveThree,
  });
  final bool isActiveOne;
  final bool isActiveTwo;
  final bool isActiveThree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomStepperCircleAvatar(
            index: '1',
            title: 'Address Details',
            isActive: isActiveOne,
          ),
          Expanded(child: Divider()),
          CustomStepperCircleAvatar(
            index: '2',
            title: 'Payment',
            isActive: isActiveTwo,
          ),
          Expanded(child: Divider()),
          CustomStepperCircleAvatar(
            index: '3',
            title: 'Tracking Order',
            isActive: isActiveThree,
          ),
        ],
      ),
    );
  }
}
