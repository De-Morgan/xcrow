import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/network/index.dart';

class AirtimeService {
  final Ref ref;

  NetworkProvider get network => ref.read(networkProvider);
  static const serviceName = 'airtime';

  AirtimeService({required this.ref});

  Future<void> purchaseAirtime(
      {required String phone,
      required int userId,
      required String serviceID,
      required num amount,
      required String pin}) async {
    try {
      await network.post('$serviceName/purchase', body: {
        'phone': phone,
        'userId': userId,
        'amount': amount,
        'serviceID': serviceID,
        'pin': pin
      });
    } on ApiError {
      rethrow;
    }
  }
}

final airtimeServiceProvider = Provider<AirtimeService>((ref) {
  return AirtimeService(ref: ref);
});
