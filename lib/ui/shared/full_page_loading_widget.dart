import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/utils/context_extension.dart';

class FullPageLoadingWidget extends StatelessWidget {
  final Widget child;

  const FullPageLoadingWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final loadingState = ref.watch(fullPageLoaderProvider);
            return loadingState.maybeWhen(
              orElse: () => Container(),
              data: (loading) {
                if (loading) return child!;
                return const SizedBox.shrink();
              },
            );
          },
          child: Stack(
            children: [
              const Positioned.fill(
                  child: Opacity(
                opacity: 0.6,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black,
                ),
              )),
              Material(
                color: Colors.transparent,
                child: Dialog(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const SizedBox(width: 16),
                        CircularProgressIndicator(
                          color: context.primaryColor,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Please wait a minute...',
                          style: context.titleMedium,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FullPageLoader {
  static final _feedbackStream = StreamController<bool>.broadcast();

  static void showLoading() {
    _feedbackStream.add(true);
  }

  static void hideLoading() {
    _feedbackStream.add(false);
  }
}

/// provider to control the full loading state
/// see [FullPageLoader]
final fullPageLoaderProvider = StreamProvider<bool>((ref) {
  ref.onDispose(() => FullPageLoader._feedbackStream.close());
  return FullPageLoader._feedbackStream.stream;
});
