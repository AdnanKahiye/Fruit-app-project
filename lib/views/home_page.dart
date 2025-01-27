import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fruit_app/controllers/itembag_controller.dart';
import 'package:fruit_app/controllers/product_controller.dart';
import 'package:fruit_app/themes/app_themes.dart';
import 'package:fruit_app/views/chart_page.dart';
import 'package:fruit_app/views/detail_page.dart';
import 'package:fruit_app/widgets/adds_banner_widget,.dart';
import 'package:fruit_app/widgets/chips_widget.dart';
import 'package:fruit_app/widgets/products_card_widget.dart'; // Ensure secondaryColor and WhiteColr are defined here.

final ProviderIndex = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(proudctNotifierProvider);
    final currentIndex = ref.watch(ProviderIndex);
    final itemBage = ref.watch(itemBagProvider);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: WhiteColr,
        backgroundColor: seconadryColor,
        title: Text(
          "Fruit App",
          style: TextStyle(
              color: WhiteColr,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20, top: 10),
              child: Badge(
                  label: Text(itemBage.length.toString()),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChartPage()));
                      },
                      icon: Icon(
                        Icons.local_mall,
                        size: 24,
                      ))))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drawer Header
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: seconadryColor),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: primaryColor,
                ),
              ),
              accountName: Text(
                "Hi User",
                style: TextStyle(fontWeight: FontWeight.bold, color: WhiteColr),
              ),
              accountEmail: Text(
                "user@gmail.com",
                style: TextStyle(color: WhiteColr),
              ),
            ),

            // Navigation Items
            ListTile(
              leading: Icon(Icons.home, color: primaryColor),
              title: Text("Home", style: TextStyle(color: primaryColor)),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Home
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: seconadryColor),
              title: Text("Order History"),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Order History
              },
            ),
            ListTile(
              leading: Icon(Icons.local_mall, color: seconadryColor),
              title: Text("My Cart"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChartPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: seconadryColor),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Profile
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: seconadryColor),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                // Navigate to Settings
              },
            ),

            // Spacer and Footer
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "App Version 1.0.0",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              AddsWidget(),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    Chips_widget(chipLabel: 'All'),
                    Chips_widget(chipLabel: 'Apple'),
                    Chips_widget(chipLabel: 'Banana'),
                    Chips_widget(chipLabel: 'Orange'),
                    Chips_widget(chipLabel: 'Grapes'),
                    Chips_widget(chipLabel: 'Others'),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "List Products",
                    style: AppThems.headingOne,
                  ),
                  Text("See All"),
                ],
              ),
              MasonryGridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                shrinkWrap: true,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(getIndex: index))),
                  child: SizedBox(
                    height: 250,
                    child: productsCard(productIndex: index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        unselectedItemColor: seconadryColor,
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.watch(ProviderIndex.notifier).update((state) => value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
            activeIcon: Icon(Icons.history_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_mall_outlined),
            label: 'Chart',
            activeIcon: Icon(Icons.local_mall),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
