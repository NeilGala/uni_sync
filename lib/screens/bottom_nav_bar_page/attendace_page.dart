import 'package:flutter/material.dart';
import '../../app_bar.dart';

class AttendacePage extends StatelessWidget {
  const AttendacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BlueAppBar(title: Text('Attendance')),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Overall Attendance",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 16),

                Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: 0.82,
                          strokeWidth: 12,
                          backgroundColor: Colors.white12,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green,
                          ),
                        ),
                        const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "82%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "On Track",
                              style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  "Subject Breakdown",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),
                _subjectCard(
                  code: "CS101",
                  subject: "Intro to Programming",
                  percent: 85,
                  attended: "36 of 40",
                  color: Colors.green,
                ),

                _subjectCard(
                  code: "MA203",
                  subject: "Linear Algebra",
                  percent: 78,
                  attended: "31 of 40",
                  color: Colors.yellow,
                ),

                _subjectCard(
                  code: "PH110",
                  subject: "Classical Mechanics",
                  percent: 72,
                  attended: "29 of 40",
                  color: Colors.redAccent,
                  warning: "Below 75 percent threshold",
                ),

                const SizedBox(height: 20),

                _forecastCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _subjectCard({
    required String code,
    required String subject,
    required int percent,
    required String attended,
    required Color color,
    String? warning,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff1f2937),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: warning != null ? Colors.redAccent : Colors.transparent,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "$code: $subject",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "$percent%",
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),

          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: percent / 100,
            backgroundColor: Colors.white12,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),

          const SizedBox(height: 10),
          Text(
            "Attended: $attended${warning != null ? "   $warning" : ""}",
            style: TextStyle(
              color: warning != null ? Colors.redAccent : Colors.white60,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _forecastCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff1f2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            "Attendance Forecast",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            "If you attend all classes for the next 2 days your attendance will improve",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),

          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xff111827),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.blueAccent),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Mark Today's Attendance",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  height: 22,
                  width: 22,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
