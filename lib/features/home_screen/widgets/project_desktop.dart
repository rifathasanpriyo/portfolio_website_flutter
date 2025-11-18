import 'package:flutter/material.dart';

import '../../../core/constants/app_url_launch.dart';
import '../data/models/project_model.dart';

class ProjectsSection extends StatelessWidget {
  final double screenWidth;
  const ProjectsSection({Key? key, required this.screenWidth})
    : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Notable Projects",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          // Use Wrap for responsive grid-like layout on web
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1000),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: projects.map((proj) {
                return GestureDetector(
                  onTap: () => openInNewTab(context, proj.url),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      width: 300,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // image: make it fit container width and fixed height
                          if (proj.assetImage.isNotEmpty)
                            SizedBox(
                              height: 140,
                              width: double.infinity,
                              child: Image.asset(
                                proj.assetImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  proj.title,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  proj.subtitle,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Open project →',
                                  style: TextStyle(
                                    color: Colors.blue[300],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
