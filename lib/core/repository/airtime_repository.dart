import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/airtime_service.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';

class AirtimeRepository {
  final Ref ref;

  AirtimeService get airtimeService => ref.read(airtimeServiceProvider);

  int get userId => ref.read(userIdProvider);

  AirtimeRepository({required this.ref});

  Future<void> purchaseAirtime(
          {required String phone,
          required String serviceID,
          required num amount,
          required String pin}) =>
      airtimeService.purchaseAirtime(
          phone: phone,
          pin: pin,
          userId: userId,
          amount: amount,
          serviceID: serviceID);
}

final airtimeRepositoryProvider = Provider<AirtimeRepository>((ref) {
  return AirtimeRepository(ref: ref);
});
