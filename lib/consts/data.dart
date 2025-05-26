import 'package:awesome_portfolio/models/app_model.dart';
import 'package:awesome_portfolio/models/color_model.dart';
import 'package:awesome_portfolio/models/device_model.dart';
import 'package:awesome_portfolio/screen/miniProjects/education/education.dart';
import 'package:awesome_portfolio/screen/miniProjects/experience/experience.dart';
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
    assetPath: "assets/icons/about.svg",
    screen: const AboutMe(),
  ),
  AppModel(
    title: "Skills",
    color: Colors.white,
    assetPath: "assets/icons/skills.svg",
    screen: const Skills(),
  ),
  // AppModel(
  //   title: "Youtube",
  //   assetPath: "assets/icons/youtube.svg",
  //   color: Colors.white,
  //   link: youtubeChannel,
  // ),
  AppModel(
    title: "LinkedIn",
    assetPath: "assets/icons/linkedin.svg",
    color: Colors.white,
    link: linkedIn,
  ),
  AppModel(
    title: "X",
    assetPath: "assets/icons/twitter.svg",
    color: Colors.white,
    link: twitter,
  ),
  // AppModel(
  //   title: "Topmate",
  //   assetPath: "assets/icons/topMate.png",
  //   color: Colors.white,
  //   link: topMate,
  // ),
  AppModel(
      title: "Experience",
      color: Colors.white,
      assetPath: "assets/icons/experience.svg",
      screen: const Experience()),
  AppModel(
    title: "Education",
    color: Colors.white,
    assetPath: "assets/icons/education.svg",
    screen: const Education(),
  ),
  AppModel(
    title: "Github",
    assetPath: "assets/icons/github.svg",
    color: Colors.white,
    link: github,
  ),
  // AppModel(
  //   title: "Play Store",
  //   assetPath: "assets/icons/playstore.svg",
  //   color: Colors.white,
  //   link: playApps,
  // ),
  AppModel(
    title: "CP Profile",
    color: Colors.white,
    assetPath: "assets/icons/cp_profile.svg",
    screen: const CpProfileScreen(),
  ),
  // AppModel(
  //   title: "Codeforces",
  //   assetPath: "assets/icons/codeforces.svg",
  //   color: Colors.white,
  //   link: codeforcesLink,
  // ),
  // AppModel(
  //   title: "LeetCode",
  //   assetPath: "assets/icons/leetcode.svg",
  //   color: Colors.white,
  //   link: leetcodeLink,
  // ),
];

