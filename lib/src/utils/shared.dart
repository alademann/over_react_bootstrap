part of over_react_bootstrap.utils;

class _BsClassNamePartUtil extends DebugFriendlyConstant {
  final String classNamePart;

  const _BsClassNamePartUtil._(String name, this.classNamePart) : super(name);

  @override
  String get debugDescription => unindent(
      '''
      classNamePart: $classNamePart
      '''
  );
}
