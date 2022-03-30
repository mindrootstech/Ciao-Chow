import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController{

  var imagePath = ''.obs;

  Future<void> getCameraImage() async {

    PickedFile image = (await ImagePicker.platform.pickImage(
    source: ImageSource.camera,
        imageQuality: 25,
    ))!;
    var imageName = image.path.split('/').last;
    imagePath.value = image.path;
    // getUploadImage(image.path, imageName);


  }

  Future<void> getGalleryImage() async {
    PickedFile? image = await ImagePicker.platform
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    var imageName = image!.path.split('/').last;
    // getUploadImage(image.path, imageName);
  }


}