import 'package:flutter/material.dart';
import 'package:motel_list_test/domain/entities/category_item_entity.dart';
import 'package:motel_list_test/presenter/widgets/filter_badge.dart';

class FilterBar extends StatelessWidget {
  final List<CategoryItemEntity> categories;
  final Set<String> selectedCategories;
  final int filterBadgeCount;
  final void Function(String categoryName, bool isSelected) onCategorySelected;

  const FilterBar({
    super.key,
    required this.categories,
    required this.selectedCategories,
    required this.filterBadgeCount,
    required this.onCategorySelected,
  });

  void _showSelectedFilters(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Filtros Selecionados',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 16),
                    if (selectedCategories.isEmpty)
                      const Text('Nenhum filtro selecionado'),
                    if (selectedCategories.isNotEmpty)
                      Wrap(
                        spacing: 8,
                        children: selectedCategories
                            .map(
                              (filter) => Chip(
                                label: Text(filter),
                                deleteIcon: const Icon(Icons.close),
                                onDeleted: () {
                                  setState(() {
                                    onCategorySelected(filter, false);
                                  });
                                },
                              ),
                            )
                            .toList(),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => _showSelectedFilters(context),
            child: Chip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.tune,
                        color: Colors.black,
                        size: 12,
                      ),
                      if (filterBadgeCount > 0)
                        Positioned(
                          top: -12,
                          left: -12,
                          child: FilterBadge(count: filterBadgeCount),
                        ),
                    ],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Filtros',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          ...categories.map(
            (category) {
              final bool isSelected =
                  selectedCategories.contains(category.nome);
              return Padding(
                padding: const EdgeInsets.only(left: 8),
                child: FilterChip(
                  label: Text(
                    category.nome,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  selected: isSelected,
                  selectedColor: Colors.red,
                  checkmarkColor: Colors.white,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  showCheckmark: false,
                  onSelected: (bool selected) {
                    onCategorySelected(category.nome, selected);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
