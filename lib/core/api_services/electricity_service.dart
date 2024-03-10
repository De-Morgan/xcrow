import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/core/network/index.dart';

class ElectricityService {
  final Ref ref;

  NetworkProvider get network => ref.read(networkProvider);
  static const serviceName = 'electricity';

  ElectricityService({required this.ref});

  Future<List<Electricity>> getBillers() async {
    try {
      final response = await network.get(
        '$serviceName/biller',
      );
      return (response.data['data'] as List?)
              ?.map((e) => Electricity.fromJson(e))
              .toList() ??
          [];
    } on ApiError {
      rethrow;
    }
  }

  Future<ElectricityValidation> validateElectricity(
      {required String billersCode,
      required String serviceID,
      MeterType meterType = MeterType.prepaid}) async {
    try {
      final response = await network.post('$serviceName/merchant/verify',
          body: {
            'billersCode': billersCode,
            'serviceID': serviceID,
            'type': meterType.name
          });
      return ElectricityValidation.fromString(response.data['data']);
    } on ApiError {
      rethrow;
    }
  }

  Future<void> purchaseElectricity(
      {required int userId,
      required String meterNo,
      required num amount,
      required int provider,
      MeterType package = MeterType.prepaid,
      required String email,
      required String phone}) async {
    try {
      await network.post('$serviceName/merchant/payment', body: {
        'userId': userId,
        'meterNo': meterNo,
        'package': package.name,
        'amount': amount,
        'email': email,
        'phone': phone,
        'provider': provider
      });
    } on ApiError {
      rethrow;
    }
  }
}

final electricityServiceProvider = Provider<ElectricityService>((ref) {
  return ElectricityService(ref: ref);
});
