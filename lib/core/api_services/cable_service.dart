import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/network/index.dart';

import '../models/tv_cable.dart';

class TvCableService {
  final Ref ref;

  NetworkProvider get network => ref.read(networkProvider);
  static const serviceName = 'cabletv';

  TvCableService({required this.ref});

  Future<TvPackage> getTvPackages({
    required String serviceId,
  }) async {
    try {
     final response =  await network.get('$serviceName/options', body: {
        'serviceId': serviceId,
      });
     return TvPackage.fromString(response.data['data']);
    } on ApiError {
      rethrow;
    }
  }

  Future<TvVerification> verifyTvPackage({
    required String serviceId,
    required String tvCard,
  }) async {
    try {
      final response =  await network.get('$serviceName/verify', body: {
        'serviceId': serviceId,
        'tvCard':tvCard
      });
      return TvVerification.fromJson(response.data['data']);
    } on ApiError {
      rethrow;
    }
  }
}

final tvCableServiceProvider = Provider<TvCableService>((ref) {
  return TvCableService(ref: ref);
});
