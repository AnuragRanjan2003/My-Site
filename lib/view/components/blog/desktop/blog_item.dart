import 'package:flutter/material.dart';
import 'package:my_site/model/blog_model.dart';
import 'package:my_site/resources/styles/text_styles.dart';

class BlogItem extends StatelessWidget {
  final DisplayBlog blog;

  const BlogItem({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      elevation: 7,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: [
            Text(
              blog.date,
              style: ProjectTextStyles.date,
            ),
            Text(
              blog.title,
              style: ProjectTextStyles.header,
            ),
            Text(blog.description, style: ProjectTextStyles.bodyDark),
            InkWell(
                onTap: () {},
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: const Text(
                  "Read More",
                  style: ProjectTextStyles.highLightedText,
                ))
          ],
        ),
      ),
    );
  }
}
