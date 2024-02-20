class TypeSanitizer {
  static String? sanitizeToString(Object? value) {
    return value?.toString();
  }

  static int? sanitizeToInt(Object? value) {
    return sanitizeToNum(value)?.toInt();
  }

  static num? sanitizeToNum(Object? value) {
    return num.tryParse(value?.toString() ?? '');
  }

  static bool? sanitizeToBool(Object? value) {
    switch (value?.runtimeType) {
      case null:
        return null;
      case String:
        return (value as String) == 'true';
      case int:
        return (value as int) > 0;
      case num:
        return (value as num) > 0;
      case bool:
        return value as bool;
      default:
        return false;
    }
  }
}
