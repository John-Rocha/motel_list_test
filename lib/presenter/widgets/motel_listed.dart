import 'package:flutter/material.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/domain/entities/motel_entity.dart';
import 'package:motel_list_test/presenter/cubit/motels_home_cubit.dart';
import 'package:motel_list_test/presenter/widgets/filter_bar.dart';
import 'package:motel_list_test/presenter/widgets/motel_card.dart';

class MotelListed extends StatefulWidget {
  const MotelListed({
    super.key,
    required this.moteis,
    required MotelsHomeCubit motelsHomeCubit,
  }) : _motelsHomeCubit = motelsHomeCubit;

  final List<MotelEntity> moteis;
  final MotelsHomeCubit _motelsHomeCubit;

  @override
  State<MotelListed> createState() => _MotelListedState();
}

class _MotelListedState extends State<MotelListed> {
  List<CategoryItemEntity> categories = [];
  Set<String> selectedCategories = {};

  List<CategoryItemEntity> _loadCategories() {
    for (var motel in widget.moteis) {
      for (var suites in motel.suites) {
        for (var category in suites.categoriaItens) {
          categories.add(category);
        }
      }
    }
    return categories;
  }

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterBar(
          categories: categories,
          selectedCategories: selectedCategories,
          filterBadgeCount: selectedCategories.length,
          onCategorySelected: (categoryName, isSelected) {
            setState(
              () {
                if (isSelected) {
                  selectedCategories.add(categoryName);
                } else {
                  selectedCategories.remove(categoryName);
                }
              },
            );
          },
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () => widget._motelsHomeCubit.fetchMotelData(),
            child: ListView.builder(
              itemCount: widget.moteis.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemBuilder: (context, index) {
                final motel = widget.moteis[index];
                return MotelCard(motel: motel);
              },
            ),
          ),
        ),
      ],
    );
  }
}
