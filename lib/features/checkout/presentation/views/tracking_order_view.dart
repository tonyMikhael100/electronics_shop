import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrackingOrderView extends StatelessWidget {
  const TrackingOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking Order'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Status',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildStep('Order Placed', true),
            _buildStep('Order Confirmed', true),
            _buildStep('Shipped', false),
            _buildStep('Out for Delivery', false),
            _buildStep('Delivered', false),
            const Spacer(),
            CustomElevatedButton(
              icon: Icons.arrow_back,
              label: 'Back To Home',
              onTap: () {
                context.go('/home_view');
              },
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(String title, bool completed) {
    return Row(
      children: [
        Icon(
          completed ? Icons.check_circle : Icons.radio_button_unchecked,
          color: completed ? Colors.green : Colors.grey,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: completed ? Colors.green : Colors.black54,
            fontWeight: completed ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
