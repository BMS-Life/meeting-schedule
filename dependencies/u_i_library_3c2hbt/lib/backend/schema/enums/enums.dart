import 'package:collection/collection.dart';
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

enum ChartDataLabelAlignment {
  auto,
  top,
  middle,
  bottom,
  outside,
}

enum LegendDirection {
  left,
  top,
  right,
  bottom,
}

enum ChartDataLabelPosition {
  inside,
  outside,
}

enum TooltipDisplayMode {
  floatAllPoints,
  groupAllPoints,
  nearestPoint,
  none,
}

enum ChartAlignment {
  near,
  center,
  far,
}

enum AvatarSize {
  sm,
  md,
  lg,
  xl,
}

enum TooltipPosition {
  auto,
  pointer,
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (ChartDataLabelAlignment):
      return ChartDataLabelAlignment.values.deserialize(value) as T?;
    case (LegendDirection):
      return LegendDirection.values.deserialize(value) as T?;
    case (ChartDataLabelPosition):
      return ChartDataLabelPosition.values.deserialize(value) as T?;
    case (TooltipDisplayMode):
      return TooltipDisplayMode.values.deserialize(value) as T?;
    case (ChartAlignment):
      return ChartAlignment.values.deserialize(value) as T?;
    case (AvatarSize):
      return AvatarSize.values.deserialize(value) as T?;
    case (TooltipPosition):
      return TooltipPosition.values.deserialize(value) as T?;
    default:
      return null;
  }
}
