import 'package:jac/core/cache/cache.dart';

class HandlerCache {
  static Map<CachesKey,dynamic> _currentCache = <CachesKey,dynamic>{};

  static bool addOrUpdateCache<T>({required CachesKey cachesKey, required T? obj}) {
    if(_currentCache.containsKey(cachesKey)) {
      _currentCache.update(cachesKey, (value) => obj);
      return true;
    }
    _currentCache[cachesKey] = obj;
    return true;
  }

  static T? getElement<T>({required CachesKey cachesKey}) {
    if(!_currentCache.containsKey(cachesKey)) {
      return null;
    }
    return _currentCache[cachesKey];
  }

  static bool deleteElement({required CachesKey cachesKey}) {
    if(!_currentCache.containsKey(cachesKey)) {
      return true;
    }
    _currentCache.remove(cachesKey);
    return true;
  }

  static bool clearCache() {
    _currentCache = <CachesKey,dynamic>{};
    return true;
  }

}