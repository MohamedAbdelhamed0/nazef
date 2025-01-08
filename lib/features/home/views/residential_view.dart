import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view.dart';

class ResidentialView extends StatelessWidget {
  ResidentialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('residential_cleaning'.tr),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildServiceSection(
            'regular_home_cleaning'.tr,
            'regular_home_cleaning_desc'.tr,
            Icons.home_work,
          ),
          _buildServiceSection(
            'deep_cleaning'.tr,
            'deep_cleaning_desc'.tr,
            Icons.cleaning_services,
          ),
          _buildServiceSection(
            'move_in_out_cleaning'.tr,
            'move_in_out_cleaning_desc'.tr,
            Icons.move_to_inbox,
          ),
          PhoneNumbersCard(),
        ],
      ),
    );
  }

  Widget _buildServiceSection(String title, String description, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}
