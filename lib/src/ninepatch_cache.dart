import 'ninepatch_info.dart';

/// Ninepatch size Cache
class NinepatchCache {
  static final NinepatchCache _instance = NinepatchCache._private();
  static NinepatchCache get instance => _instance;
  factory NinepatchCache() => _instance;
  NinepatchCache._private();

  /// cache map
  final Map<String, NinepatchInfo> _cache = {};

  /// get [NinepatchInfo]
  NinepatchInfo? get({required String? key}) {
    if (key != null && key.isNotEmpty) {
      return _cache[key];
    } else {
      return null;
    }
  }

  /// add [NinepatchInfo]
  void add({String? key, required NinepatchInfo value}) {
    if (key != null && key.isNotEmpty) {
      _cache[key] = value;
    }
  }

  /// remove [NinepatchInfo]
  NinepatchInfo? remove({required String? key}) {
    if (key != null && key.isNotEmpty) {
      return _cache.remove(key);
    } else {
      return null;
    }
  }

  /// clear all [NinepatchInfo]
  void clear({required String? key}) {
    _cache.clear();
  }
}
