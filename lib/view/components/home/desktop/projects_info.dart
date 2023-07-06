import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/project_controller.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/strings/home_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';

import '../../../../model/project_model.dart';
import '../../gradient_text.dart';

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
        GradientText(
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
        const GradientText(
          HomeScreenStrings.projectsHead,
          style: ProjectTextStyles.subHeader,
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 250,
          child: Center(
            child: Obx(() => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.projectList.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                  itemBuilder: (context, index) => Obx(() => projectItem(
                      controller.projectList[index], controller, index)),
                )),
          ),
        )
      ],
    );
  }
}

Widget projectItem(Project item, ProjectController c, int index) {
  return Card(
    elevation: 10,
    shape: GlobalDims.roundButton,
    child: InkWell(
      onTap: () {},
      child: Container(
        decoration: GlobalDims.roundContainer,
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Wrap(
          direction: Axis.vertical,
          children: [
             const SizedBox(
              height: 120,
              width: 180,
            ),
            Image(
              image: item.image,
              height: 30,
              width: 30,
            ),
            Text(
              item.name,
              style: ProjectTextStyles.onDisabledItemTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              item.discription,
              style:  ProjectTextStyles.onDisabledItemStyle,
            )
          ],
        ),
      ),
    ),
  );
}
