import 'package:get/get.dart';

class Counter_Controller extends GetxController{
  RxInt counter = 20.obs;

  void incrementCounter (){
    counter++;
  }
}