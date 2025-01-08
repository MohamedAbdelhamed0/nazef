import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResidentialServiceView extends StatelessWidget {
  ResidentialServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Residential Cleaning'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Residential Cleaning Service Page'.tr),
      ),
    );
  }
}
