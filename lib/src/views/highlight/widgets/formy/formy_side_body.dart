import 'package:flutter/material.dart';
import 'package:flutter_formy/flutter_formy.dart';
import 'package:flutter_formy/flutter_formy_generic_validators.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/core/commons/widgets/primary_button.dart';
import 'package:portfolio/core/values/assets.dart';
import 'package:portfolio/core/values/fonts.dart';
import 'package:portfolio/core/values/my_colors.dart';

class FormySideBody extends StatelessWidget {
  FormySideBody({super.key});

  final GroupController group = GroupController(
    key: 'formy',
    fields: [
      FieldConfig<String>(
          key: 'coolText',
          validators: [IsRequired(message: 'Campo obrigatório')]),
      FieldConfig<bool>(key: 'enjoying', validators: [IsRequired()]),
      const FieldConfig<Color>(
          key: 'formyColor', initialValue: Color(0xff6DFFC5)),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldSelector<Color>(
          controller: group.field('formyColor'),
          selector: (field) => field.value,
          child: (value) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: SvgPicture.asset(
              Assets.formy,
              colorFilter: ColorFilter.mode(
                value,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyColors.altBackgroud,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextInput(
                controller: group.field('coolText'),
                label: 'Um texto legal',
                hintText: 'Digite um texto legal',
              ),
              const SizedBox(height: 24),
              CheckboxInput(
                controller: group.field('enjoying'),
                child: Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Ta gostando do portfolio? ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.white),
                      children: const [
                        TextSpan(
                            text: '(Obrigatório)',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 14))
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              ColorDotPickerField(
                controller: group.field('formyColor'),
                colors: const [
                  Color(0xffBD2E2E),
                  Color(0xffBDBD2E),
                  Color(0xff6DFFC5),
                  Color(0xff2E6CBD),
                  Color(0xffBD2E9E),
                ],
                label: 'Altere a cor do Formy!',
              ),
              const SizedBox(height: 24),
              GroupSelector(
                controller: group,
                selector: (group) => group.isValid,
                child: (value) => PrimaryButton(
                  text: 'Ver código',
                  onPressed: value ? () {} : null,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TextInput extends TextFieldBuilder {
  final String label;
  final String? hintText;
  TextInput({
    super.key,
    required super.controller,
    required this.label,
    this.hintText,
  }) : super(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
              fontFamily: Fonts.poppins,
              fontWeight: FontWeight.w700,
            ),
          ),
          builder: (context, field, focusNode, textEditingController, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                child!,
                const SizedBox(height: 4),
                TextFormField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  onChanged: field.update,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: hintText,
                    errorText: field.firstError,
                  ),
                )
              ],
            );
          },
        );
}

class CheckboxInput extends FieldBuilder<bool> {
  CheckboxInput({super.key, required super.controller, super.child})
      : super(
          builder: (context, field, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(value: field.value, onChanged: field.update),
                ),
                const SizedBox(width: 5),
                child!
              ],
            );
          },
        );
}

class ColorDotPickerField extends FieldBuilder<Color> {
  final String label;
  final List<Color> colors;
  ColorDotPickerField({
    super.key,
    required super.controller,
    required this.label,
    super.buildWhen,
    required this.colors,
  }) : super(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
              fontFamily: Fonts.poppins,
              fontWeight: FontWeight.w700,
            ),
          ),
          builder: (context, field, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                child!,
                const SizedBox(height: 4),
                Wrap(
                  spacing: 8,
                  children: colors.map((color) {
                    final isSelected = field.value == color;
                    return GestureDetector(
                      onTap: () => field.update(color),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                          border: isSelected
                              ? Border.all(color: Colors.white, width: 3)
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        );
}
