import 'package:ecommerce/Constants/Enums.dart';
import 'package:flutter/cupertino.dart';

class Devices extends StatelessWidget {
  const Devices({super.key, required this.mobile, required this.desktop});

  final Widget mobile;
  final Widget desktop;
  @override
  Widget build(BuildContext context) {
    return IsMobile(context)
        ? mobile
        : IsDesktop(context)
            ? desktop
            : Container();
  }

  static Map<DevicesType, int> DevicesMaxWidth = {
    DevicesType.mobil: 900,
    DevicesType.tablet: 1200
  };

  static bool IsMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <=
        DevicesMaxWidth[DevicesType.mobil]!;
  }

  static bool IsTablet(BuildContext context) {
    return MediaQuery.of(context).size.width <=
        DevicesMaxWidth[DevicesType.tablet]!;
  }

  static bool IsDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >
        DevicesMaxWidth[DevicesType.tablet]!;
  }
}
