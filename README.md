# Campign
**Influencer Campaign Dashboard - Flutter App**
This project is a Flutter-based mobile application designed as an assignment for Echio. The app replicates a campaign dashboard for influencers to manage their collaborations with brands. It includes a clean UI, proper state management, and detail navigation for each campaign.

Overview
The application allows influencers to:

View invited, ongoing, and completed (history) campaigns.

Search campaigns using keywords.

View detailed information of each campaign.

Mark campaigns as completed.

Navigate seamlessly through different screens using GetX.

Access a detailed campaign view with brand logos, banners, titles, subtitles, descriptions, payment details, deadline, and additional notes.

Features
Login page with basic validation and static credentials.

Tab-based layout for campaign categories: Invites, Ongoing, and History.

GetX state management for campaign handling.

Detailed campaign page including:

Banner and logo display

Title, subtitle, description, and extra info

Payment and deadline details

Countdown placeholder

Accept and reject buttons

Responsive UI layout

Clear separation of business logic using controller and model classes

Technologies Used
Flutter (Dart)

GetX for state management and routing

Material Design

Stateless and Stateful widgets

Custom styling and responsive layout

Login Credentials
makefile
Copy
Edit
Username: influencer_001
Password: influencer123
How to Run the Project
Option 1: Using Flutlab (Online)
Open: https://flutlab.io/

Import the GitHub project using the repository URL.

Build and run the project in-browser.



lib/
│
├── models.dart                // Campaign model
├── dashboard_controller.dart // GetX controller for campaign logic
├── dashboard_page.dart       // Main campaign dashboard UI
├── campaign_detail_page.dart // Campaign details page
├── login_page.dart           // Login UI
├── utils/
│   ├── app_colors.dart       // Centralized color constants
│   └── responsive_widget.dart // Device responsive wrapper
Notes
This is a static demo without backend/API integration.

All data is locally stored within the controller.

The design is based on a Figma prototype shared by Echio.

Author
Akshita Gudi
Email: akshita.gudi343@gmail.com
LinkedIn: linkedin.com/in/akshita-gudi-6410b8262
