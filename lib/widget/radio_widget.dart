import 'package:final_project/provider/radio_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RadioWidget extends ConsumerWidget {
  const RadioWidget({
    super.key,
    required this.categoryColor,
    required this.titleRadio,
    required this.valueInput,
    required this.onChangedValue,
  });

  final String titleRadio;
  final Color categoryColor;
  final int valueInput;
  final VoidCallback onChangedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
      child: Theme(
        data: ThemeData(unselectedWidgetColor: categoryColor),
        child: RadioListTile(
          activeColor: categoryColor,
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: const Offset(-22, 0),
            child: Text(titleRadio, style: TextStyle(
              color: categoryColor, fontWeight: FontWeight.w700,
            ),),
          ),
          value: valueInput,
          groupValue: radio,
          onChanged: (value) => onChangedValue(),
        ),
      ),
    );
  }
}