final List<JobExperience> education = [
  JobExperience(
    color: Colors.red,
    location: "Patiala, India",
    title: 'Computer Engineering',
    company: 'Thapar Institure of Engineering',
    startDate: 'June 2021',
    endDate: 'Present',
    bulletPoints: [
      "Currently in the final year of my college!",
    ],
  ),
  JobExperience(
    color: Colors.blue,
    location: "Patiala, India",
    title: 'Diploma in Computer Science',
    company: 'Thapar Polytechnic College',
    startDate: 'June 2018',
    endDate: 'June 2021',
    bulletPoints: [
      'Some of the best years of college life',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.blue,
    location: "Banglore, India",
    title: 'Full Stack Developer',
    company: 'Stimuler',
    startDate: 'Feb 2023',
    endDate: 'Present',
    bulletPoints: [
      "Actively develop and manage push notifications to engage users effectively.",
      "Successfully set up in-app purchase functionality for both iOS and Android platforms.",
      "Utilize the Provider package for streamlined state management and implement real-time data streams.",
      "Employ Amplitude and Firebase Analytics to track and analyze user behavior, informing data-driven decisions.",
      "The Startup has over 3,00,000 lakh active users",
    ],
  ),
  // Add more job experiences here...
  JobExperience(
    color: Colors.redAccent,
    location: "Remote",
    title: 'Flutter Developer',
    company: 'Perpetuum India',
    startDate: 'Oct 2022',
    endDate: 'Jan 2023',
    bulletPoints: [
      "Establish voice calling functionality using Agora SDK to enable real-time communication within the app.",
      "Implement intricate animations using Rive, enhancing the app's visual appeal and engagement.",
      "Collaborate directly with Stanza Living's CTO, gaining insights into industry best practices and cutting-edge technologies.",
      "Acquire proficiency in server-driven UI setup, optimizing app flexibility and scalability through dynamic configuration.",
    ],
  ),
  JobExperience(
    color: Colors.orangeAccent,
    location: "Remote",
    title: 'App Architecture Intern',
    company: 'Habeato',
    startDate: 'Oct 2021',
    endDate: 'Nov 2021',
    bulletPoints: [
      "Collaborated with founders to develop a HealthifyMe clone, demonstrating strong teamwork and app development skills.",
      "Engineered complex animations to enhance user experience and app visual appeal.",
      "Played an active role in system design processes, contributing to efficient and scalable app architecture.",
    ],
  ),
  JobExperience(
    color: Colors.greenAccent,
    location: "Remote",
    title: 'App Developer',
    company: 'Kylo Apps',
    startDate: 'Sep 2021',
    endDate: 'Oct 2021',
    bulletPoints: [
      "Collaborated as a team member in developing a cryptocurrency wallet, akin to Trust Wallet, showcasing strong teamwork and blockchain app development expertise.",
      "Proficiently integrated REST APIs into the application, enhancing its functionality and connectivity with external services."
    ],
  ),
  JobExperience(
    color: Colors.black,
    location: "Remote",
    title: 'Flutter App Intern',
    company: 'Cogent Web Services',
    startDate: 'Dec 2020',
    endDate: 'June 2021',
    bulletPoints: [
      "Independently developed a Life Simulator game using Flutter from scratch, applying state-of-the-art state management practices to ensure a top-tier user experience.",
      "Leveraged Flutter's robust features to craft an immersive and captivating gameplay experience, demonstrating proficiency in app development.",
      "Successfully implemented Google Ads, in-app purchases, and Hive database for efficient user data storage and monetization strategies.",
      "Generated creative ideas for client pitches, fostering creativity and ensuring the game's entertainment value and thought-provoking nature.",
      "Published the game on the Play Store, achieving over 5,000 downloads, showcasing the ability to deliver a popular and engaging mobile application.",
    ],
  ),
];

const String youtubeChannel = "https://www.youtube.com/@omdixit";
const String linkedIn = "https://www.linkedin.com/in/om-dixit/";
const String github = "https://github.com/omdixit2107";
const String twitter = "https://twitter.com/omdixit2107";
const String topMate = "https://topmate.io/omdixit";
const String resumeLink = "https://drive.google.com/file/d/your-resume-id/view";
const String email = "omdixit@gmail.com";
const String codeforcesLink = "https://codeforces.com/profile/om_dixit";
const String leetcodeLink = "https://leetcode.com/omdixit";
String introduction =
    "Hello! I'm Om Dixit, a passionate Competitive Programmer and Full Stack Developer with expertise in data structures, algorithms, and modern web technologies.\n\nI love solving complex problems and have participated in numerous coding contests. When I'm not coding competitive programming problems, I enjoy building innovative web applications and contributing to open-source projects.\n\nMy goal is to combine my problem-solving skills from competitive programming with practical software development to create efficient and scalable solutions.";
const String playApps =
    "https://play.google.com/store/apps/developer?id=AppyMonk";
// const String codeforcesLink = "YOUR_CODEFORCES_PROFILE_URL";
// const String leetcodeLink = "YOUR_LEETCODE_PROFILE_URL";

List<SkillsModel> skills = [
  SkillsModel(skillName: "C++", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(skillName: "Python", colorS: Colors.green),
  SkillsModel(skillName: "Java", colorS: Colors.orange),
  SkillsModel(skillName: "Data Structures", colorS: Colors.purple),
  SkillsModel(skillName: "Algorithms", colorS: Colors.red),
  SkillsModel(skillName: "Problem Solving", colorS: Colors.teal),
  SkillsModel(skillName: "Dynamic Programming", colorS: Colors.indigo),
  SkillsModel(skillName: "Graph Theory", colorS: Colors.cyan),
  SkillsModel(skillName: "Flutter", colorS: Colors.blue),
  SkillsModel(skillName: "React", colorS: Colors.lightBlue),
  SkillsModel(skillName: "Node.js", colorS: Colors.green),
  SkillsModel(skillName: "MongoDB", colorS: Colors.green),
  SkillsModel(skillName: "Firebase", colorS: Colors.yellow),
  SkillsModel(skillName: "Git", colorS: Colors.black),
  SkillsModel(skillName: "Docker", colorS: Colors.blue),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "CI/CD",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "Code Magic",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.yellow,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.yellow,
  ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Punjabi", colorS: Colors.orange),
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
];
