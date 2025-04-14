// // pages/campaign_detail_page.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../utils/app_colors.dart';
// import 'models.dart';

// class CampaignDetailPage extends StatelessWidget {
//   final Campaign campaign = Get.arguments;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(campaign.title, style: TextStyle(color: Colors.white)),
//         backgroundColor: AppColors.mainColor,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ✅ Banner Image
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.network(
//                 campaign.bannerImageUrl,
//                 height: 200,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) => Container(
//                   height: 200,
//                   color: Colors.grey[300],
//                   child: Icon(Icons.image_not_supported),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // ✅ Logo + Title Row
//             Row(
//               children: [
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(campaign.logoUrl),
//                   radius: 24,
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     campaign.title,
//                     style: TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // ✅ Description
//             Text(
//               campaign.description,
//               style: TextStyle(fontSize: 16, color: Colors.grey[800]),
//               textAlign: TextAlign.justify,
//             ),

//             const Divider(height: 30),

//             // ✅ Campaign Details
//             _buildDetailItem('Platform', campaign.platform),
//             _buildDetailItem('Start Date', campaign.startDate),
//             _buildDetailItem('End Date', campaign.endDate),
//             _buildDetailItem('Engagement', campaign.engagement),
//             _buildDetailItem('Payment', campaign.payment),

//             const SizedBox(height: 20),

//             // ✅ Countdown Timer Placeholder
//             Container(
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.orange[50],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Countdown Timer",
//                       style: TextStyle(color: Colors.orange[800])),
//                   Text("12:34:56",
//                       style: TextStyle(color: Colors.orange[800])), // Dummy
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✅ Detail Rows
//   Widget _buildDetailItem(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
//           Expanded(child: Text(value))
//         ],
//       ),
//     );
//   }
// }
// pages/campaign_detail_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import 'models.dart';

class CampaignDetailPage extends StatelessWidget {
  final Campaign campaign = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(campaign.title, style: TextStyle(color: Colors.black)),
        actions: [
          Row(
            children: [
              Icon(Icons.lock_clock_rounded, color: Colors.black),
              SizedBox(width: 4),
              Text("12:34:56", style: TextStyle(color: Colors.black)),
              SizedBox(width: 12),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                campaign.bannerImageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // Brand Logo + Title + Subtitle
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(campaign.logoUrl),
                  radius: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(campaign.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(
                        campaign.subtitle,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700]),
                      ),
                      SizedBox(height: 4),
                      Text(
                        campaign.payment,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Description
            Text(
              campaign.description,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Extra Info (paragraph, unique)
            Text(
              campaign.extraInfo,
              style: TextStyle(fontSize: 13.5, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),

            // Deadline
            _buildDetailItem("Deadline", campaign.endDate),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Row(
      children: [
        Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
        Expanded(child: Text(value)),
      ],
    );
  }
}
