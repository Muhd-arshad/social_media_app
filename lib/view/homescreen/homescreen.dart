import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/controller/home_controller.dart';
import 'package:social_media_app/view/profile/screen_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontroller = Provider.of<HomeController>(context);
    homecontroller.scrollController.addListener(() {
      if (homecontroller.scrollController.position.pixels ==
          homecontroller.scrollController.position.maxScrollExtent) {
        homecontroller.loadMorePosts();
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Consumer<HomeController>(
        builder: (context, provider, child) {
          return provider.loading == true
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  controller: provider.scrollController,
                  itemCount: provider.postlist.length,
                  itemBuilder: (BuildContext context, int index) {
                    //final docs =provider.data!.docs[index];
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Post ${index + 1}',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8.0),
                          Text(provider.postlist[index].name),
                          const SizedBox(height: 8.0),
                          Image.network(provider.postlist[index].image,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ScreenProfile(),
          ),
      
        );
        }
      ),
    );
  }
}
