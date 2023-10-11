import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/controller/profile_controller.dart';


class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileController =Provider.of<ProfileController>(context,listen: false);
    profileController.getllProfile();
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.black,
              expandedHeight: 400.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(profileController.name),
                background: Image.network(
                  profileController.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
             SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                children: List.generate(
                  50, 
                  (index) =>const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('john.doe@example.com'),
                  ),
                ),
              ),
             ),
          ],
        ),
      ),
    );
  }
}
