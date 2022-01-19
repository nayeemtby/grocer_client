import 'package:get/get.dart';
import 'package:grocer_client/api/api.dart';

class ShopController extends GetxController {
  ShopController() {
    getCurrent();
  }
  RxMap<String, dynamic> offers = <String, dynamic>{
    'loading': true,
  }.obs;

  RxMap<String, dynamic> bestselling = <String, dynamic>{
    'loading': true,
  }.obs;

  void getCurrent() {
    getJson('offers').then(
      (value) {
        if (value != null) {
          offers.value = value;
        }
      },
    ).onError(
      (error, stackTrace) async {
        print(error);
      },
    );

    getJson('bestselling').then(
      (value) {
        if (value != null) {
          bestselling.value = value;
        }
      },
    ).onError(
      (error, stackTrace) async {
        print(error);
      },
    );
  }
}
