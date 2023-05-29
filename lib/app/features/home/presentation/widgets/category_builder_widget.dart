import 'package:ardilla/app/features/home/domain/entities/category_entity.dart';
import 'package:ardilla/app/features/home/presentation/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class CategoryBuilderWidget extends StatelessWidget {
  
  final List<CategoryEntity> categoryEntityList;
  const CategoryBuilderWidget(
      {super.key,required this.categoryEntityList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: categoryEntityList.map((category) => Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0),
          child: CategoryWidget(image:category.icon, title: category.label,),
        )).toList()),
    );
  }
}
