import 'package:flutter/material.dart';

import 'notification_page.dart';

class BlueAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final double elevation;
  final VoidCallback? onNotificationTap;
  final int notificationCount;

  const BlueAppBar({
    Key? key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.elevation = 4.0,
    this.onNotificationTap,
    this.notificationCount = 0,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final List<Widget> mergedActions = [];

    // Notification icon with optional badge
    mergedActions.add(
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.black),
              onPressed:
                  onNotificationTap ??
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationPage(),
                      ),
                    );
                  },
              tooltip: 'Notifications',
            ),
            if (notificationCount > 0)
              Positioned(
                right: 6,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Center(
                    child: Text(
                      notificationCount > 99
                          ? '99+'
                          : notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    // Append any additional actions provided by the caller
    if (actions != null) {
      mergedActions.addAll(actions!);
    }

    return AppBar(
      backgroundColor: Colors.blue,
      title: title,
      centerTitle: centerTitle,
      elevation: elevation,
      actions: mergedActions,
    );
  }
}
