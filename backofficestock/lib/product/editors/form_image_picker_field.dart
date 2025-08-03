import 'package:backofficestock/core/extension/context_extension.dart';
import 'package:backofficestock/core/widget/padding.dart';
import 'package:backofficestock/core/widget/radius.dart';
import 'package:backofficestock/product/constants/api_constants.dart';
import 'package:backofficestock/product/widgets/custom_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class FormImagePicker extends StatelessWidget {
  const FormImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<FormImagePickerProvider>().uploadImage(),
      child: Container(
        height: context.dynamicHeight(0.25),
        width: context.dynamicWidth(1),
        padding: const ConstEdgeInsets.padding20(),
        child: Consumer<FormImagePickerProvider>(
          builder: (context, provider, _) {
            if (provider.imageFile.isEmpty) {
              return provider.initialImageValue == null ||
                      provider.initialImageValue == ""
                  ? const CustomIcon(
                      icon: Iconsax.camera,
                      size: 48,
                      color: AppColors.blue,
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: Stack(children: [
                        Container(
                          width: context.dynamicWidth(0.2),
                          height: context.dynamicHeight(0.3),
                          decoration: BoxDecoration(
                            borderRadius: CustomRadius.radius6,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(provider.initialImageValue!),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: CustomIcon(
                            onTap: () =>
                                provider.setInitialImage(null), // Silme
                            icon: CupertinoIcons.xmark,
                          ),
                        )
                      ]),
                    );
            } else {
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
                          AppColors.white.withAlpha(120), BlendMode.modulate),
                      image: MemoryImage(provider.imageFile.first.bytes!),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomPaddings.customPadding(
                      value: 4.0,
                      child: CustomIcon(
                        icon: CupertinoIcons.xmark,
                        size: 28,
                        color: AppColors.black,
                        onTap: () => provider.deleteSelectedImage(),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class FormImagePickerProvider extends ChangeNotifier {
  List<PlatformFile> imageFile = [];
  String? _initialImageValue;

  String? get initialImageValue => _initialImageValue;

  FormImagePickerProvider({String? initialImageValue}) {
    setInitialImage(initialImageValue);
  }

  void setInitialImage(String? value) {
    _initialImageValue = value;
    notifyListeners();
  }

  void uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'webp'],
      withData: true,
    );
    if (result == null) return;

    imageFile = result.files;
    notifyListeners();
  }

  void deleteSelectedImage() {
    imageFile = [];
    notifyListeners();
  }
}
