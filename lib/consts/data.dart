import 'package:awesome_portfolio/models/app_model.dart';
import 'package:awesome_portfolio/models/color_model.dart';
import 'package:awesome_portfolio/models/device_model.dart';
import 'package:awesome_portfolio/models/project_model.dart';
import 'package:awesome_portfolio/screen/miniProjects/education/education.dart';
import 'package:awesome_portfolio/screen/miniProjects/experience/experience.dart';
import 'package:awesome_portfolio/screen/miniProjects/projects/projects_screen.dart';
import 'package:awesome_portfolio/screen/miniProjects/resume/resume_screen.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../screen/miniProjects/about/about.dart';
import '../screen/miniProjects/cp_profile/cp_profile_screen.dart';
import '../screen/miniProjects/skills/skills.dart';

const double baseHeight = 790;
const double baseWidth = 1440;

List<DeviceModel> devices = [
  DeviceModel(
    device: Devices.ios.iPhone13,
    icon: Icons.apple,
  ),
];

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF1a1a1a),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF0D1117), // Very dark gray-black
        Color(0xFF161B22), // Slightly lighter dark
        Color(0xFF21262D), // Medium dark
      ],
      stops: [0.0, 0.5, 1.0],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF2d1b69),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF0F0F23), // Very dark navy
        Color(0xFF1A1A2E), // Dark navy-purple
        Color(0xFF16213E), // Slightly lighter navy
      ],
      stops: [0.0, 0.6, 1.0],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF1e3c72),
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFF000000), // Pure black
        Color(0xFF1C1C1C), // Very dark gray
        Color(0xFF2C2C2C), // Dark gray
      ],
      stops: [0.0, 0.4, 1.0],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF1a1a2e),
    gradient: const LinearGradient(
      colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
      stops: [0, 1],
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF0f3460),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF0f3460), Color(0xFF16213e)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF2c1810),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF2c1810), Color(0xFF0c0c0c)],
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF4a148c),
    gradient: const LinearGradient(
      colors: [Color(0xFF4a148c), Color(0xFF1a1a1a)],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  ColorModel(
    svgPath: "assets/images/cloudyBlue.svg",
    color: const Color(0xFF263238),
    gradient: const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Color(0xFF263238), Color(0xFF37474f)],
    ),
  ),
];

List<AppModel> apps = [
  AppModel(
    title: "About",
    color: Colors.white,
    assetPath: "assets/icons/about.png",
    screen: const AboutMe(),
  ),
  AppModel(
    title: "Skills",
    color: Colors.white,
    icon: Icons.psychology,
    assetPath: null,
    screen: const Skills(),
  ),
  // AppModel(
  //   title: "Resume",
  //   color: Colors.white,
  //   icon: Icons.description,
  //   assetPath: null,
  //   screen: const ResumeScreen(),
  // ),
  AppModel(
    title: "Projects",
    color: Colors.white,
    icon: Icons.construction,
    assetPath: null,
    screen: const ProjectsScreen(),
  ),
  AppModel(
    title: "LinkedIn",
    color: Colors.white,
    assetPath: "assets/icons/LinkedIn.png",
    link: linkedIn,
  ),
  AppModel(
    title: "X",
    color: Colors.white,
    assetPath: "assets/icons/x.png",
    link: twitter,
  ),
  AppModel(
    title: "Experience",
    color: Colors.white,
    icon: Icons.work_history,
    assetPath: null,
    screen: const Experience(),
  ),
  AppModel(
    title: "Education",
    color: Colors.white,
    icon: Icons.school,
    assetPath: null,
    screen: const Education(),
  ),
  AppModel(
    title: "Github",
    color: Colors.white,
    assetPath: "assets/icons/GitHub.png",
    link: github,
  ),
  AppModel(
    title: "CP Profile",
    color: Colors.white,
    icon: null,
    assetPath: "assets/icons/codeforces.png",
    screen: const CpProfileScreen(),
  ),
  // AppModel(
  //   title: "Education",
  //   color: Colors.white,
  //   assetPath: "assets/icons/education.svg",
  //   screen: const Education(),
  // ),
  // AppModel(
  //   title: "Github",
  //   assetPath: "assets/icons/github.svg",
  //   color: Colors.white,
  //   link: github,
  // ),
  // AppModel(
  //   title: "CP Profile",
  //   color: Colors.white,
  //   assetPath: "assets/icons/cp_profile.svg",
  //   screen: const CpProfileScreen(),
  // ),
];

