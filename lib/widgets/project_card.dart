import 'package:flutter/material.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/utils/project_utils.dart';

import 'package:url_launcher/url_launcher.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({super.key, required this.project});
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 310,
      width: 260,
      decoration: BoxDecoration(
        color: CustomColor.bgLight2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //project image
          Image.asset(
            project.image,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          //title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          //subtitle
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          Spacer(),
          // card footer
          Container(
            color: CustomColor.bgLight1,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              children: [
                const Text(
                  'Available on:',
                  style: TextStyle(
                    fontSize: 10,
                    color: CustomColor.yellowSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                if (project.androidLink != null)
                  if (project.androidLink != null)
                    InkWell(
                      onTap: () => _launchURL(project.androidLink!),
                      child: Image.asset('assets/android_icon.png', width: 17),
                    ),
                if (project.iosLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () => _launchURL(project.iosLink!),
                      child: Image.asset('assets/ios_icon.png', width: 19.5),
                    ),
                  ),
                if (project.webLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () => _launchURL(project.webLink!),
                      child: Image.asset('assets/web_icon.png', width: 16.5),
                    ),
                  ),
                if (project.githubLink != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: InkWell(
                      onTap: () => _launchURL(project.githubLink!),
                      child: Image.asset('assets/github.png', width: 16.5),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Não foi possível abrir o link $url');
    }
  }
}
