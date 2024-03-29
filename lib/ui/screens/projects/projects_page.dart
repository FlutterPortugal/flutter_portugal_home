import 'package:flutter/material.dart';
import 'package:flutter_portugal_home/provider/projects_provider.dart';
import 'package:flutter_portugal_home/resources/dimensions.dart';
import 'package:flutter_portugal_home/resources/strings.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/app_bar.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/drawer.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/footer.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/seperator.dart';
import 'package:provider/provider.dart';

import 'components/project_tile.dart';
import 'components/top_text.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projects = Provider.of<ProjectsProvider>(context);
    projects.getProjects();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar.appBar(context),
      drawer: MyDrawer.drawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(bodyPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TopText(projectsTitle, projectsDescription, projectsGitHub),
              SeperatorRow(),
              for (int i = 0; i < projects.data.length; i++) ...[
                Padding(
                  padding:
                      const EdgeInsets.fromLTRB(0, 0, 0, projectsBottomPadding),
                  child: ProjectTile(
                      i,
                      projects.data[i].name,
                      projects.data[i].description,
                      projects.data[i].url,
                      projects.data[i].image),
                ),
              ],
            ],
          ),
        ),
      ),
      persistentFooterButtons: Footer.footer(context),
    );
  }
}
