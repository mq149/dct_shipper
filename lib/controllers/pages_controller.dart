import '../bases/base_controller.dart';

class PagesController extends BaseController {
  int currentIndex;
  PagesController({required this.currentIndex});

  void navbarItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
