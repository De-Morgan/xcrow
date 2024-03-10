import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../provider/electricity.dart';

class ElectricityNameEnquiry extends StatelessWidget {
  const ElectricityNameEnquiry({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final nameEnquiry = ref.watch(electricityNameEnquiryProvider);
        return nameEnquiry.maybeWhen(
            //todo
            // data: (name) => name == null
            //     ? const SizedBox()
            //     : Row(
            //         children: [
            //           RecipientRow(
            //             title: name.name.nullToEmpty,
            //             subTitle: name.address.nullToEmpty,
            //           ),
            //         ],
            //       ),
            // error: (error, _) => Row(
            //       children: [
            //         Text('$error',
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //             style: context.textTheme.caption
            //                 ?.copyWith(color: context.errorColor)),
            //       ],
            //     ),
            // loading: () => const CircleLoadingIndicator(),
            orElse: () => const SizedBox());
      },
    );
  }
}
