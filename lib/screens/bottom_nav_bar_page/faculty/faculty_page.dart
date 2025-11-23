import 'package:flutter/material.dart';
import '../../../app_bar.dart';
import 'faculty_profile.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // UPDATED FACULTY LIST with placeholder image URLs (which are not used for NetworkImage anymore)
    final List<Map<String, String>> faculty = [
      {
        'name': 'Prof. Aniket Kore',
        'dept': 'Professor, Computer Science',
        'img': '', // Image URL removed/set to empty
      },
      {
        'name': 'Prof. Chinmay Raut',
        'dept': 'Associate Professor, Computer Science',
        'img': '', // Image URL removed/set to empty
      },
      {
        'name': 'Prof. Sridhar Iyer',
        'dept': 'Professor, Computer Science',
        'img': '', // Image URL removed/set to empty
      },
      {
        'name': 'Prof. Pankaj Sonawane',
        'dept': 'Assistant Professor, Computer Science',
        'img': '', // Image URL removed/set to empty
      },
      {
        'name': 'Prof. Nilesh Patil',
        'dept': 'Lecturer, Computer Science',
        'img': '', // Image URL removed/set to empty
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SimpleAppBar(title: 'Faculty'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search by name or department",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faculty.length,
                itemBuilder: (context, index) {
                  final item = faculty[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: Colors.grey.shade100,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FacultyPageProfile(
                              name: item['name']!,
                              department: item['dept']!,
                              // Pass empty string for image URL
                              imageUrl: item['img']!,
                            ),
                          ),
                        );
                      },
                      leading: const CircleAvatar(
                        // REMOVED NetworkImage
                        radius: 26,
                        backgroundColor:
                            Colors.blueGrey, // Use a placeholder color
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ), // Use a person icon
                      ),
                      title: Text(
                        item['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        item['dept']!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
