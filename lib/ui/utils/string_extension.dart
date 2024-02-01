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

  String get capitalizeFirstOfEachWord => switch (this) {
        null => '',
        _ => this!
            .replaceAll(RegExp(' +'), ' ')
            .split(" ")
            .map((str) => str.capitalize)
            .join(" ")
      };
}
