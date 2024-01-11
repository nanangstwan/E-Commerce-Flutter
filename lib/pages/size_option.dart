import 'package:ecommerce/dimensions.dart';
import 'package:ecommerce/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsController extends GetxController {
  var selectedSize = SizeOption.M.obs; // Gunakan .obs untuk membuatnya reactive

  void setSelectedOption(SizeOption option) {
    selectedSize.value = option; // Mengatur nilai pilihan
  }
}

class OptionsPage extends StatelessWidget {
  final OptionsController optionsController = Get.put(OptionsController());
  bool isSelected = false;

  void colorButton () {
    if (isSelected) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: Dimensions.screenWidth/3,
                  child: ElevatedButton(
                    onPressed: () {
                      optionsController.setSelectedOption(SizeOption.M);
                    },
                    child: const Text('M'),
                  ),
                ),
                SizedBox(
                  width: Dimensions.screenWidth/3,
                  child: ElevatedButton(
                    onPressed: () {
                      optionsController.setSelectedOption(SizeOption.L);
                    },
                    child: const Text('L'),
                  ),
                ),
                // ... tombol lainnya
              ],
            ),
             Obx(() {
                  return Text(
                    'Pilihan Pengguna: ${optionsController.selectedSize.value}',
                  );
                }),
          ],
        ),
      ),
    );
  }
}

enum ToggleValue { first, second, third }

class ToggleController extends GetxController {
  var selectedValue = ToggleValue.first.obs;

  void updateSelectedValue(ToggleValue value) {
    selectedValue.value = value;
  }
}

class MyCoba extends StatelessWidget {
  const MyCoba({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Toggle Buttons'),
        ),
        body: Center(
          child: GetBuilder<ToggleController>(
            init: ToggleController(),
            builder: (controller) {
              return ToggleButtons(
                children: [
                  const Text('First'),
                  const Text('Second'),
                  const Text('Third'),
                ],
                isSelected: [
                  controller.selectedValue.value == ToggleValue.first,
                  controller.selectedValue.value == ToggleValue.second,
                  controller.selectedValue.value == ToggleValue.third,
                ],
                onPressed: (int index) {
                  if (index == 0) {
                    controller.updateSelectedValue(ToggleValue.first);
                  } else if (index == 1) {
                    controller.updateSelectedValue(ToggleValue.second);
                  } else if (index == 2) {
                    controller.updateSelectedValue(ToggleValue.third);
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}