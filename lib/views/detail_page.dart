import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/controllers/product_controller.dart';
import 'package:fruit_app/themes/app_themes.dart';
import 'package:fruit_app/views/home_page.dart';

class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.getIndex});
  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(proudctNotifierProvider);
    final currentIndex = ref.watch(ProviderIndex);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: WhiteColr,
        backgroundColor: seconadryColor,
        title: Text(
          "Details Page",
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
              padding: EdgeInsets.only(right: 20),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.local_mall)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              color: lightBackground,
              child: Image.asset(products[getIndex].imgUrl),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products[getIndex].title,
                    style: AppThems.bigTitle.copyWith(color: primaryColor),
                  ),
                  Gap(12),
                  Row(
                    children: [
                      RatingBar(
                          initialRating: 3.5,
                          minRating: 1,
                          maxRating: 5,
                          allowHalfRating: true,
                          itemSize: 25,
                          ratingWidget: RatingWidget(
                              empty: Icon(
                                Icons.star_border,
                                color: Colors.amber,
                              ),
                              full: Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              half: Icon(
                                Icons.star_half_sharp,
                                color: Colors.amber,
                              )),
                          onRatingUpdate: (value) => null),
                      Gap(12),
                      Text('3679 reviews'),
                    ],
                  ),
                  Gap(12),
                  Text(
                    products[getIndex].longDescription,
                    style: AppThems.BodyText.copyWith(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${products[getIndex].price * products[getIndex].qty}',
                        style: AppThems.headingOne,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ref
                                    .watch(proudctNotifierProvider.notifier)
                                    .decreaseQty(products[getIndex].pid);
                              },
                              icon: Icon(
                                Icons.do_not_disturb_on_outlined,
                                size: 30,
                              ),
                            ),
                            Text(
                              products[getIndex].qty.toString(),
                              style: AppThems.cardTitle,
                            ),
                            IconButton(
                                onPressed: () {
                                  ref
                                      .watch(proudctNotifierProvider.notifier)
                                      .incrementQty(products[getIndex].pid);
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(12),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: Size(double.infinity, 60)),
                      onPressed: () {},
                      child: Text(
                        'Add item to bag',
                        style: TextStyle(color: WhiteColr, fontSize: 20),
                      ))
                ],
              ),
            )
          ],
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
            icon: Icon(Icons.help_center_outlined),
            label: 'Helps',
            activeIcon: Icon(Icons.help),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
            activeIcon: Icon(Icons.notifications),
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