// New list for projects
List<ProjectModel> projects = [
  ProjectModel(
    title: "HomeSphere",
    description:
        "A full-stack real estate platform with Spring Boot backend and Flutter frontend, implementing RESTful APIs for property management and authentication.",
    technologies: [
      "Flutter",
      "Dart",
      "Provider",
      "Java",
      "Spring Boot",
      "WebSocket",
      "MySQL",
      "RESTful APIs"
    ],
    bulletPoints: [
      "Architected a full-stack real estate platform with Spring Boot backend and Flutter frontend, implementing RESTful APIs for property management and authentication.",
      "Developed real-time chat functionality using WebSocket (STOMP protocol).",
      "Created a robust image upload system using multipart form data handling.",
      "Integrated Provider state management for real-time UI updates and improved consistency."
    ],
    videoAssetPath: null,
    frontendGithubLink: "https://github.com/OmDixit2107/HomeSphere_Frontend",
    backendGithubLink: "https://github.com/OmDixit2107/HomeSphere_Backend",
  ),
  ProjectModel(
    title: "Flinder",
    description:
        "A modern Flutter application with real-time messaging capabilities and advanced state management.",
    technologies: [
      "Flutter",
      "Supabase",
      "Realtime Messaging",
      "Provider",
      "Dart"
    ],
    bulletPoints: [
      "Developed real-time chat functionality using Supabase realtime features.",
      "Implemented user authentication and profile management system.",
      "Created responsive UI with modern design patterns and smooth animations.",
      "Integrated Provider state management for efficient data flow and state handling."
    ],
    videoAssetPath: null,
    githubLink: "https://github.com/OmDixit2107/Flinder",
  ),
  // ProjectModel(
  //   title: "Quiz App",
  //   description:
  //       "Integrated Supabase Realtime for dynamic updates and Express.js as a messaging mediator.",
  //   technologies: ["Flutter", "Express.js", "Android Studio", "Jira"],
  //   bulletPoints: [
  //     "Designed group formation logic, enhancing compatibility-based decision-making.",
  //     "Integrated Supabase Realtime for dynamic updates and Express.js as a messaging mediator.",
  //     "Designed group formation logic, enhancing compatibility-based decision-making."
  //   ],
  //   videoAssetPath: null,
  // ),
  // ProjectModel(
  //   title: "Weather App",
  //   description:
  //       "Integrated Provider state management for real-time UI updates and improved consistency.",
  //   technologies: [
  //     "Flutter",
  //     "Dart",
  //     "Provider",
  //     "Java",
  //     "Spring Boot",
  //     "WebSocket",
  //     "MySQL"
  //   ],
  //   bulletPoints: [
  //     "Integrated Provider state management for real-time UI updates and improved consistency.",
  //     "Developed real-time chat functionality using WebSocket (STOMP protocol).",
  //     "Created a robust image upload system using multipart form data handling."
  //   ],
  //   videoAssetPath: null,
  // ),
];

