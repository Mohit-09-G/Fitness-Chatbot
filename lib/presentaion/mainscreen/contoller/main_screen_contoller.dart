import 'package:get/get.dart';

class MainScreenContoller extends GetxController {
  RxInt selectedIndex = 0.obs;

  updateIndex(int index) {
    selectedIndex.value = index;
  }
}
