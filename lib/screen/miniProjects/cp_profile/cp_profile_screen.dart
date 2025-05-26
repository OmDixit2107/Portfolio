import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CpProfileScreen extends StatelessWidget {
  const CpProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(
                Icons.emoji_events,
                size: 80,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Competitive Programming Profile",
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Platforms Section
            _buildPlatformCard(
              "Codeforces",
              "Expert Rating: 1600+",
              "Solved 500+ problems",
              Icons.code,
              Colors.blue,
              "https://codeforces.com/profile/omdixit2107",
            ),
            const SizedBox(height: 20),

            _buildPlatformCard(
              "LeetCode",
              "Knight Rating: 1800+",
              "Solved 300+ problems",
              Icons.psychology,
              Colors.orange,
              "https://leetcode.com/omdixit2107",
            ),
            const SizedBox(height: 20),

            _buildPlatformCard(
              "CodeChef",
              "4-Star (Rating: 1850+)",
              "Regular contest participant",
              Icons.restaurant,
              Colors.brown,
              "https://codechef.com/users/omdixit2107",
            ),
            const SizedBox(height: 30),

            // Skills Section
            Text(
              "Problem Solving Skills",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildSkillChip("Dynamic Programming", Colors.purple),
                _buildSkillChip("Graph Algorithms", Colors.cyan),
                _buildSkillChip("Data Structures", Colors.green),
                _buildSkillChip("Number Theory", Colors.red),
                _buildSkillChip("Greedy Algorithms", Colors.orange),
                _buildSkillChip("Binary Search", Colors.blue),
                _buildSkillChip("Tree Algorithms", Colors.teal),
                _buildSkillChip("String Algorithms", Colors.indigo),
              ],
            ),

            const SizedBox(height: 30),

            // Achievements Section
            Text(
              "Achievements",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            _buildAchievementItem(
                "🏆", "Top 5% in multiple Codeforces contests"),
            _buildAchievementItem(
                "⭐", "Solved 1000+ competitive programming problems"),
            _buildAchievementItem(
                "🥇", "Winner in local programming competitions"),
            _buildAchievementItem(
                "📈", "Consistent rating improvement across platforms"),
          ],
        ),
      ),
    );
  }

  Widget _buildPlatformCard(
    String platform,
    String rating,
    String problems,
    IconData icon,
    Color color,
    String url,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  rating,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  problems,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _launchURL(url),
            icon: const Icon(Icons.open_in_new),
            color: color,
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildAchievementItem(String emoji, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
