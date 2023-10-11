import 'package:flutter/material.dart';
import 'package:social_media_app/service/firebaseservices.dart';

class HomeController extends ChangeNotifier {
  List<dynamic> postlist = [];
  FireService fireService = FireService();
  int loadedItems = 0;

  Future<void> getallTask() async {
    // postlist.clear();
    debugPrint('CAlling ====');
    final List output = await fireService.fetchdata();
    debugPrint(output.toString());
    postlist.addAll(output.take(6));
    debugPrint('list=================$postlist');
  }

  final ScrollController _scrollController = ScrollController();
  bool _loading = false;

  ScrollController get scrollController => _scrollController;
  bool get loading => _loading;

  void loadMorePosts() async {
    // postlist.clear();
    if (!_loading) {
      _loading = true;
      notifyListeners();

      // Simulate loading delay (replace with actual data fetching)
      await Future.delayed(const Duration(seconds: 2));
      final List output = await fireService.fetchdata();
      postlist.addAll(output.take(6));
      _loading = false;
      notifyListeners();
    }
  }
}
