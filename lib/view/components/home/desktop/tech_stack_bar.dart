import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/tech_bar_controller.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';

import '../../../../model/tech_item.dart';

class TechStackBar extends StatelessWidget {
  const TechStackBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TechBarController controller = Get.put(TechBarController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GlobalDims.paddingHoriz),
      child: Obx(
        () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                controller.list.length,
                (index) =>
                    techItem(controller.list[index], controller, index))),
      ),
    );
  }

  Widget techItem(TechItem item, TechBarController c, int index) {
    return Tooltip(
        message: item.name,
        child: Image(
          image: item.colorImage,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ));
  }
}
