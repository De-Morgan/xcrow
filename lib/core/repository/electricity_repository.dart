import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/electricity_service.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/ui/onboarding/providers/user_provider.dart';

class ElectricityRepository {
  final Ref ref;

  ElectricityRepository({required this.ref});
  String get userEmail => ref.read(userEmailProvider);
  int get userId => ref.read(userIdProvider);
  ElectricityService get electricityService =>
      ref.read(electricityServiceProvider);
  Future<void> purchaseElectricity(
          {required String meterNo,
          required num amount,
          required int provider,
          MeterType package = MeterType.prepaid,
          required String phone}) =>
      electricityService.purchaseElectricity(
          phone: phone,
          userId: userId,
          email: userEmail,
          amount: amount,
          meterNo: meterNo,
          provider: provider,
          package: package);
}

final electricityRepositoryProvider = Provider<ElectricityRepository>((ref) {
  return ElectricityRepository(ref: ref);
});
