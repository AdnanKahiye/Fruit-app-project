import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruit_app/controllers/itembag_controller.dart';
import 'package:fruit_app/controllers/product_controller.dart';
import 'package:fruit_app/models/product_model.dart';
import 'package:fruit_app/themes/app_themes.dart';

class productsCard extends ConsumerWidget {
  const productsCard({
    super.key,
    required this.productIndex,
  });
  final int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(proudctNotifierProvider);

    // Guard clause to handle empty or null product lists.
    if (products.isEmpty || productIndex >= products.length) {
      return const SizedBox.shrink();
    }

    final product = products[productIndex];

    return Container(
      decoration: BoxDecoration(
          color: WhiteColr,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 6),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2)
          ]),
      margin: EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              color: lightBackground,
              margin: EdgeInsets.all(12),
              child: Image.asset(
                product.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: AppThems.cardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  product.shortDescription,
                  style: AppThems.BodyText,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${product.price}',
                      style: AppThems.cardTitle.copyWith(color: primaryColor),
                    ),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(proudctNotifierProvider.notifier)
                            .isSelectItem(product.pid, productIndex);
                        if (product.isSelected == false) {
                          ref.read(itemBagProvider.notifier).addNewItemBag(
                              ProductModel(
                                  pid: product.pid,
                                  imgUrl: product.imgUrl,
                                  title: product.title,
                                  price: product.price,
                                  shortDescription: product.shortDescription,
                                  longDescription: product.longDescription,
                                  review: product.review,
                                  rating: product.rating));
                        } else {
                          ref
                              .read(itemBagProvider.notifier)
                              .removeItem(product.pid);
                        }
                      },
                      icon: Icon(
                        product.isSelected
                            ? Icons.check_circle
                            : Icons.add_circle,
                        size: 30,
                        color: primaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
