import 'package:flutter/material.dart';
import 'package:flutter_portugal_home/provider/about_provider.dart';
import 'package:flutter_portugal_home/resources/dimensions.dart';
import 'package:flutter_portugal_home/resources/strings.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/app_bar.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/drawer.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/footer.dart';
import 'package:flutter_portugal_home/ui/screens/widgets/seperator.dart';
import 'package:provider/provider.dart';

import 'components/organizer_tile.dart';
import 'components/top_text.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final about = Provider.of<AboutProvider>(context);
    about.getOrganizer();
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
              TopText(aboutTitle, aboutDescription),
              SeperatorRow(),
              Wrap(
                children: [
                  Container(),
                  for (int i = 0; i < about.data.length; i++) ...[
                    OrganizerTile(
                      about.data[i].name,
                      about.data[i].description,
                      about.data[i].image,
                      about.data[i].github,
                      about.data[i].twitter,
                      about.data[i].linkedin,
                    ),
                  ]
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: Footer.footer(context),
    );
  }
}
