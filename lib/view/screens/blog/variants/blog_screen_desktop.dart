import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/blog_screen_controller.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/strings/blog_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';
import 'package:my_site/view/components/blog/desktop/blog_item.dart';
import 'package:my_site/view/components/home/desktop/nav_bar_desktop.dart';

import '../../../../resources/colors/colors.dart';

class BlogScreenDesktop extends StatelessWidget {
  const BlogScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    BlogController controller = Get.put(BlogController());
    ScrollController scrollController = ScrollController();
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120), child: NavBarDesktop()),
        backgroundColor: ProjectColors.backGroundColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: GlobalDims.paddingHoriz,right: GlobalDims.paddingHoriz,top: 20,),
                child: Obx(()=>Text("${BlogScreenString.heading} (${controller.list.length})", style: ProjectTextStyles.dialogHeader,)),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: GlobalDims.paddingHoriz, vertical: 20),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.trackpad
                    }),
                    child: Obx(
                      () => ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) =>
                              BlogItem(blog: controller.list[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 20,
                              ),
                          itemCount: controller.list.length),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
