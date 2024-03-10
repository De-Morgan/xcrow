import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/bills/provider/electricity.dart';
import 'package:xcrow/ui/shared/cirlce_loading_indicator.dart';
import 'package:xcrow/ui/shared/padded_container.dart';
import 'package:xcrow/ui/shared/search_widget.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class SelectElectricityProviderPage extends ConsumerWidget {
  const SelectElectricityProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(searchedElectricityProvider);
    return Scaffold(
      appBar: AppBar(),
      body: PaddedContainer(
        child: Column(
          children: [
            const SizedBox(height: 24),
            SearchWidget(
              onChanged: (v) =>
                  ref.watch(electricitySearchProvider.notifier).state = v,
            ),
            Expanded(
              child: provider.maybeWhen(
                  orElse: () => const Center(child: CircleLoadingIndicator()),
                  data: (providers) => ListView(
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Providers',
                            style: context.titleMedium,
                          ),
                          ...providers.map((e) => ListTile(
                                title: Text(
                                  '${e.code}',
                                  style: context.bodyMedium,
                                ),
                                onTap: () {
                                  ref
                                      .read(
                                          selectedElectricityProvider.notifier)
                                      .state = e;
                                  context.pop(e);
                                },
                              ))
                        ],
                      )),
            )
          ],
        ),
      ),
    );
  }
}
