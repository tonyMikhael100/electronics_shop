import 'package:electronics_shop/features/search/presentation/widgets/search_category_row.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SearchCategoryRow(categoryLabel: 'mobile', imageUrl: '');
        },
      ),
    );
  }
}
