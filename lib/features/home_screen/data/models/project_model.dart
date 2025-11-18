// Simple model
class Project {
  final String title;
  final String subtitle;
  final String url;
  final String assetImage; // optional

  Project({
    required this.title,
    required this.subtitle,
    required this.url,
    required this.assetImage,
  });
}

final List<Project> projects = [
  Project(
    title: 'Tovozo',
    subtitle:
        'Live hotel location with Google Maps API, in-app messaging via WebSocket, push notifications, real-time tracking.',
    url: 'https://apps.apple.com/nl/app/tovozo/id6749312196',
    assetImage: 'assets/skill/tovozo.png',
  ),
  Project(
    title: 'Ramadan 2025',
    subtitle:
        'Daily prayer times with calculation API, Sahri & Iftar countdown timer, smart reminders and push notifications, fasting tracker with calendar view, daily Quran verse & duas.',
    url:
        'https://github.com/rifathasanpriyo/ramadan_2025/tree/main/ramadan_2025',
    assetImage: 'assets/skill/ramadan 2025.png',
  ),
  Project(
    title: 'Polytech',
    subtitle:
        'Attendance tracking, report overview, SaaS model for multiple schools.',
    url: 'https://apps.apple.com/il/app/polytech/id6751885503',
    assetImage: 'assets/skill/polytech.png',
  ),
  Project(
    title: 'Lets Fly Bd',
    subtitle:
        'Flight search & booking, ticket & visa booking, push notifications, and more.',
    url: 'https://apps.apple.com/ru/app/lets-fly-bd/id6746708508?l=en-GB',
    assetImage: 'assets/skill/lets fly bd.png',
  ),
  Project(
    title: 'Tijarah',
    subtitle:
        ' Money management, sales & vendor reports, monthly/yearly sales tracking.',
    url:
        'https://play.google.com/store/apps/details?id=com.ragory.tijarah.software&hl=en',
    assetImage: 'assets/skill/Tijarah.png',
  ),
  Project(
    title: 'Hosen Academy',
    subtitle:
        ' Online course video streaming, bKash payment integration for secure checkout, user dashboard with progress tracking, instant course unlocking after verified payment, push notifications, and admin-controlled course management.',
    url:
        'https://play.google.com/store/apps/details?id=com.hosenacademyapp2026.name&hl=en',
    assetImage: 'assets/skill/hosen academy.png',
  ),
];
