import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/cable_service.dart';
import 'package:xcrow/core/models/tv_cable.dart';
import 'package:xcrow/ui/bills/widgets/tvcard_number_widget.dart';

final selectedTvCableProvider = StateProvider.autoDispose<TvCable?>((ref) {
  return null;
});

final tvPackageProvider = FutureProvider.autoDispose
    .family<TvPackage?, String?>((ref, serviceId) async {
  if (serviceId == null) return null;
  final tvCableService = ref.watch(tvCableServiceProvider);
  final tvpack = await tvCableService.getTvPackages(serviceId: serviceId);
  ref.keepAlive();
  return tvpack;
});

final tvVerifyProvider =
    FutureProvider.autoDispose<TvVerification?>((ref) async {
  final serviceId = ref.watch(selectedTvCableProvider)?.name;
  if (serviceId == null) return null;
  final tvCard = ref.watch(tvCardNumberProvider);
  if (tvCard.isEmpty) return null;
  final tvCableService = ref.watch(tvCableServiceProvider);
  final tvpack = await tvCableService.verifyTvPackage(
      serviceId: serviceId, tvCard: tvCard);
  ref.keepAlive();
  return tvpack;
});
