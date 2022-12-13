import 'package:autoparts/providers/add/add_car_form_provider.dart';
import 'package:autoparts/services/services.dart';
import 'package:autoparts/ui/input_decorations.dart';
import 'package:autoparts/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carService = Provider.of<CarsService>(context);

    return ChangeNotifierProvider(
      create: (_) => AddCarFormProvider(carService.selectedCar),
      child: _ProductScreenBody(carService: carService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.carService,
  }) : super(key: key);

  final CarsService carService;

  @override
  Widget build(BuildContext context) {
    final carForm = Provider.of<AddCarFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: carService.selectedCar.image),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new,
                          size: 40, color: Colors.white),
                    )),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final PickedFile? pickedFile = await picker.getImage(
                            // source: ImageSource.gallery,
                            source: ImageSource.camera,
                            imageQuality: 100);

                        if (pickedFile == null) {
                          print('No seleccionó nada');
                          return;
                        }

                        carService.updateSelectedProductImage(pickedFile.path);
                      },
                      icon: const Icon(Icons.camera_alt_outlined,
                          size: 40, color: Colors.white),
                    ))
              ],
            ),
            _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: carService.isSaving
            ? null
            : () async {
                if (!carForm.isValidForm()) return;

                final String? imageUrl = await carService.uploadImage();

                if (imageUrl != null) carForm.car.img = imageUrl;

                await carService.saveOrCreateProduct(carForm.car);
              },
        child: carService.isSaving
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(Icons.save_outlined),
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final carForm = Provider.of<AddCarFormProvider>(context);
    final car = carForm.car;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: carForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFormField(
                enabled: car.id == null ? true : false,
                initialValue: car.id,
                onChanged: (value) => car.name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Car Name', labelText: 'Name:'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: car.model,
                onChanged: (value) => car.model = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El modelo es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Dodge', labelText: 'Model:'),
              ),
              const SizedBox(height: 30),
              TextFormField(
                initialValue: car.year,
                maxLength: 4,
                keyboardType: TextInputType.number,
                onChanged: (value) => car.year = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El año es obligatorio';
                  }
                  if (value.length < 4) {
                    return "Son 4 numeros";
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Car Year', labelText: 'Year:'),
              ),
              const SizedBox(height: 30),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(0, 5),
              blurRadius: 5,
            )
          ]);
}
