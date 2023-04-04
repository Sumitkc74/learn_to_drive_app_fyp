import 'package:flutter/material.dart';
import 'package:first_app/utils/colors.dart';

class ScreensAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScreensAppBar({
    Key? key,
    required this.title,
    this.onPressed,
    this.action,
    this.automaticallyImplyLeading = true,
    this.height,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final Widget? action;
  final bool automaticallyImplyLeading;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: automaticallyImplyLeading 
      ?  IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back),
      )
      : null ,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black, 
        ),
      ),
      toolbarHeight: height ?? 80,
      foregroundColor: AppColors.primaryBlack,
      backgroundColor: AppColors.primaryYellow,
      shadowColor: AppColors.primaryBlack,
      actions: action != null ? [action!] : null,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}