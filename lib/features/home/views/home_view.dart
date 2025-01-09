import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this to support Clipboard
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this import

import '../../../core/helpers/size_config.dart';
import '../widgets/ad_carousel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        // title: Text('app_name'.tr),
        title: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/images/logo.png',
            width: SizeConfig.getResponsiveSize(30), // Responsive logo size
          ),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed('/settings'),
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.getResponsiveSize(2)),
            Center(
              child: Text(
                'welcome_message'.tr,
                style: TextStyle(
                  fontSize: SizeConfig.getResponsiveSize(6),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const AdCarousel(),
            Padding(
              padding: EdgeInsets.all(SizeConfig.getResponsiveSize(4)),
              child: Row(
                children: [
                  Icon(Icons.cleaning_services,
                      size: SizeConfig.getResponsiveSize(6),
                      color: Theme.of(context).primaryColor),
                  SizedBox(width: SizeConfig.getResponsiveSize(2)),
                  Text(
                    'our_services'.tr,
                    style: TextStyle(
                      fontSize: SizeConfig.getResponsiveSize(6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.getResponsiveSize(4)),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isTablet = constraints.maxWidth > 600;
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isTablet ? 2 : 1,
                    childAspectRatio: isTablet
                        ? 1.3
                        : 1.1, // Tweak to reduce overflow for larger elements
                    mainAxisSpacing: SizeConfig.getResponsiveSize(4),
                    crossAxisSpacing: SizeConfig.getResponsiveSize(4),
                    children: [
                      ServiceCard(
                        title: 'residential_cleaning'.tr,
                        description: 'residential_desc'.tr,
                        icon: Icons.home,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0071BC), Color(0xFF001E55)],
                        ),
                        onTap: () => Get.toNamed('/residential'),
                      ),
                      ServiceCard(
                        title: 'commercial_cleaning'.tr,
                        description: 'commercial_desc'.tr,
                        icon: Icons.business,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF11998E), Color(0xFF38EF7D)],
                        ),
                        onTap: () => Get.toNamed('/commercial'),
                      ),
                      ServiceCard(
                        title: 'specialized_services'.tr,
                        description: 'specialized_desc'.tr,
                        icon: Icons.cleaning_services,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF416C), Color(0xFFFF4B2B)],
                        ),
                        onTap: () => Get.toNamed('/specialized'),
                      ),
                      ServiceCard(
                        title: 'call_us'.tr,
                        description: 'call_us_desc'.tr,
                        icon: Icons.phone,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF9733EE), Color(0xFFDA22FF)],
                        ),
                        onTap: () => _showPhoneNumbers(context),
                      ),
                      ServiceCard(
                        title: 'availability_title'.tr,
                        description: 'availability_desc'.tr +
                            ' ' +
                            'twenty_four_hours'.tr,
                        icon: Icons.access_time,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4CAF50), Color(0xFF087F23)],
                        ),
                        onTap: () {},
                      ),
                      ServiceCard(
                        title: 'email_title'.tr,
                        description: 'email_desc'.tr,
                        icon: Icons.email_outlined,
                        gradient: const LinearGradient(
                          colors: [Color(0xFFBA68C8), Color(0xFF7B1FA2)],
                        ),
                        onTap: () {
                          Clipboard.setData(
                              const ClipboardData(text: 'info@hacc-me.com'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('email_copied'.tr)),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(SizeConfig.getResponsiveSize(6)),
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'about_us'.tr,
                    style: TextStyle(
                      fontSize: SizeConfig.getResponsiveSize(7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getResponsiveSize(6)),
                  Text(
                    'who_we_are'.tr,
                    style: TextStyle(
                      fontSize: SizeConfig.getResponsiveSize(5.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getResponsiveSize(2)),
                  Text(
                    'about_description'.tr,
                    style: TextStyle(
                      fontSize: SizeConfig.getResponsiveSize(4),
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getResponsiveSize(6)),
                  Text(
                    'our_mission'.tr,
                    style: TextStyle(
                      fontSize: SizeConfig.getResponsiveSize(5.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getResponsiveSize(2)),
                  Text(
                    'mission_description'.tr,
                    style: TextStyle(
                      fontSize: SizeConfig.getResponsiveSize(4),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () => _showPhoneNumbers(context),
        child: const Icon(Icons.phone),
      ),
    );
  }
}

class ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;
  final Gradient gradient;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    required this.gradient,
  });

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: _isHovered ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                gradient: widget.gradient,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.getResponsiveSize(4)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon,
                        size: SizeConfig.screenWidth! < 600
                            ? SizeConfig.getResponsiveSize(
                                16) // Larger icons on mobile
                            : SizeConfig.getResponsiveSize(12),
                        color: Colors.white),
                    SizedBox(height: SizeConfig.getResponsiveSize(3)),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth! < 600
                            ? SizeConfig.getResponsiveSize(
                                7) // Larger title on mobile
                            : SizeConfig.getResponsiveSize(5.5),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.getResponsiveSize(2)),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth! < 600
                            ? SizeConfig.getResponsiveSize(
                                5) // Larger description on mobile
                            : SizeConfig.getResponsiveSize(4),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneNumbersCard extends StatelessWidget {
  const PhoneNumbersCard({super.key});

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
    return InkWell(
      onTap: () => _showPhoneNumbers(context),
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
    );
  }
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
