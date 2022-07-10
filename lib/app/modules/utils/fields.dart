class Fields {
  final Map<String, dynamic> map;
  Fields(this.map);

  String getString(String key) {
    try {
      return map[key]?.toString() ?? '';
    } catch (e) {
      return '';
    }
  }

  int getInt(String key) {
    try {
      return double.tryParse(getString(key))?.toInt() ?? 0;
    } catch (e) {
      return 0;
    }
  }

  bool getBool(String key) {
    try {
      return map[key]?.toString().toLowerCase() == 'true';
    } catch (e) {
      return false;
    }
  }

  double getDouble(String key) {
    try {
      return double.tryParse(getString(key)) ?? 0.0;
    } catch (e) {
      return 0.0;
    }
  }

  DateTime getDateTime(String key) {
    try {
      return DateTime.now().get(getString(key));
    } catch (e) {
      return DateTime(1900);
    }
  }

  List<T> getList<T>(String key) {
    try {
      return (map[key] ?? []) as List<T>;
    } catch (e) {
      return [];
    }
  }
}

extension on DateTime {
  DateTime get(dynamic value) {
    try {
      return DateTime.parse(value);
    } catch (e) {
      return _getA(value);
    }
  }

  DateTime _getA(String value) {
    try {
      final intValue = int.parse(value);
      return DateTime.fromMicrosecondsSinceEpoch(intValue);
    } catch (e) {
      return DateTime(1900);
    }
  }
}
