import 'package:collection/collection.dart';
import "package:u_i_library_3c2hbt/backend/schema/enums/enums.dart"
    as u_i_library_3c2hbt_enums;
import 'package:ff_commons/flutter_flow/enums.dart';
export 'package:ff_commons/flutter_flow/enums.dart';

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (u_i_library_3c2hbt_enums.ChartDataLabelAlignment):
      return u_i_library_3c2hbt_enums.ChartDataLabelAlignment.values
          .deserialize(value) as T?;
    case (u_i_library_3c2hbt_enums.LegendDirection):
      return u_i_library_3c2hbt_enums.LegendDirection.values.deserialize(value)
          as T?;
    case (u_i_library_3c2hbt_enums.ChartDataLabelPosition):
      return u_i_library_3c2hbt_enums.ChartDataLabelPosition.values
          .deserialize(value) as T?;
    case (u_i_library_3c2hbt_enums.TooltipDisplayMode):
      return u_i_library_3c2hbt_enums.TooltipDisplayMode.values
          .deserialize(value) as T?;
    case (u_i_library_3c2hbt_enums.ChartAlignment):
      return u_i_library_3c2hbt_enums.ChartAlignment.values.deserialize(value)
          as T?;
    case (u_i_library_3c2hbt_enums.AvatarSize):
      return u_i_library_3c2hbt_enums.AvatarSize.values.deserialize(value)
          as T?;
    case (u_i_library_3c2hbt_enums.TooltipPosition):
      return u_i_library_3c2hbt_enums.TooltipPosition.values.deserialize(value)
          as T?;
    default:
      return null;
  }
}
