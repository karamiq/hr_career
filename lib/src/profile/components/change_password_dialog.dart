import 'package:app/common_lib.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/core/utils/validators/rules/required_rule.dart';
import 'package:app/core/utils/validators/rules/min_length_rule.dart';
import 'package:app/core/utils/validators/validation_rule.dart';
import 'package:app/core/utils/custom_text_feileds.dart/password_text_form_feild.dart';
import 'package:app/src/components/gardient_button.dart';
import 'package:app/src/notification/components/app_dialog.dart';
import 'package:flutter/material.dart';

// Custom validation rule for password matching
class _MatchPasswordRule extends ValidatorRule {
  final TextEditingController passwordController;

  _MatchPasswordRule(this.passwordController);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'Passwords do not match',
    'ar': 'كلمات المرور غير متطابقة',
  };

  @override
  bool isValid(String? value) {
    return value == passwordController.text;
  }
}

// Custom validation rule for ensuring new password is different from current
class _DifferentPasswordRule extends ValidatorRule {
  final TextEditingController currentPasswordController;

  _DifferentPasswordRule(this.currentPasswordController);

  @override
  Map<String, String> get defaultMessage => {
    'en': 'New password must be different from current password',
    'ar': 'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور الحالية',
  };

  @override
  bool isValid(String? value) {
    return value != currentPasswordController.text;
  }
}

class ChangePasswordDialog extends ConsumerStatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  ConsumerState<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends ConsumerState<ChangePasswordDialog> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _currentPasswordFocus = FocusNode();
  final _newPasswordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _currentPasswordFocus.dispose();
    _newPasswordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _handleChangePassword() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final l10n = context.l10n;

      try {
        // TODO: Implement actual password change logic here
        // Example API call:
        // await ref.read(userClientProvider).changePassword(
        //   currentPassword: _currentPasswordController.text,
        //   newPassword: _newPasswordController.text,
        // );

        await Future.delayed(const Duration(seconds: 2)); // Simulate API call

        if (mounted) {
          Navigator.of(context).pop();
          Utils.showSuccessSnackBar(l10n.passwordChangedSuccessfully);
        }
      } catch (e) {
        if (mounted) {
          Utils.showErrorSnackBar(l10n.failedToChangePassword);
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final l10n = context.l10n;

    return AppDialog(
      title: l10n.changePassword,

      actions: [
        _isLoading
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  gradient: ConstantColors.primaryGradient(),
                  borderRadius: BorderRadius.circular(500),
                ),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(ConstantColors.white),
                  ),
                ),
              )
            : GradientButton(
                gradient: ConstantColors.primaryGradient(),
                onPressed: _handleChangePassword,
                text: l10n.changePassword,
              ),
      ],
      child: Form(
        key: _formKey,
        child: ColumnPadded(
          gap: Insets.medium,
          children: [
            const SizedBox(height: 16),
            // Current Password Field
            PasswordFormField(
              decoration: InputDecoration(fillColor: colorScheme.background),
              controller: _currentPasswordController,
              focusNode: _currentPasswordFocus,
              nextFocusNode: _newPasswordFocus,
              labelText: l10n.currentPassword,
              hintText: l10n.enterCurrentPassword,
              rules: [RequiredRule(), MinLengthRule(6)],
              onChanged: (value) {
                // Trigger validation for new password when current password changes
                if (_newPasswordController.text.isNotEmpty) {
                  setState(() {}); // This will trigger rebuild and validation
                }
              },
            ),

            // New Password Field
            PasswordFormField(
              decoration: InputDecoration(fillColor: colorScheme.background),
              controller: _newPasswordController,
              focusNode: _newPasswordFocus,
              nextFocusNode: _confirmPasswordFocus,
              labelText: l10n.newPassword,
              hintText: l10n.enterNewPassword,
              rules: [RequiredRule(), MinLengthRule(8), _DifferentPasswordRule(_currentPasswordController)],
              onChanged: (value) {
                // Trigger validation for confirm password when new password changes
                if (_confirmPasswordController.text.isNotEmpty) {
                  setState(() {}); // This will trigger rebuild and validation
                }
              },
            ),

            // Confirm Password Field
            PasswordFormField(
              decoration: InputDecoration(fillColor: colorScheme.background),

              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocus,
              labelText: l10n.confirmNewPassword,
              hintText: l10n.confirmNewPasswordHint,
              rules: [RequiredRule(), _MatchPasswordRule(_newPasswordController)],
              onChanged: (value) {
                // Trigger validation when confirm password changes
                setState(() {}); // This will trigger rebuild and validation
              },
            ),

            // Password Requirements Info
            Container(
              padding: Insets.mediumAll,
              decoration: BoxDecoration(color: colorScheme.background, borderRadius: BorderSize.smallRadius),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 16, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        l10n.passwordRequirements,
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '• ${l10n.atLeast8Characters}\n'
                    '• ${l10n.differentFromCurrent}\n'
                    '• ${l10n.mustMatchConfirmation}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
