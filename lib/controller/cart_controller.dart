import 'package:get/get.dart';

class CartController extends GetxController {
  var quantity = 0.obs;
  var items = 0.obs;

  void setQuantity(bool increment) {
    if (increment) {
     checkquatity(quantity.value++); 
    } else {
      checkquatity(quantity.value--);
    }
  }

  checkquatity(int item) {
    if (item < 0) {
      return 0;
    } else if (quantity > 10) {
      return 10;
    } else {
      return item;
    }
  }
}
