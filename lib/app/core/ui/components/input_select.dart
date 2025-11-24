import 'package:easy_stock/app/core/ui/theme/colors_pallete.dart';
import 'package:flutter/material.dart';

class CustomSelectInput<T> extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabelBuilder;
  final ValueChanged<T>? onItemSelected;

  const CustomSelectInput({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    required this.items,
    required this.itemLabelBuilder,
    this.value,
    this.onItemSelected,
  });

  BoxDecoration _getDecoration() {
    return BoxDecoration(
      color: ColorsPallete.darkSecondary,
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  void _showOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return SelectOptionsModal<T>(
          items: items,
          itemLabelBuilder: itemLabelBuilder,
          onItemSelected: (selectedItem) {
            onItemSelected?.call(selectedItem);
            Navigator.pop(context);
          },
          title: labelText,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = value != null
        ? itemLabelBuilder(value as T)
        : labelText;

    return GestureDetector(
      onTap: () => _showOptionsModal(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: _getDecoration(),
        child: Row(
          children: [
            Icon(prefixIcon),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                displayText,
                style: TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_down,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectOptionsModal<T> extends StatelessWidget {
  final List<T> items;
  final String Function(T) itemLabelBuilder;
  final ValueChanged<T> onItemSelected;
  final String title;

  const SelectOptionsModal({
    super.key,
    required this.items,
    required this.itemLabelBuilder,
    required this.onItemSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsPallete.darkBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(
                  itemLabelBuilder(item),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () => onItemSelected(item),
              );
            },
          ),
        ],
      ),
    );
  }
}
