import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  RxBool showSearch = false.obs;
  RxBool isSearchBarFocused = false.obs;
  TextEditingController searchTextController = TextEditingController();
  late AnimationController titleAnimationController;
  late AnimationController iconAnimationController;
  void hideSearch() {
    searchTextController.clear();
    showSearch.value = false;
  }

  void searchFocusChanged(bool focused) {
    isSearchBarFocused.value = focused;
    if (focused) {
      iconAnimationController.animateTo(1);
      titleAnimationController.animateTo(0);
    } else {
      iconAnimationController.animateTo(0);
      titleAnimationController.animateTo(1);
    }
    shouldShowSearch();
  }

  void shouldShowSearch() {
    if (isSearchBarFocused.value || searchTextController.text.isNotEmpty) {
      showSearch.value = true;
    } else {
      showSearch.value = false;
    }
  }
}
