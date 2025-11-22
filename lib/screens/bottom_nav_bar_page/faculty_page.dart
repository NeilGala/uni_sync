import 'package:flutter/material.dart';

class FacultyPage extends StatelessWidget {
  const FacultyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faculty = [
      {
        'name': 'Dr. Jane Doe, Professor',
        'dept': 'Department of Computer Science',
        'img': 'https://i.pravatar.cc/150?img=47',
      },
      {
        'name': 'Dr. John Smith, Associate Professor',
        'dept': 'Department of Arts and Humanities',
        'img': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'name': 'Dr. Emily White, Assistant Professor',
        'dept': 'Department of Engineering',
        'img': 'https://i.pravatar.cc/150?img=32',
      },
      {
        'name': 'Dr. Michael Brown, Lecturer',
        'dept': 'Department of Computer Science',
        'img': 'https://i.pravatar.cc/150?img=5',
      },
      {
        'name': 'Dr. Sarah Green, Professor',
        'dept': 'Department of Arts and Humanities',
        'img': 'https://i.pravatar.cc/150?img=19',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Faculty Directory",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
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

              // Filter chips
              Wrap(
                spacing: 8,
                children: [
                  FilterChip(
                    label: const Text("Sort A Z"),
                    selected: true,
                    onSelected: (value) {},
                  ),
                  FilterChip(
                    label: const Text("Computer Science"),
                    selected: false,
                    onSelected: (value) {},
                  ),
                  FilterChip(
                    label: const Text("Arts and Humanities"),
                    selected: false,
                    onSelected: (value) {},
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // List of faculty
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
                      leading: Stack(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(item['img']!),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ],
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
