
import 'package:gap/gap.dart';

extension GapExtension on int {
  Gap get g => Gap(toDouble());
}
