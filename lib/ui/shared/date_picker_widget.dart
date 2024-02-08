import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:xcrow/ui/utils/date_extension.dart';
import 'package:xcrow/ui/utils/platform_date_picker.dart';

class DatePickerWidget extends HookWidget {
  const DatePickerWidget(
      {Key? key,
      this.formerDate,
      this.label = '',
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.onDateSelected})
      : super(key: key);
  final String label;
  final DateTime? formerDate;
  final ValueChanged<DateTime>? onDateSelected;
  final DateTime? initialDate, firstDate, lastDate;

  @override
  Widget build(BuildContext context) {
    final date = useState<DateTime?>(formerDate);
    final controller = useTextEditingController();

    if (formerDate != null) {
      date.value = formerDate;
    }
    return TextField(
      decoration: InputDecoration(hintText: label),
      controller: controller,
      readOnly: true,
      onTap: () async {
        final selectedDate = await PlatFormDatePicker.pickData(context,
            lastDate: lastDate, initialDate: initialDate, firstDate: firstDate);
        if (selectedDate != null) {
          date.value = selectedDate;
          onDateSelected?.call(selectedDate);
          controller.text = '${date.value.formatDateReadable()}';
        }
      },
    );
  }
}
//RoundBorderWidget(
//         child: Row(
//           children: [
//             if (date.value == null)
//               Text(
//                 label,
//                 style: context.textTheme.bodyLarge,
//               )
//             else
//               Text(
//                 '${date.value.formatDateReadable()}',
//                 style: context.textTheme.bodyLarge,
//               )
//           ],
//         ),
//       )
