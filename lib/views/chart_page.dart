import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/controllers/itembag_controller.dart';
import 'package:fruit_app/themes/app_themes.dart';
import 'package:fruit_app/views/by_page.dart';

class ChartPage extends ConsumerWidget {
  const ChartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemBag = ref.watch(itemBagProvider);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: WhiteColr,
        backgroundColor: seconadryColor,
        title: Text(
          "Mychart Page",
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
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: itemBag.length,
                itemBuilder: (context, index) => Card(
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset(itemBag[index].imgUrl),
                            ),
                            Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        itemBag[index].title,
                                        style: AppThems.cardTitle,
                                      ),
                                      Gap(6),
                                      Text(
                                        itemBag[index].shortDescription,
                                        style: AppThems.BodyText,
                                      ),
                                      Gap(4),
                                      Text(
                                        '\$${itemBag[index].price}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Have a coupon code? enter here'),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: primaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FDS2023',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: Row(
                            children: const [
                              Text(
                                'Available',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(5),
                              Icon(Icons.check_circle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Delivery Fee:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Free',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Discount:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'No discount',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      Text(
                        '\$${ref.watch(priceCalcProvider)}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThankYouPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
