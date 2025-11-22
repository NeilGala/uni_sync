// File: lib/notification_page.dart
import 'package:flutter/material.dart';
import 'package:uni_sync/app_bar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String> _notifications = [
    'Welcome to UniSync — your profile is complete.',
    'Hackathon registration opens tomorrow.',
    'New message from Admin.',
  ];

  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 600));
    // simulate fetching new notifications
    setState(() {
      _notifications.insert(
        0,
        'Fetched notification at ${DateTime.now().toLocal().toIso8601String()}',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlueAppBar(title: Text('Notifications')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: _notifications.isEmpty
            ? ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 180),
                  Center(
                    child: Icon(
                      Icons.notifications_off,
                      size: 56,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'No notifications',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              )
            : ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                itemCount: _notifications.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  final text = _notifications[index];
                  return ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.blue,
                    ),
                    title: Text(text),
                    subtitle: Text(
                      'Just now',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                    onTap: () {
                      // optional: mark read / open details
                    },
                  );
                },
              ),
      ),
    );
  }
}
