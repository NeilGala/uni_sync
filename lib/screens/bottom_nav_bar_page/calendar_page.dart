// Calendar page
import 'package:flutter/material.dart';

import '../../app_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(title: 'Calendar'),
      body: Center(child: Text('Calendar', style: TextStyle(fontSize: 24))),
    );
  }
}
