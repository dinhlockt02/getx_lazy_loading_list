import 'package:get/get.dart';
import 'package:getx_infinitive_list/app/controller/home_controller.dart';
import 'package:getx_infinitive_list/app/data/provider/api.dart';
import 'package:getx_infinitive_list/app/data/repository/PostRepository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        postRepository: PostRepository(
          apiClient: ApiClient(),
        ),
      ),
    );
  }
}
