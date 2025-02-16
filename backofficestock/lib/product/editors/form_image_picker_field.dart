import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/service/app_service.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class FormImagePicker extends StatelessWidget {
  final String? initialValue;
  const FormImagePicker({super.key, this.initialValue});

  @override
  Widget build(BuildContext context) {
    FormImagePickerProvider provider = context.watch();

    Widget noImage() {
      return initialValue == null || initialValue == ""
          ? const CustomIcon(
              icon: Iconsax.camera,
              size: 48,
              color: AppColors.blue,
            )
          : Container(
              width: context.dynamicWidth(0.2),
              height: context.dynamicHeight(0.3),
              decoration: BoxDecoration(
                  borderRadius: CustomRadius.radius6,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image:
                          NetworkImage("${AppService.cdnUrl}/$initialValue"))),
            );
    }

    Widget selectedImage() {
      return Align(
        child: Container(
          width: context.dynamicWidth(0.2),
          height: context.dynamicHeight(0.3),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColors.lightGrey),
              borderRadius: CustomRadius.radius6,
              image: DecorationImage(
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                      AppColors.white.withOpacity(0.5), BlendMode.modulate),
                  image: MemoryImage(provider.imageFile.first.bytes!))),
          child: Align(
            alignment: Alignment.topRight,
            child: CustomPaddings.customPadding(
                value: 4.0,
                child: CustomIcon(
                  icon: CupertinoIcons.xmark,
                  size: 28,
                  color: AppColors.black,
                  onTap: () => provider.deleteSelectedImage(),
                )),
          ),
        ),
      );
    }

    return InkWell(
      onTap: () => provider.uploadImage(),
      child: Container(
          height: context.dynamicHeight(0.25),
          width: context.dynamicWidth(1),
          padding: const ConstEdgeInsets.padding20(),
          child: provider.imageFile.isEmpty ? noImage() : selectedImage()),
    );
  }
}

class FormImagePickerProvider extends ChangeNotifier {
  List<PlatformFile> imageFile = [];

  void uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'jpg',
        'png',
        'jpeg',
      ],
      withData: true,
    );
    if (result == null) return;
    imageFile = result.files;
    notifyListeners();
  }

  void deleteSelectedImage() async {
    imageFile = [];
    notifyListeners();
  }
}
