import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:om_dixit_portfolio/models/project_model.dart';
import 'package:om_dixit_portfolio/consts/data.dart'; // To access the projects list
import 'package:url_launcher/url_launcher.dart';
// import 'package:video_player/video_player.dart'; // Will be used later for video playback

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  // VideoPlayerController? _controller;
  // Future<void>? _initializeVideoPlayerFuture;

  // @override
  // void dispose() {
  //   _controller?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          ProjectModel project = projects[index];
          return Card(
            color: const Color(0xFF1E1E1E), // Dark card background
            margin: const EdgeInsets.symmetric(vertical: 12.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.75),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Technologies:",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: project.technologies.map((tech) {
                      return Chip(
                        label: Text(tech,
                            style: GoogleFonts.openSans(
                                fontSize: 12, color: Colors.white70)),
                        backgroundColor: Colors.grey[800],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Key Features/Achievements:",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 4),
                  ...project.bulletPoints.map((point) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, right: 8.0),
                            child: Icon(Icons.arrow_forward_ios,
                                size: 10, color: Colors.white54),
                          ),
                          Expanded(
                            child: Text(
                              point,
                              style: GoogleFonts.openSans(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.8),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),

                  // GitHub Links Section
                  if (project.githubLink != null ||
                      project.frontendGithubLink != null ||
                      project.backendGithubLink != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Source Code:",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 12.0,
                            runSpacing: 8.0,
                            children: [
                              if (project.githubLink != null)
                                _buildGitHubButton(
                                  "GitHub",
                                  project.githubLink!,
                                  Icons.code,
                                  const Color(0xFF64FFDA),
                                ),
                              if (project.frontendGithubLink != null)
                                _buildGitHubButton(
                                  "Frontend",
                                  project.frontendGithubLink!,
                                  Icons.web,
                                  const Color(0xFF82B1FF),
                                ),
                              if (project.backendGithubLink != null)
                                _buildGitHubButton(
                                  "Backend",
                                  project.backendGithubLink!,
                                  Icons.storage,
                                  const Color(0xFF4FC3F7),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  if (project.videoAssetPath != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.play_circle_filled),
                          label: const Text("Watch Demo Video"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary, // Or your accent color
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // Video playback logic will be added here
                            // For now, maybe just print the path
                            print("Play video: ${project.videoAssetPath}");
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGitHubButton(
      String label, String url, IconData icon, Color color) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        side: BorderSide(color: color.withOpacity(0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      onPressed: () => _launchUrl(url),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
