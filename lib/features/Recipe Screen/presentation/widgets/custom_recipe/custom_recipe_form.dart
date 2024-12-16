import 'package:my_profile_app/features/Recipe%20Screen/presentation/controller/form_controller.dart';
import 'package:my_profile_app/features/Recipe%20Screen/presentation/state/state.dart';
import 'package:my_profile_app/features/Recipe%20Screen/presentation/widgets/components/textfield_method.dart';
import 'package:my_profile_app/features/utils/exporter.dart';

class CustomRecipeForm extends ConsumerWidget {
  const CustomRecipeForm({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final currentStep = ref.watch(stepProvider);
    // print(currentStep);
    final stepController = ref.read(stepProvider.notifier);
    final formState = ref.watch(foodformProvider);
    final formController = ref.read(foodformProvider.notifier);
    print(formState?.toRawJson());
    return Scaffold(
      appBar: AppBar(),
      body: Form(
          child: Column(
        children: [
          //
          Expanded(
            child: Stepper(
                type: StepperType.horizontal,
                currentStep: currentStep,
                onStepContinue: () {
                  stepController.continueStep();
                },
                onStepTapped: (value) {},
                steps: [
                  Step(
                      title: Text("Basic"),
                      content: Column(
                        children: [
                          formTextfield(label: "Title"),
                          formTextfield(label: "Servings"),
                          formTextfield(label: "Custom Food Box ID"),
                          formTextfield(label: "Instructions"),
                          formTextfield(label: "Available"),
                          formTextfield(label: "Rating"),
                          formTextfield(label: "Image"),
                        ],
                      )),
                  Step(
                      title: Text("Nutrition Info"),
                      content: Column(
                        children: [
                          nutritionForm(label: "Calories"),
                          nutritionForm(label: "Salt"),
                          nutritionForm(label: "Sugar"),
                          nutritionForm(label: "Protein"),
                          // nutritionForm(label: "Diets"),
                          MetaField(
                            controller: TextEditingController(),
                            formController: formController,
                            data: formState?.meta?.diets,
                          ),
                          MetaField(
                            controller: TextEditingController(),
                            formController: formController,
                            isDiet: false,
                            data: formState?.meta?.intolerances,
                          )
                        ],
                      )),
                ]),
          )
        ],
      )),
    );
  }

  Row nutritionForm({required String label}) {
    return Row(
      children: [
        Expanded(flex: 2, child: formTextfield(label: label)),
        Expanded(
          flex: 1,
          child: DropdownButtonFormField(items: [
            DropdownMenuItem(
              child: Text("gm"),
              value: "gm",
            ),
            DropdownMenuItem(
              child: Text("kcal"),
              value: "kcal",
            )
          ], onChanged: (value) {}),
        )
      ],
    );
  }
}

class MetaField extends StatelessWidget {
  const MetaField(
      {super.key,
      required this.controller,
      required this.formController,
      this.isDiet = true,
      this.data});
  final TextEditingController controller;
  final FoodFormController formController;
  final bool isDiet;
  final List<String>? data;

  @override
  Widget build(BuildContext context) {
    final list = data ?? [];
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: formTextfield(
                    label: isDiet ? "Diet" : "Intolerance",
                    controller: controller)),
            IconButton(
                onPressed: () {
                  formController.addMeta(
                      diet: isDiet ? controller.text : null,
                      intolerance: isDiet ? null : controller.text);
                },
                icon: Icon(Icons.add))
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
              trailing: IconButton(
                  onPressed: () {
                    formController.removeMeta(
                        diet: isDiet ? list[index] : null,
                        intolerance: isDiet ? null : list[index]);
                  },
                  icon: Icon(Icons.clear)),
            );
          },
          itemCount: data?.length ?? 0,
        )
      ],
    );
  }
}
// final int? id;
//   final String? title;
//   final int? servings;
//   final String? customFoodBoxId;
//   final Nutrition? nutrition;
//   final Meta? meta;
//   final String? imageUrl;
//   final String? instructions;
//   final bool? available;
//   final double? rating;