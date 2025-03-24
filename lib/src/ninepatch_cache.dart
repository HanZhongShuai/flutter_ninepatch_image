import 'ninepatch_info.dart';

class NinepatchCache {
  static final NinepatchCache _instance = NinepatchCache._private();
  static NinepatchCache get instance => _instance;
  factory NinepatchCache() => _instance;
  NinepatchCache._private();

  final Map<String, NinepatchInfo> _cache = {};

  NinepatchInfo? get({required String? key}) {
    if (key != null && key.isNotEmpty) {
      return _cache[key];
    } else {
      return null;
    }
  }

  void add({String? key, required NinepatchInfo value}) {
    if (key != null && key.isNotEmpty) {
      _cache[key] = value;
    }
  }
}
