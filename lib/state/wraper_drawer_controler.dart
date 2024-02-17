import 'package:get/get.dart';

class WraperDrawerControler extends GetxController {
  var selected_tab = 0.obs;
  var show_drawer = false.obs;

  void hide_drawer() {
    show_drawer.value = false;
  }

  void select_tab(int index, String page_route) {
    selected_tab.value = index;
    show_drawer.value = false;
    Get.toNamed(page_route);
  }
}
