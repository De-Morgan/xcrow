import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:xcrow/ui/home_page/providers/account_info_provider.dart';

extension HomeWidgetRefX on WidgetRef {
  void invalidateAccountInfo() {
    invalidate(accountInfoProvider);
  }
}
