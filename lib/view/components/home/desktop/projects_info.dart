import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/project_controller.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/strings/home_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';

import '../../../../model/project_model.dart';

class ProjectsInfo extends StatelessWidget {
  const ProjectsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectController controller = Get.put(ProjectController());
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GlobalDims.paddingHoriz),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideInfo(),
          SizedBox(
            width: 70,
          ),
          Expanded(child: Projects())
        ],
      ),
    );
  }
}

class SideInfo extends StatelessWidget {
  const SideInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          HomeScreenStrings.experienceHead,
          style: ProjectTextStyles.highLightedTitle,
        ),
        Text(
          HomeScreenStrings.experienceBody,
          style: ProjectTextStyles.subTitle,
        ),
      ],
    );
  }
}

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectController controller = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          HomeScreenStrings.projectsHead,
          style: ProjectTextStyles.subHeader,
        ),
        const SizedBox(
          height: 50,
        ),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  controller.projectList.length,
                  (index) => Container(
                    margin: EdgeInsets.only(right: 20),
                    child: projectItem(
                          controller.projectList[index],
                          controller,
                          index,
                        ),
                  )),
            ))
      ],
    );
  }
}

Widget projectItem(Project item, ProjectController c, int index) {
  return Card(
    elevation: 10,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    child: InkWell(
      onTap: () {},
      onHover: (h) {
        debugPrint("hovered project");
        if (h) {
          c.hovered.value = index;
        } else {
          c.hovered.value = -1;
        }
      },
      child: Container(
        color: (c.hovered.value == index)
            ? ProjectColors.highLightColor
            : ProjectColors.disabledColor,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Wrap(
          direction: Axis.vertical,
          children: [
            const SizedBox(
              width: 150,
              height: 120,
            ),
            Image(
              image: item.image,
              height: 30,
              width: 30,
            ),
            Text(
              item.name,
              style: (c.hovered.value == index)
                  ? ProjectTextStyles.onItemTitle
                  : ProjectTextStyles.onDisabledItemTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.discription,
              style: (c.hovered.value == index)
                  ? ProjectTextStyles.onItemStyle
                  : ProjectTextStyles.onDisabledItemStyle,
            )
          ],
        ),
      ),
    ),
  );
}
