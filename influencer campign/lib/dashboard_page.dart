import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';
import '../utils/responsive_widget.dart';
import 'dashboard_controller.dart';
import 'models.dart';

class CampaignPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildDashboard(context),
      tablet: _buildDashboard(context),
      desktop: _buildDashboard(context),
    );
  }

  Widget _buildDashboard(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Campaign",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: [
              Tab(text: 'Invites'),
              Tab(text: 'Ongoing'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                onChanged: controller.updateSearch,
                decoration: InputDecoration(
                  hintText: 'Search campaigns...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Obx(() => _buildCampaignList(controller.invites)),
                  Obx(() => _buildCampaignList(controller.ongoing)),
                  Obx(() =>
                      _buildCampaignList(controller.history, isHistory: true)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignList(List<Campaign> campaigns,
      {bool isHistory = false}) {
    if (campaigns.isEmpty) {
      return Center(child: Text('No campaigns found.'));
    }

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: campaigns.length,
      itemBuilder: (context, index) {
        final campaign = campaigns[index];
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            onTap: () => controller.navigateToDetail(campaign),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(campaign.logoUrl),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              campaign.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              campaign.payment,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                      isHistory
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : GestureDetector(
                              onTap: () => controller.markAsCompleted(campaign),
                              child: Icon(Icons.check_box_outline_blank,
                                  color: AppColors.mainColor),
                            ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(campaign.description),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "12:44:30 left", // Placeholder for timer
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
