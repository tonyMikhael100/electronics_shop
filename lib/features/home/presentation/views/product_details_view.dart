import 'package:cached_network_image/cached_network_image.dart';
import 'package:electronics_shop/core/utils/app_colors.dart';
import 'package:electronics_shop/core/utils/app_styles.dart';
import 'package:electronics_shop/widgets/custom_elvated_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int currentPage = 0;

  final PageController pageViewController = PageController();

  final List<String> imageUrls = [
    'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/reno13-series/list-page/reno13-pro-5g/purple.png',
    'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/reno13-series/list-page/reno13-pro-5g/purple.png',
    'https://image.oppo.com/content/dam/oppo/common/mkt/v2-2/reno13-series/list-page/reno13-pro-5g/purple.png',
  ];

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              // Add to favourite logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: PageView.builder(
                  controller: pageViewController,
                  itemCount: imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: imageUrls[index],
                      height: 220,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imageUrls.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage == index ? 12 : 8,
                  height: currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == index
                        ? AppColors.primaryColor
                        : Colors.grey[300],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Oppo Reno 13 Pro 5G',
              style: AppTextStyles.displayLarge(context),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text('4.5', style: AppTextStyles.bodyLarge(context)),
                SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '\$799',
              style: AppTextStyles.displayMedium(context).copyWith(
                  color: AppColors.secondaryColor, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            Text(
              'Experiaence the next level of performance with the Oppo Reno 13 Pro 5G. Stunning display, powerful processor, and long-lasting battery.',
              style: AppTextStyles.displayMedium(context)
                  .copyWith(fontWeight: FontWeight.w100, color: Colors.black87),
            ),
            const SizedBox(height: 24),
            Spacer(),
            CustomElevatedButton(
              icon: Icons.shopping_cart_rounded,
              label: 'Add to Cart',
              backgroundColor: AppColors.primaryColor,
              onTap: () {},
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}
