import 'package:xcrow/ui/utils/string_extension.dart';

enum Network { mtn, airtel, glo, etisalat }

extension NetworkX on Network {
  String get desc =>
      switch (this) { Network.airtel => 'Airtel Mobile', _ => title };

  String get title => name.capitalize;
}
