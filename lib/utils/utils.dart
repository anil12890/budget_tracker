import 'package:image_picker/image_picker.dart';

getPicture(ImageSource source)
async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile ? pickImage = await _imagePicker.pickImage(source:source);

  if(pickImage !=null)
  {
    return await pickImage.readAsBytes();
  }else
  {
    print('No image is selected');
  }
}