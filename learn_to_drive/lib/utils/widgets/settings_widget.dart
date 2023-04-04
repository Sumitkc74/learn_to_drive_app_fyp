import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    Key? key,
    required this.icon,
    required this.label,
    this.arrowIcon,
    this.onTap,
    this.obx,
  }) : super(key: key);

  final IconData icon;
  final IconData? arrowIcon;
  final String label;
  final VoidCallback? onTap;
  final Obx? obx;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF3C3C3C),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: onTap,
            splashColor: Colors.grey.withOpacity(0.1),
            child: SizedBox(
              height: 80,
              width: Get.width/1.15,
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.0,
                  children: [
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 25
                      ),
                    ),
                    // const SizedBox(width:50),
                    Icon(
                      arrowIcon,
                      color: Colors.white,
                      size: 30,
                    ),
                    if (obx != null) Obx(() => obx!),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}