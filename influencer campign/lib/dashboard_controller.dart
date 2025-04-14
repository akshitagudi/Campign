import 'package:get/get.dart';
import 'models.dart';

class DashboardController extends GetxController {
  var campaigns = <Campaign>[
    Campaign(
      id: '1',
      title: 'AJIO',
      subtitle: 'Clothing fashion tutorial',
      description: 'Fashion Forward with Ajio',
      platform: 'Instagram',
      logoUrl:
          'https://img.utdstc.com/icon/b7e/c6b/b7ec6bcad19a722c6f27fb3297d7ae074982d7915c421d541f5e07072fe654a9:200',
      bannerImageUrl:
          'https://asset7.ckassets.com/blog/wp-content/uploads/sites/5/2024/09/Ajio-Upcoming-Sales.jpg',
      startDate: '01-04-2025',
      endDate: '30-04-2025',
      engagement: '1200 likes',
      payment: '₹2500',
      status: 'ongoing',
      extraInfo:
          'Please make sure to include relevant hashtags and tag our official brand handle. Your post must be uploaded in HD with clear visibility of the clothing styles.',
    ),
    Campaign(
      id: '2',
      title: 'Flipkart',
      subtitle: 'Tech gadget spotlight',
      description: 'Promoting new gadget launch.',
      platform: 'YouTube',
      logoUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbL2KBO11mdgsZIJCR0z01JEvGLGg8l1OowQ&s',
      bannerImageUrl:
          'https://images.hindustantimes.com/img/2022/09/13/550x309/Screenshot_2022-09-13_143639_1663061822963_1663061878034_1663061878034.png',
      startDate: '15-03-2025',
      endDate: '15-04-2025',
      engagement: '5000 views',
      payment: '₹3500',
      status: 'invited',
      extraInfo:
          'Please record the unboxing experience and explain the key features in a short 60-90 second video. Mention the price and tag Flipkart’s tech handle.',
    ),
    Campaign(
      id: '3',
      title: 'Myntra',
      subtitle: 'Style with Summer Vibes',
      description: 'Latest trends in fashion for Summer 2025.',
      platform: 'Instagram',
      logoUrl:
          'https://cdn.coinsbee.com/version2/dist/assets/img/brands/Myntra.png',
      bannerImageUrl:
          'https://cdn.zeebiz.com/sites/default/files/2022/09/15/200530-untitled-design-2022-09-15t174229297.jpg',
      startDate: '10-04-2025',
      endDate: '25-04-2025',
      engagement: '3300 likes',
      payment: '₹2800',
      status: 'invited',
      extraInfo:
          'Focus on showcasing the fabric and colors in natural daylight. Use reels and include the caption #MyntraSummerVibe.',
    ),
    Campaign(
      id: '3',
      title: 'Meesho',
      subtitle: 'Affordable Style Delivered',
      description:
          'Showcasing trending fashion and home essentials at unbeatable prices for your audience..',
      platform: 'Instagram',
      logoUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc7W0Q9VBl3M1sy3m1JyNAskLGHmsLb9iyRA&s',
      bannerImageUrl:
          'https://www.indiantelevision.com/sites/default/files/images/tv-images/2024/09/09/Meesho.jpg',
      startDate: '10-04-2025',
      endDate: '25-04-2025',
      engagement: '3300 likes',
      payment: '₹2900',
      status: 'invited',
      extraInfo:
          'Focus on showcasing the fabric and colors in natural daylight. Use reels and include the caption #MyntraSummerVibe.',
    ),
    Campaign(
      id: '4',
      title: 'Nyka',
      subtitle: 'Glam Up with Nykaa',
      description:
          'Highlighting top-rated skincare and makeup must-haves from Nykaa’s latest collection.',
      platform: 'Instagram',
      logoUrl:
          'https://img.utdstc.com/icon/53e/96f/53e96f78978fa5549c6712183f2cd1c2464b3c8ac425880f239881bd41e43a97:200',
      bannerImageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3ZrM1_ZGTCnX4tI3WM-1Z6hNaOJ6mPn8sOw&s',
      startDate: '15-09-2024',
      endDate: '17-03-2025',
      engagement: '3300 likes',
      payment: '₹2800',
      status: 'invited',
      extraInfo:
          'Focus on showcasing the fabric and colors in natural daylight. Use reels and include the caption #MyntraSummerVibe.',
    ),
    Campaign(
      id: '5',
      title: 'Amazon Fresh',
      subtitle: 'Go Organic, Go Fresh!',
      description: 'Promoting organic fruits and vegetables.',
      platform: 'YouTube',
      logoUrl:
          'https://cdn.iconscout.com/icon/free/png-256/amazon-1869030-1583154.png',
      bannerImageUrl:
          'https://img.etimg.com/thumb/width-1200,height-900,imgsize-925377,resizemode-75,msid-113674826/top-trending-products/news/amazon-great-indian-festival-sale-2024-40-off-on-geysers-live-now-for-prime-members.jpg',
      startDate: '01-02-2022',
      endDate: '12-06-2025',
      engagement: '2700 views',
      payment: '₹3000',
      status: 'ongoing',
      extraInfo:
          'Emphasize the product benefits and how they suit different skin types. Include unboxing or swatch clips if possible. Don’t forget to use brand tags and trending beauty hashtags for wider reach',
    ),
  ].obs;

  var searchText = ''.obs;

  List<Campaign> get invites => campaigns
      .where((c) =>
          c.status == 'invited' &&
          c.title.toLowerCase().contains(searchText.value.toLowerCase()))
      .toList();

  List<Campaign> get ongoing => campaigns
      .where((c) =>
          c.status == 'ongoing' &&
          c.title.toLowerCase().contains(searchText.value.toLowerCase()))
      .toList();

  List<Campaign> get history => campaigns
      .where((c) =>
          c.status == 'completed' &&
          c.title.toLowerCase().contains(searchText.value.toLowerCase()))
      .toList();

  void markAsCompleted(Campaign campaign) {
    campaign.status = 'completed';
    campaigns.refresh();
  }

  void updateSearch(String text) {
    searchText.value = text;
  }

  void navigateToDetail(Campaign campaign) {
    Get.toNamed('/campaignDetail', arguments: campaign);
  }
}
