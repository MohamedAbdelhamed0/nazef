import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumbersCard extends StatefulWidget {
  const PhoneNumbersCard({super.key});

  @override
  _PhoneNumbersCardState createState() => _PhoneNumbersCardState();
}

class _PhoneNumbersCardState extends State<PhoneNumbersCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showPhoneNumbers(BuildContext context) {
    final phoneNumbers = [
      {'number': '+971522330037', 'label': 'Main Office'},
      {'number': '+971562735157', 'label': 'Customer Service'},
      {'number': '+97142842266', 'label': 'Emergency'},
    ];
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'contact_us'.tr,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...phoneNumbers
                .map((phone) => ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(phone['label']!),
                      subtitle: Text(phone['number']!),
                      onTap: () async {
                        final url = 'tel:${phone['number']}';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.reverse(),
      onTapUp: (_) => _animationController.forward(),
      onTapCancel: () => _animationController.forward(),
      onTap: () => _showPhoneNumbers(context),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.phone, size: 32),
                const SizedBox(width: 10),
                Text('contact_us'.tr, style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
