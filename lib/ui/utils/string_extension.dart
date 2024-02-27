extension StringExtension on String? {
  bool isEqual(String? content) {
    if (content == null) return false;
    return this == content;
  }

  String get capitalize => switch (this) {
        null => '',
        _ => this!.isNotEmpty
            ? '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}'
            : ''
      };

  String get nullToEmpty {
    if (this == null) return '';
    return this!;
  }

  String get sanitizePhoneNumber {
    try {
      if (this == null) return '';
      final replace234 = this!.replaceFirst('+234', '0');
      final newChars = replace234.replaceAll(RegExp('[^A-Za-z0-9]'), '');
      return newChars.trim().substring(newChars.length - 11);
    } catch (_) {
      return this ?? '';
    }
  }

  String get capitalizeFirstOfEachWord => switch (this) {
        null => '',
        _ => this!
            .replaceAll(RegExp(' +'), ' ')
            .split(" ")
            .map((str) => str.capitalize)
            .join(" ")
      };
}
