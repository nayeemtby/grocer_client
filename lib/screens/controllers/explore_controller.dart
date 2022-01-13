import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ExploreController extends GetxController {
  RxBool searchActive = false.obs;
  bool searchValueEmpty = true;
  bool searchBarFocused = false;

  TextEditingController searchTextController = TextEditingController();
  late AnimationController titleAnimationController;
  late AnimationController iconAnimationController;

  void hideSearch() {
    searchTextController.clear();
    searchActive.value = false;
  }

  void searchFocusChangeHandler(bool focused) {
    searchBarFocused = focused;
    if (focused) {
      titleAnimationController.animateTo(0);
    } else if (!searchActive.value) {
      titleAnimationController.animateTo(1);
    }
    shouldToggleSearch();
  }

  void searchValueChangeHandler(String value) {
    searchValueEmpty = value.isEmpty;
    shouldToggleSearch();
  }

  void shouldToggleSearch() {
    if (!searchValueEmpty) {
      searchActive.value = true;
      iconAnimationController.animateTo(1);
    } else {
      searchActive.value = false;
      iconAnimationController.animateTo(0);
    }
  }
}
