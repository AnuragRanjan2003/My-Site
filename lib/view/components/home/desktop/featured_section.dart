import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/successful_section_controller.dart';
import 'package:my_site/model/project_model.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/styles/text_styles.dart';

import '../../../../others/routes.dart';
import '../../../../resources/strings/home_screen_strings.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("featured built");
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GlobalDims.paddingHoriz),
      child: const Row(
        children: [
          Expanded(child: SuccessfulSection()),
          SizedBox(
            width: 40,
          ),
          Expanded(child: OnGoingSection())
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Image(
          height: 300,
          width: 300,
          fit: BoxFit.fitHeight,
          image: project.image,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          project.discription,
          style: ProjectTextStyles.body,
          textAlign: TextAlign.start,
          softWrap: true,
          maxLines: 5,
        ),
        const SizedBox(height: 40,),
        MaterialButton(
          onPressed: () {},
          highlightElevation: 10,
          hoverElevation: 10,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Wrap(
            direction: Axis.horizontal,
            children: [
              Text("Visit github" , style: ProjectTextStyles.highlightedButtonText),
              SizedBox(width: 20,),
              FaIcon(FontAwesomeIcons.github , color: ProjectColors.highLightColor)
            ],
          ),
        )
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
        const SizedBox(
          height: 30,
        ),
        Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          surfaceTintColor: ProjectColors.backGroundColor,
          child: Container(
            height: 600,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Obx(
              () => CarouselSlider(
                  items: controller.list
                      .map((element) => SuccessfulItem(
                            project: element,
                          ))
                      .toList(),
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: GlobalDims.slideTimeSlow,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true)),
            ),
          ),
        )
      ],
    );
  }
}

class OnGoingSection extends StatelessWidget {
  const OnGoingSection({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessFulSectionController controller =
        Get.put(SuccessFulSectionController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          HomeScreenStrings.ongoingBody,
          style: ProjectTextStyles.subTitle,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            onPressed: () => Get.toNamed(Routes.blogScreen),
            child: const Wrap(
              direction: Axis.horizontal,
              spacing: 10,
              children: [
                Text(
                  HomeScreenStrings.ongoingButtonText,
                  style: ProjectTextStyles.highlightedButtonText,
                ),
                Icon(
                  Icons.arrow_right_alt_sharp,
                  color: ProjectColors.highLightColor,
                )
              ],
            )),
        const SizedBox(
          height: 50,
        ),
        const Text(
          HomeScreenStrings.onGoingHead,
          style: ProjectTextStyles.header,
        ),
        const SizedBox(
          height: 30,
        ),
        Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)),
          surfaceTintColor: ProjectColors.backGroundColor,
          child: Container(
            height: 600,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Obx(
              () => CarouselSlider(
                  items: controller.list
                      .map((element) => onGoingItems(element))
                      .toList(),
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: GlobalDims.slideTimeFast,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true)),
            ),
          ),
        )
      ],
    );
  }
}

Widget onGoingItems(Project project) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: double.infinity,
        ),
        Image(
          height: 300,
          width: 300,
          fit: BoxFit.fitHeight,
          image: project.image,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          project.discription,
          style: ProjectTextStyles.body,
          textAlign: TextAlign.start,
          softWrap: true,
          maxLines: 5,
        ),
        const SizedBox(
          height: 20,
        ),
        MaterialButton(
          onPressed: () {},
          highlightElevation: 10,
          hoverElevation: 10,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: const Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              Text("Visit github" , style: ProjectTextStyles.highlightedButtonText),
              FaIcon(FontAwesomeIcons.github , color: ProjectColors.highLightColor)
            ],
          ),
        )
      ],
    );
