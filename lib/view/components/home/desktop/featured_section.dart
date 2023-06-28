import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/successful_section_controller.dart';
import 'package:my_site/model/project_model.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/styles/text_styles.dart';

import '../../../../resources/strings/home_screen_strings.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GlobalDims.paddingHoriz),
      child: const Row(
        children: [
          Expanded(child: SuccessfulSection()),
          SizedBox(
            width: 30,
          ),
          Expanded(child: SuccessfulSection())
        ],
      ),
    );
  }
}

class SuccessfulItem extends StatelessWidget {
  final Project project;

  const SuccessfulItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Image(
          height: 300,
          width: 300,
          fit: BoxFit.fill,
          image: project.image,
        ),
        Text(project.discription, style: ProjectTextStyles.body,)
      ],
    );
  }
}

class SuccessfulSection extends StatelessWidget {
  const SuccessfulSection({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessFulSectionController controller =
        Get.put(SuccessFulSectionController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          HomeScreenStrings.successHead,
          style: ProjectTextStyles.header,
        ),
        Card(
          elevation: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: CarouselSlider(
                items: controller.list
                    .map((element) => SuccessfulItem(
                          project: element,
                        ))
                    .toList(),
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true)),
          ),
        )
      ],
    );
  }
}
