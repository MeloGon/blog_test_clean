import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final double height;
  final bool? goBack;
  final String? title;
  final Widget? actions;

  AppBarWidget({
    super.key,
    this.height = kToolbarHeight,
    this.title,
    this.goBack,
    this.actions,
  }) : super(
            child: Container(),
            preferredSize: const Size.fromHeight(kToolbarHeight));

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff251d81),
      leading: (goBack ?? false)
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.keyboard_arrow_left,
                size: 30.0,
              ),
            )
          : const SizedBox.shrink(),
      title: Text(
        title ?? '',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 23.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [actions ?? const SizedBox.shrink()],
    );
  }
}
