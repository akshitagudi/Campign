// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:influencercampign/dashboard_page.dart';

// import 'campign_detail_page.dart';
// import 'login_page.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue),
//       initialRoute: '/dashboard',
//       getPages: [
//         GetPage(name: '/login', page: () => const LoginPage()),
//         GetPage(name: '/dashboard', page: () => CampaignPage()),
//         GetPage(
//             name: '/campaignDetail',
//             page: () => CampaignDetailPage()), // ✅ ADD THIS
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'campign_detail_page.dart';
import 'home.dart';
import 'login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/campaignDetail', page: () => CampaignDetailPage()),
      ],
    );
  }
}