final List<JobExperience> education = [
  JobExperience(
    color: const Color(0xFF64FFDA),
    location: "Gandhinagar, Gujarat, India",
    title: 'Bachelor of Technology in Computer Science And Engineering',
    company: 'Indian Institute Of Information Technology Vadodara',
    startDate: 'August 2023',
    endDate: 'June 2027',
    bulletPoints: [
      "CGPA: 9.34 - Pursuing Bachelor's degree in Computer Science and Engineering",
      "Focusing on advanced algorithms, data structures, and software engineering principles",
      "Active participant in competitive programming contests and technical societies",
      "Engaged in cutting-edge research projects and collaborative learning initiatives",
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: const Color(0xFF64FFDA),
    location: "Remote",
    title: 'Mobile Developer Intern',
    company: 'FadFocus',
    startDate: 'April 2025',
    endDate: 'Present',
    bulletPoints: [
      "Developed and integrated complete mobile and backend system, implementing backend logic in PHP and Laravel",
      "Designed and implemented easy application screens including Terms and Conditions, Privacy Policy and other static content pages using Figma wireframes",
      "Collaborated in testing, identifying and fixing UI/UX bugs to enhance app stability and performance across devices",
      "Implemented real-time data synchronization using Supabase, enhancing cross-device consistency and improving app performance by reducing loading times and user experience by 30%",
    ],
  ),
  JobExperience(
    color: const Color(0xFF82B1FF),
    location: "Remote",
    title: 'Flutter Developer Intern',
    company: 'Kenesis',
    startDate: 'February 2025',
    endDate: 'March 2025',
    bulletPoints: [
      "Built and optimized calendar-based features with event creation, reminders, and recurring events using Flutter, Bloc for state management, and designed architecture with Figma for enhanced user engagement, resulting in a 25% improvement in task completion rate",
      "Implemented real-time data synchronization using Supabase, enhancing cross-device consistency",
      "Improved app performance by reducing loading times and enhancing user experience by 30%",
    ],
  ),
];

const String linkedIn = "https://www.linkedin.com/in/om-dixit-8b08a6280/";
const String github = "https://github.com/omdixit2107";
const String twitter = "https://twitter.com/omdixit2107";
const String resumeLink =
    "https://drive.google.com/file/d/1FiLnmJJ2FJu9jgBYdHquqA86yfg7hnWK/view?usp=sharing";
const String email = "omdixit2107@gmail.com";
const String codeforcesLink = "https://codeforces.com/profile/omdixit2107";
const String leetcodeLink = "https://leetcode.com/omdixit2107";
String introduction =
    "Hello! I'm Om Dixit, a passionate Competitive Programmer and Full Stack Developer with expertise in data structures, algorithms, and modern web technologies.\n\nI love solving complex problems and have participated in numerous coding contests. When I'm not coding competitive programming problems, I enjoy building innovative web applications and contributing to open-source projects.\n\nMy goal is to combine my problem-solving skills from competitive programming with practical software development to create efficient and scalable solutions.";
const String playApps =
    "https://play.google.com/store/apps/developer?id=AppyMonk";

List<SkillsModel> skills = [
  // Programming Languages
  SkillsModel(
      skillName: "C++", colorS: const Color(0xFF00599C), iconPath: "random"),
  SkillsModel(skillName: "Python", colorS: const Color(0xFF3776AB)),
  SkillsModel(skillName: "Java", colorS: const Color(0xFFED8B00)),
  SkillsModel(skillName: "Dart", colorS: const Color(0xFF0175C2)),
  SkillsModel(skillName: "SQL", colorS: const Color(0xFF336791)),

  // Mobile Development
  SkillsModel(skillName: "Flutter", colorS: const Color(0xFF02569B)),
  SkillsModel(skillName: "Android Studio", colorS: const Color(0xFF3DDC84)),
  SkillsModel(skillName: "Jira", colorS: const Color(0xFF0052CC)),

  // Web Development and Frameworks
  SkillsModel(skillName: "Spring Boot", colorS: const Color(0xFF6DB33F)),
  SkillsModel(skillName: "Spring Security", colorS: const Color(0xFF6DB33F)),
  SkillsModel(skillName: "Spring JPA", colorS: const Color(0xFF6DB33F)),
  SkillsModel(skillName: "Hibernate", colorS: const Color(0xFF59666C)),
  // SkillsModel(skillName: "Express.js", colorS: const Color(0xFF000000)),

  // Databases
  SkillsModel(skillName: "MySQL", colorS: const Color(0xFF4479A1)),
  SkillsModel(skillName: "Supabase", colorS: const Color(0xFF3ECF8E)),
  SkillsModel(skillName: "Firebase", colorS: const Color(0xFFFFCA28)),

  // Tools and Technologies
  SkillsModel(skillName: "Git", colorS: const Color(0xFFF05032)),
  SkillsModel(skillName: "GitHub", colorS: const Color(0xFF181717)),
  SkillsModel(skillName: "WebSocket", colorS: const Color(0xFF010101)),
  SkillsModel(skillName: "RESTful APIs", colorS: const Color(0xFF25D366)),

  // Competitive Programming
  SkillsModel(skillName: "Data Structures", colorS: const Color(0xFF673AB7)),
  SkillsModel(skillName: "Algorithms", colorS: const Color(0xFFE91E63)),
  SkillsModel(skillName: "Problem Solving", colorS: const Color(0xFF009688)),
  SkillsModel(
      skillName: "Dynamic Programming", colorS: const Color(0xFF3F51B5)),
  SkillsModel(skillName: "Graph Theory", colorS: const Color(0xFF00BCD4)),

  // State Management
  SkillsModel(skillName: "Provider", colorS: const Color(0xFFFF9800)),
  SkillsModel(skillName: "Bloc", colorS: const Color(0xFF2196F3)),
];

List<SkillsModel> languages = [
  // SkillsModel(skillName: "Punjabi", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
