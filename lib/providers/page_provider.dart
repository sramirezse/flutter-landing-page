import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  final List<String> _pages = [
    'home',
    'contact',
    'about',
    'pricing',
    'location'
  ];
  int _currentIndex = 0;
  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    html.document.title = routeName;
    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();
      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        html.document.title = _pages[index];

        _currentIndex = index;
      }
    });
  }

  int getPageIndex(String routeName) {
    return (!_pages.contains(routeName)) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    // final routeName = _pages[index];
    // print(routeName);
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
