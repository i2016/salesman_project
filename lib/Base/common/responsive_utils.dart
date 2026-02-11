import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Responsive utility class for handling different screen sizes
/// Supports both tablet and mobile layouts
class ResponsiveUtils {
  /// Check if current device is a tablet
  static bool isTablet(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth >= 600;
  }

  /// Check if current device is a mobile phone
  static bool isMobile(BuildContext context) {
    return !isTablet(context);
  }

  /// Check if device is in landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  /// Check if device is in portrait mode
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  /// Determine if should use single column layout (for mobile)
  static bool shouldUseSingleColumn(BuildContext context) {
    return isMobile(context) || (isTablet(context) && isPortrait(context));
  }
}

/// Extension on BuildContext for easier access to responsive utilities
extension ResponsiveContext on BuildContext {
  bool get isTablet => ResponsiveUtils.isTablet(this);
  bool get isMobile => ResponsiveUtils.isMobile(this);
  bool get isLandscape => ResponsiveUtils.isLandscape(this);
  bool get isPortrait => ResponsiveUtils.isPortrait(this);
  bool get shouldUseSingleColumn => ResponsiveUtils.shouldUseSingleColumn(this);
  
  double widthPercent(double percent) => MediaQuery.of(this).size.width * (percent / 100);
  double heightPercent(double percent) => MediaQuery.of(this).size.height * (percent / 100);
}
