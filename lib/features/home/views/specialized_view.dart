import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_view.dart';

class SpecializedView extends StatelessWidget {
  SpecializedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('specialized_services'.tr),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // const SizedBox(height: 20),
          // const SoonWidget(
          //   animationDuration: Duration(milliseconds: 2000),
          //   style: TextStyle(
          //     fontSize: 28,
          //     fontWeight: FontWeight.bold,
          //     color: Color(0xFFFF416C),
          //   ),
          // ),
          // const SizedBox(height: 40),
          _buildServiceSection(
            'carpet_cleaning'.tr,
            'carpet_cleaning_desc'.tr,
            Icons.camera_roll_outlined,
          ),
          _buildServiceSection(
            'window_cleaning'.tr,
            'window_cleaning_desc'.tr,
            Icons.window,
          ),
          _buildServiceSection(
            'post_construction'.tr,
            'post_construction_desc'.tr,
            Icons.construction,
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
