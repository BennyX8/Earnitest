import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  final IconData? icon;
  final String text;
  final void Function()? onRefresh;
  const EmptyListWidget({
    Key? key,
    required this.text,
    this.icon,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon ?? Icons.filter_list_off_rounded,
            size: 48.0,
            color: Colors.grey,
          ),
          const SizedBox(height: 10.0),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),

          //* Vertical Spacer
          const SizedBox(height: 15.0),

          TextButton(
            onPressed: () => onRefresh?.call(),
            child: const Text(
              'Reload',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
