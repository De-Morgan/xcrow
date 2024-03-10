import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/core/api_services/electricity_service.dart';
import 'package:xcrow/core/models/electricity.dart';
import 'package:xcrow/core/repository/electricity_repository.dart';
import 'package:xcrow/ui/bills/widgets/electricity_meter_widget.dart';
import 'package:xcrow/ui/utils/string_extension.dart';

import 'airtime.dart';

final electricityProvider =
    FutureProvider.autoDispose<List<Electricity>>((ref) async {
  final service = ref.watch(electricityServiceProvider);
  final billers = await service.getBillers();
  ref.keepAlive();
  return billers;
});

final electricitySearchProvider = StateProvider.autoDispose<String?>((ref) {
  return '';
});

final searchedElectricityProvider =
    FutureProvider.autoDispose<List<Electricity>>((ref) async {
  final search = ref.watch(electricitySearchProvider);
  return ref.watch(electricityProvider.selectAsync((value) => value
      .where((element) => element.code.nullToEmpty
          .toLowerCase()
          .trim()
          .contains(search.nullToEmpty.trim().toLowerCase()))
      .toList()));
});

final electricityNameEnquiryProvider =
    FutureProvider.autoDispose<ElectricityValidation?>((ref) async {
  final service = ref.watch(electricityServiceProvider);
  final type = ref.watch(selectedMeterType);
  final provider = ref.watch(selectedElectricityProvider);
  if (provider == null) return null;
  return service.validateElectricity(
      billersCode: '${provider.code}',
      serviceID: '${provider.serviceId}',
      meterType: type);
});

final purchaseElectricityProvider =
    FutureProvider.autoDispose<void>((ref) async {
  final repo = ref.watch(electricityRepositoryProvider);
  final meterNo = ref.read(meterNumberProvider);
  final provider = ref.watch(selectedElectricityProvider);
  final amount =
      num.tryParse(ref.watch(amountProvider).text.replaceAll(',', ''));
  final phone = ref.watch(electricityNameEnquiryProvider).valueOrNull?.phone;
  final type = ref.watch(selectedMeterType);

  await repo.purchaseElectricity(
      meterNo: meterNo,
      provider: provider?.id ?? 0,
      amount: amount ?? 0,
      phone: phone ?? '',
      package: type);
});

final selectedElectricityProvider =
    StateProvider.autoDispose<Electricity?>((ref) {
  return null;
});

final selectedMeterType = StateProvider<MeterType>((ref) {
  return MeterType.prepaid;
});
