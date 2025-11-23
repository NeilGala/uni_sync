import 'package:flutter/material.dart';

class FacultyPageProfile extends StatelessWidget {
  final String name;
  final String department;
  final String imageUrl;

  const FacultyPageProfile({
    super.key,
    required this.name,
    required this.department,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if we should use a network image or a placeholder icon
    final bool hasImage = imageUrl.isNotEmpty;

    Widget profileImageWidget = hasImage
        ? CircleAvatar(radius: 45, backgroundImage: NetworkImage(imageUrl))
        : const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, color: Colors.white, size: 50),
          );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Faculty Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  // Use the determined profile image widget
                  profileImageWidget,
                  const SizedBox(height: 14),

                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    department,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Email'),
                      ),

                      const SizedBox(width: 12),

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade300,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                        ),
                        child: const Text(
                          'Message',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            const Text(
              'Schedule',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // DUMMY SCHEDULE DATA
            _buildScheduleCard(),

            const SizedBox(height: 22),

            const Text(
              'Information',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // DUMMY LOCATION DATA
            _infoCard('Office Location', 'CS Building, Room 402'),

            const SizedBox(height: 14),

            // DUMMY SUBJECTS DATA
            _subjectsCard(),

            const SizedBox(height: 22),

            const Text(
              'Announcements',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            // DUMMY ANNOUNCEMENTS
            _announcement(
              title: 'CS505 Project Submission Deadline',
              subtitle:
                  'The final project for Data Structures (CS505) is due this Friday at 11:59 PM. No extensions will be given.',
              badge: 'Urgent',
              badgeColor: Colors.red.shade300,
              time: '3 hours ago',
            ),

            const SizedBox(height: 12),

            _announcement(
              title: 'Extra Office Hours',
              subtitle:
                  'I will hold an extra office hour session on Thursday at 4 PM to discuss the upcoming exam.',
              badge: 'New',
              badgeColor: Colors.green.shade300,
              time: '1 day ago',
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildScheduleCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lecture Timetable',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          _lectureRow('Mon', '10 AM', 'CS301 Software Engineering'),
          _lectureRow('Tue', '1 PM', 'CS505 Data Structures'),
          _lectureRow('Wed', '9 AM', 'CS640 Artificial Intelligence'),
          _lectureRow('Fri', '2 PM', 'CS301 Software Engineering'),
        ],
      ),
    );
  }

  Widget _lectureRow(String day, String time, String subject) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 45,
            child: Text(day, style: const TextStyle(color: Colors.black)),
          ),
          SizedBox(
            width: 65,
            child: Text(time, style: const TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: Text(subject, style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _subjectsCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Subjects Taught',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              _chip('CS301'),
              _chip('CS505'),
              _chip('CS640'),
              _chip('CS420'),
              _chip('CS101'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }

  Widget _announcement({
    required String title,
    required String subtitle,
    required String? badge,
    required Color? badgeColor,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 8),

          Text(subtitle, style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 8),

          Text(
            time,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
