import 'package:get/get.dart';

class Container_Controller extends GetxController{
  RxDouble opecity = .4.obs;

  void opacityChange(double value){
    opecity.value = value;
  }
}