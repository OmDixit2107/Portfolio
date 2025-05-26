import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../consts/data.dart';

class Skills extends StatefulWidget {
  const Skills({super.key});

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> with TickerProviderStateMixin {
  late AnimationController _headerController;
  late Animation<double> _headerAnimation;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _headerAnimation = CurvedAnimation(
      parent: _headerController,
      curve: Curves.elasticOut,
    );
    _headerController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  // Categorize skills based on your resume
  List<Map<String, dynamic>> get skillCategories {
    return [
      {
        'title': 'Programming Languages',
        'icon': Icons.code,
        'skills': skills
            .where((skill) => ['C++', 'Python', 'Java', 'Dart', 'SQL']
                .contains(skill.skillName))
            .toList(),
        'color': const Color(0xFF64FFDA),
      },
      {
        'title': 'Mobile Development',
        'icon': Icons.smartphone,
        'skills': skills
            .where((skill) =>
                ['Flutter', 'Android Studio', 'Jira'].contains(skill.skillName))
            .toList(),
        'color': const Color(0xFF82B1FF),
      },
      {
        'title': 'Web & Frameworks',
        'icon': Icons.web,
        'skills': skills
            .where((skill) => [
                  'Spring Boot',
                  'Spring Security',
                  'Spring JPA',
                  'Hibernate',
                  'Express.js'
                ].contains(skill.skillName))
            .toList(),
        'color': const Color(0xFF4FC3F7),
      },
      {
        'title': 'Databases & Backend',
        'icon': Icons.storage,
        'skills': skills
            .where((skill) =>
                ['MySQL', 'Supabase', 'Firebase'].contains(skill.skillName))
            .toList(),
        'color': const Color(0xFF81C784),
      },
      {
        'title': 'Tools & Technologies',
        'icon': Icons.build,
        'skills': skills
            .where((skill) => ['Git', 'GitHub', 'WebSocket', 'RESTful APIs']
                .contains(skill.skillName))
            .toList(),
        'color': const Color(0xFFFFB74D),
      },
      {
        'title': 'Competitive Programming',
        'icon': Icons.emoji_events,
        'skills': skills
            .where((skill) => [
                  'Data Structures',
                  'Algorithms',
                  'Problem Solving',
                  'Dynamic Programming',
                  'Graph Theory'
                ].contains(skill.skillName))
            .toList(),
        'color': const Color(0xFFBA68C8),
      },
      {
        'title': 'State Management',
        'icon': Icons.settings,
        'skills': skills
            .where((skill) => ['Provider', 'Bloc'].contains(skill.skillName))
            .toList(),
        'color': const Color(0xFFFF8A65),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // Enhanced Header
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // Animated header section
                  AnimatedBuilder(
                    animation: _headerAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _headerAnimation.value,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF64FFDA),
                                Color(0xFF82B1FF),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF64FFDA).withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.psychology,
                                size: 60,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                "Technical Skills",
                                style: GoogleFonts.exo(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Technologies & Expertise",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          // Skills Categories
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final category = skillCategories[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: _buildSkillCategory(category, index),
                )
                    .animate(delay: Duration(milliseconds: 200 * (index + 1)))
                    .slideX(begin: 1, duration: 600.ms)
                    .fadeIn();
              },
              childCount: skillCategories.length,
            ),
          ),

          // Languages Section
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              child: _buildLanguagesSection(),
            )
                .animate(
                    delay: Duration(
                        milliseconds: 200 * (skillCategories.length + 1)))
                .slideX(begin: 1, duration: 600.ms)
                .fadeIn(),
          ),

          // Bottom spacing
          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(Map<String, dynamic> category, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E1E1E),
            const Color(0xFF2A2A2A),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: category['color'].withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          initiallyExpanded: index < 3, // Expand first 3 categories by default
          collapsedIconColor: Colors.white70,
          iconColor: category['color'],
          tilePadding: const EdgeInsets.all(20.0),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: category['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: category['color'].withOpacity(0.3),
              ),
            ),
            child: Icon(
              category['icon'],
              color: category['color'],
              size: 24,
            ),
          ),
          title: Text(
            category['title'],
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              '${category['skills'].length} skills',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 12.0,
                children: category['skills'].map<Widget>((skill) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          skill.colorS.withOpacity(0.1),
                          skill.colorS.withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: skill.colorS.withOpacity(0.3),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: skill.colorS.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      skill.skillName,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E1E1E),
            const Color(0xFF2A2A2A),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF64FFDA).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF64FFDA).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF64FFDA).withOpacity(0.3),
                  ),
                ),
                child: Icon(
                  Icons.language,
                  color: const Color(0xFF64FFDA),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "Languages",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 12.0,
            runSpacing: 12.0,
            children: languages.map<Widget>((language) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      language.colorS.withOpacity(0.1),
                      language.colorS.withOpacity(0.05),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: language.colorS.withOpacity(0.3),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: language.colorS.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  language.skillName,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
