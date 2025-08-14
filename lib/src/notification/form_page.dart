import 'dart:io';
import 'package:app/core/network/dio_models.dart';
import 'package:app/core/utils/validators/rules/required_rule.dart';
import 'package:app/core/utils/widgets/buttons/filled_loading_button.dart';
import 'package:app/src/notification/components/confirmation_dialog.dart';
import 'package:app/src/notification/components/file_selection.dart';
import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    final titleTextController = TextEditingController(text: 'Premotion Request');
    final descriptionTextController = TextEditingController(
      text: 'This is a request for a promotion based on performance and contributions.',
    );
    final typeController = TextEditingController(text: 'Select Type');
    File? selectedFile;
    SvgPicture sendArrow() {
      final TextDirection direction = Directionality.of(context);
      if (direction == TextDirection.rtl) {
        return SvgPicture.asset('assets/svg/send_arrow_left.svg');
      } else {
        return SvgPicture.asset('assets/svg/send_arrow_right.svg');
      }
    }

    void showConfirmationDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return ConfirmationDialog(
            onApprove: () {},
            title: titleTextController.text.trim(),
            content: descriptionTextController.text.trim(),
            type: typeController.text.trim(),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FilledLoadingButton(
        isLoading: false,
        onPressed: () async {
          if (key.currentState?.validate() ?? false) {
            showConfirmationDialog();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(context.l10n.submit), Gap(Insets.small), sendArrow()],
        ),
      ),
      body:
          Form(
            key: key,
            child: SingleChildScrollView(
              child: ColumnPadded(
                crossAxisAlignment: CrossAxisAlignment.start,
                gap: Insets.medium,
                children: [
                  Text(
                    context.l10n.sendRequest,
                    style: context.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(context.l10n.sendRequestDescription, style: Theme.of(context).textTheme.bodyMedium),
                  CustomTextFormField(
                    rules: [RequiredRule()],
                    controller: titleTextController,
                    hintText: context.l10n.title,
                  ),
                  CustomTextFormField(
                    rules: [RequiredRule()],
                    controller: descriptionTextController,
                    hintText: context.l10n.description,
                    maxLines: null,
                  ),
                  CustomTextFormField(
                    readOnly: true,
                    rules: [RequiredRule()],
                    controller: typeController,
                    hintText: context.l10n.type,
                    suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('context.l10n.selectType'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  ListTile(
                                    title: Text('context.l10n.type1'),
                                    onTap: () {
                                      typeController.text = 'context.l10n.type1';
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text('context.l10n.type2'),
                                    onTap: () {
                                      typeController.text = 'context.l10n.type2';
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  FileSelection(
                    onFileSelected: (file) {
                      selectedFile = file;
                    },
                    text: context.l10n.uploadAttachment,
                  ),
                  const SizedBox(height: Insets.medium),
                ],
              ),
            ),
          ).withPadding(
            EdgeInsets.only(
              bottom: context.height * .04, // Adjusted for bottom padding
            ),
          ),
    );
  }
}
