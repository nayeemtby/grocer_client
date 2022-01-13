import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocer_client/api/data.dart';

class ExploreController extends GetxController {
  RxBool searchActive = false.obs;
  bool searchValueEmpty = true;
  bool searchBarFocused = false;
  RxList searchList = [].obs;

  TextEditingController searchTextController = TextEditingController();
  late AnimationController titleAnimationController;
  late AnimationController iconAnimationController;

  void closeSearch() {
    searchTextController.clear();
    searchValueChangeHandler('');
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
    if (value.isNotEmpty) {
      search(value).then(manageSearch);
    }
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

  void manageSearch(Map<String, dynamic>? result) {
    if (result != null) {
      searchList.value = result.values.toList();
    }
  }
}
