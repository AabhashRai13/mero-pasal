import 'package:get/state_manager.dart';
import 'package:pasal/app/constants/enums.dart';

class BaseController extends GetxController {
  final _state = ViewState.idle.obs;

  ViewState get state => _state.value;

  void setState(ViewState newState) {
    _state.value = newState;
  }
}
