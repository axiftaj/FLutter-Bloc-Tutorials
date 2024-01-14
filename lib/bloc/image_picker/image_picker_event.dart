part of 'image_picker_bloc.dart';

@immutable
abstract class ImagePickerEvent extends Equatable{
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}


class CameraCapture extends ImagePickerEvent {}
class GalleryPicker extends ImagePickerEvent {}



