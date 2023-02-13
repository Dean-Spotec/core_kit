// Author: Dean.Liu
// DateTime: 2021/08/12 18:45

extension StringNullEmpty on String? {
  /// 传入值为null或者长度为0
  bool get isNullOrEmpty => (this ?? '').isEmpty;

  /// 传入值不为null且长度大于0
  bool get isNotNullNorEmpty => !isNullOrEmpty;
}

extension ListNullEmpty on List? {
  /// 传入值为null或者长度为0
  bool get isNullOrEmpty => (this ?? []).isEmpty;

  /// 传入值不为null且长度大于0
  bool get isNotNullNorEmpty => !isNullOrEmpty;
}

extension MapNullEmpty on Map? {
  /// 传入值为null或者长度为0
  bool get isNullOrEmpty => (this ?? {}).isEmpty;

  /// 传入值不为null且长度大于0
  bool get isNotNullNorEmpty => !isNullOrEmpty;
}
