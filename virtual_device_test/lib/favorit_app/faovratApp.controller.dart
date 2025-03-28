import 'package:get/get.dart';

class FaovratController extends GetxController{
  RxList<String> fruits = ["Apple", "Mango", "Banana", "Orange"].obs;
  RxList favorit = [].obs;

void addFavorit(String value){
  favorit.add(value);
}
  void removeFavorit(String value){
    favorit.remove(value);
  }


}