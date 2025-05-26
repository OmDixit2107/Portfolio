class ProjectModel {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> bulletPoints;
  final String? videoAssetPath; // e.g., 'assets/videos/project_demo.mp4'
  final String? githubLink; // For single repo projects
  final String? frontendGithubLink; // For frontend repo
  final String? backendGithubLink; // For backend repo
  // final String? thumbnailAssetPath; // Optional: for a preview image before video loads

  ProjectModel({
    required this.title,
    required this.description,
    required this.technologies,
    required this.bulletPoints,
    this.videoAssetPath,
    this.githubLink,
    this.frontendGithubLink,
    this.backendGithubLink,
    // this.thumbnailAssetPath,
  });
}
