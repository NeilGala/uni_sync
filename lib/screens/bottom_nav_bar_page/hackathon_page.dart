import 'package:flutter/material.dart';

class HackathonPage extends StatelessWidget {
  const HackathonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
        children: [
          const Text(
            "Opportunities and Events",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 16),

          _filterHeader(),

          const SizedBox(height: 16),

          _eventCard(
            title: "InnovateAI Hackathon 2024",
            location: "San Francisco",
            date: "Ends Oct 26",
            description:
                "Join us for a weekend of innovation, coding, and collaboration to build the next generation of AI applications.",
            tags: ["Beginner Friendly"],
            cta: "Apply Now",
          ),

          _eventCard(
            title: "Software Engineer Intern",
            location: "Remote",
            date: "Deadline Nov 15",
            description:
                "Work on cutting edge projects and gain real world experience with a dynamic team at Meta.",
            tags: ["Paid", "Remote"],
            cta: "Apply Now",
          ),

          _eventCard(
            title: "UX Design Workshop",
            location: "Online",
            date: "Nov 5",
            description:
                "Learn the fundamentals of user centric design from industry experts at Figma in this interactive workshop.",
            tags: ["Beginner Friendly"],
            cta: "Register",
          ),

          _emptyCard(),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Opportunities and Events",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Icon(Icons.search, color: Colors.white.withOpacity(0.7)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _chip("All", true),
              const SizedBox(width: 8),
              _chip("Hackathons", false),
              const SizedBox(width: 8),
              _chip("Internships", false),
              const SizedBox(width: 8),
              _chip("Workshops", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: selected ? Colors.blueAccent : const Color(0xff1f2937),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _eventCard({
    required String title,
    required String location,
    required String date,
    required String description,
    required List<String> tags,
    required String cta,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff1f2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.white70),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Colors.white70)),
              const SizedBox(width: 12),
              const Icon(Icons.calendar_today, size: 16, color: Colors.white70),
              const SizedBox(width: 4),
              Text(date, style: const TextStyle(color: Colors.white70)),
            ],
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: const TextStyle(color: Colors.white70, height: 1.4),
          ),

          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            children: tags
                .map(
                  (tag) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
                .toList(),
          ),

          const SizedBox(height: 16),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
              ),
              child: Text(
                cta,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff1f2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Icon(Icons.close, size: 30, color: Colors.white54),
          const SizedBox(height: 12),
          const Text(
            "No Seminars Found",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 6),
          const Text(
            "Try selecting a different category to find new opportunities.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white60, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
