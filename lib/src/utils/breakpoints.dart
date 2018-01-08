part of over_react_bootstrap.utils;

/// Viewport / container `min-width` / `max-width` / utility CSS class part values
/// based on Bootstrap's responsive media query utilities.
class BsMediaQueryWidthBreakpoint extends DebugFriendlyConstant {
  /// The pixel width value at which a "breakpoint" begins (inclusive).
  final int minWidth;

  /// The pixel width value at which a "breakpoint" ends (exclusive).
  final int maxWidth;

  /// The CSS class part that can be appended to many other Bootstrap utility classes to make that class
  /// style only apply above / below certain breakpoints.
  final String classNamePart;

  const BsMediaQueryWidthBreakpoint._(String name, this.minWidth, this.maxWidth, this.classNamePart) : super(name);

  /// Small (a.k.a. "tablets") breakpoint.
  static const BsMediaQueryWidthBreakpoint SMALL =
      const BsMediaQueryWidthBreakpoint._('SMALL', 768, 992, 'sm');

  /// Medium (a.k.a. "desktops") breakpoint.
  static const BsMediaQueryWidthBreakpoint MEDIUM =
      const BsMediaQueryWidthBreakpoint._('MEDIUM', 992, 1200, 'md');

  /// Large (a.k.a. "large desktops") breakpoint.
  static const BsMediaQueryWidthBreakpoint LARGE =
      const BsMediaQueryWidthBreakpoint._('LARGE', 1200, 1600, 'lg');

  @override
  String get debugDescription => unindent(
      '''
      minWidth: $minWidth
      maxWidth: $maxWidth
      classNamePart: $classNamePart
      '''
  );
}

/// List of available media query breakpoint widths.
///
/// > NOTE: THIS MUST REMAIN IN-SYNC WITH THE FIELDS IN [BsMediaQueryWidthBreakpoint], and should be sorted in
///   descending order so that [getBsWidthBreakpoint] functions as expected.
const List<BsMediaQueryWidthBreakpoint> bsMediaQueryWidthBreakpoints = const [
  BsMediaQueryWidthBreakpoint.LARGE,
  BsMediaQueryWidthBreakpoint.MEDIUM,
  BsMediaQueryWidthBreakpoint.SMALL,
];

/// Utility function that can be used to check what [BsMediaQueryWidthBreakpoint] constant the given [width]
/// value falls within.
///
/// Perfect for checking what Bootstrap breakpoint the value of [ResizeSensorEvent.newWidth] falls within.
///
/// __Example:__
///
///     (ResizeSensor()..onResize = handleResize)(
///       YourComponent()()
///     );
///
///     void handleResize(ResizeSensorEvent event) {
///       setState(newState()..breakpoint = getBsWidthBreakpoint(event.newWidth));
///     }
BsMediaQueryWidthBreakpoint getBsWidthBreakpoint(int width) {
  return bsMediaQueryWidthBreakpoints.firstWhere(
      (breakpoint) => (width >= breakpoint.minWidth && width < breakpoint.maxWidth)
  );
}
