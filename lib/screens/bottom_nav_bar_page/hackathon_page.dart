import 'package:flutter/material.dart';
import 'package:uni_sync/app_bar.dart';

class HackathonPage extends StatelessWidget {
  const HackathonPage({super.key});

  @override
  Widget build(BuildContext context) {
    // The screen title has been updated to "Hackathons/Opportunities"
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0), // Light gray background
      appBar: const SimpleAppBar(title: 'Hackathons/Opportunities'),
      body: const OpportunitiesAndEventsView(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24.0, right: 8.0),
        child: FloatingActionButton(
          onPressed: _showAddOpportunityModal, // Placeholder function
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

// Placeholder for the Floating Action Button's onPressed logic
void _showAddOpportunityModal() {
  // Logic to show a modal or navigate to a new screen to add an opportunity
}

// Widget to hold the main content of the page
class OpportunitiesAndEventsView extends StatelessWidget {
  const OpportunitiesAndEventsView({super.key});

  @override
  Widget build(BuildContext context) {
    // --- LIGHT THEME COLORS ---
    const Color cardBackgroundColor = Colors.white;
    const Color lightBackgroundColor = Color(
      0xFFF0F0F0,
    ); // Main body background
    const Color darkTextColor = Colors.black87;
    const Color lightIconColor = Colors.black54;

    return Container(
      color:
          lightBackgroundColor, // Set the background color for the entire body
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Icon (Top Right)
          const Padding(
            padding: EdgeInsets.only(right: 16.0, top: 12.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.search, color: lightIconColor),
            ),
          ),

          // Category Filters (All, Hackathons, Internships, Workshops)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: CategoriesFilter(),
          ),

          // Main Scrollable List of Opportunities
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: const [
                  OpportunityCard(
                    title: 'InnovateAI Hackathon 2024',
                    details:
                        'Join us for a weekend of innovation, coding, and collaboration to build the next generation of AI applications.',
                    location: 'San Francisco, CA',
                    date: 'Ends Oct 25',
                    tags: ['Beginner-Friendly'],
                    isEvent: true,
                    cardBackgroundColor: cardBackgroundColor,
                    darkTextColor: darkTextColor,
                    lightIconColor: lightIconColor,
                  ),
                  SizedBox(height: 16),
                  OpportunityCard(
                    title: 'Software Engineer Intern',
                    details:
                        'Work on cutting-edge projects and gain real-world experience with a dynamic team at Meta.',
                    location: 'Remote',
                    date: 'Deadline: Nov 15',
                    tags: ['Paid', 'Remote'],
                    isEvent: false,
                    cardBackgroundColor: cardBackgroundColor,
                    darkTextColor: darkTextColor,
                    lightIconColor: lightIconColor,
                  ),
                  SizedBox(height: 16),
                  OpportunityCard(
                    title: 'UX Design Workshop',
                    details:
                        'Learn the fundamentals of user-centric design from industry experts at Figma in this interactive workshop.',
                    location: 'Online',
                    date: 'Nov 5',
                    tags: ['Beginner-Friendly'],
                    isEvent: true,
                    cardBackgroundColor: cardBackgroundColor,
                    darkTextColor: darkTextColor,
                    lightIconColor: lightIconColor,
                  ),
                  SizedBox(height: 16),

                  // Placeholder for "No Seminars Found"
                  NoSeminarsFoundCard(
                    cardBackgroundColor: cardBackgroundColor,
                    darkTextColor: darkTextColor,
                    lightIconColor: lightIconColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Reusable UI Components ---

class CategoriesFilter extends StatelessWidget {
  const CategoriesFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          CategoryPill(label: 'All', isSelected: true),
          CategoryPill(label: 'Hackathons', isSelected: false),
          CategoryPill(label: 'Internships', isSelected: false),
          CategoryPill(label: 'Workshops', isSelected: false),
        ],
      ),
    );
  }
}

class CategoryPill extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryPill({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Light theme pill colors
    const Color unselectedPillColor = Color(
      0xFFE0E0E0,
    ); // Light gray for unselected
    const Color selectedTextColor = Colors.white;
    const Color unselectedTextColor = Colors.black87;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? selectedTextColor : unselectedTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        backgroundColor: isSelected ? Colors.blue : unselectedPillColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
      ),
    );
  }
}

class OpportunityCard extends StatelessWidget {
  final String title;
  final String details;
  final String location;
  final String date;
  final List<String> tags;
  final bool isEvent;
  final Color cardBackgroundColor; // Passed in for light theme
  final Color darkTextColor;
  final Color lightIconColor;

  const OpportunityCard({
    super.key,
    required this.title,
    required this.details,
    required this.location,
    required this.date,
    required this.tags,
    required this.isEvent,
    required this.cardBackgroundColor,
    required this.darkTextColor,
    required this.lightIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: darkTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          // Location and Date Row
          Row(
            children: [
              Icon(
                isEvent ? Icons.location_on : Icons.laptop_chromebook,
                size: 14,
                color: lightIconColor,
              ),
              const SizedBox(width: 4),
              Text(
                location,
                style: TextStyle(
                  color: darkTextColor.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.calendar_today, size: 14, color: lightIconColor),
              const SizedBox(width: 4),
              Text(
                date,
                style: TextStyle(
                  color: darkTextColor.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            details,
            style: TextStyle(
              color: darkTextColor.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),

          // Tags and Action Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.bookmark_border, color: lightIconColor, size: 20),
                  const SizedBox(width: 8), // Separator for the bookmark icon
                  ...tags.map(
                    (tag) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TagPill(label: tag),
                    ),
                  ),
                ],
              ),

              // Apply Now / Register Button
              SizedBox(
                height: 36, // Adjust height to match the screenshot look
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                  ),
                  child: Text(
                    isEvent ? 'Register' : 'Apply Now',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TagPill extends StatelessWidget {
  final String label;

  const TagPill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    // Light theme tag colors
    Color tagColor = const Color(
      0xFFC8E6C9,
    ); // Light green for "Beginner-Friendly"
    Color textColor = const Color(0xFF388E3C); // Dark green text

    if (label == 'Paid') {
      tagColor = const Color(0xFFFFF9C4); // Light yellow
      textColor = const Color(0xFFAFB42B); // Dark yellow text
    } else if (label == 'Remote') {
      tagColor = const Color(0xFFBBDEFB); // Light blue
      textColor = const Color(0xFF1976D2); // Dark blue text
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class NoSeminarsFoundCard extends StatelessWidget {
  final Color cardBackgroundColor;
  final Color darkTextColor;
  final Color lightIconColor;

  const NoSeminarsFoundCard({
    super.key,
    required this.cardBackgroundColor,
    required this.darkTextColor,
    required this.lightIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ), // Subtle border for light theme
      ),
      child: Column(
        children: [
          // Calendar Icon with X
          Icon(Icons.calendar_today_outlined, color: lightIconColor, size: 40),
          const SizedBox(height: 12),
          Text(
            'No Seminars Found',
            style: TextStyle(
              color: darkTextColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Try selecting a different event category to find\nnew opportunities.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: darkTextColor.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
