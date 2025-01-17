import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/soon_widget.dart';
import 'home_view.dart';

class CommercialView extends StatelessWidget {
  CommercialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('commercial_cleaning'.tr),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const SizedBox(height: 20),
          const SoonWidget(
            animationDuration: Duration(milliseconds: 2000),
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF11998E),
            ),
          ),
          const SizedBox(height: 40),
          _buildServiceSection(
            'office_cleaning'.tr,
            'office_cleaning_desc'.tr,
            Icons.business_center,
          ),
          _buildServiceSection(
            'retail_space_cleaning'.tr,
            'retail_space_cleaning_desc'.tr,
            Icons.store,
          ),
          _buildServiceSection(
            'industrial_cleaning'.tr,
            'industrial_cleaning_desc'.tr,
            Icons.factory,
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
