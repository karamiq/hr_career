import 'package:app/core/network/dio_models.dart';
import 'package:app/core/providers/settings_provider.dart';
import 'package:app/core/theme/theme_mode.dart';
import 'package:app/core/utils/custom_text_feileds.dart/auth_text_form_feild.dart';
import 'package:app/core/utils/widgets/buttons/filled_loading_button.dart';
import 'package:app/core/utils/widgets/buttons/switch_theme_mode_button.dart';
import 'package:app/data/models/requests_models/login_request_model.dart';
import 'package:app/data/services/_clients.dart';
import 'package:flutter/material.dart';
import '../../core/utils/custom_text_feileds.dart/password_text_form_feild.dart';
import '../../core/utils/validators/validators.dart';
import '../../core/utils/widgets/buttons/change_language_button.dart';
import '../../data/providers/device_id_provider.dart';
import '../../data/providers/login_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // thedarksoul622@gmail.com
  // \$TR!NG12345
  final _emailController = TextEditingController(text: "karamrasheed@gmail.com");
  final _passwordController = TextEditingController(text: 'Karam@2004');

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isLoading = ref.watch(loginProvider).isLoading;
    final isDark = ref.watch(settingsProvider).themeMode.isDark;
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Image.asset(
                isDark ? 'assets/images/titanium_logo_dark.png' : 'assets/images/titanium_logo_light.png',
                height: 200,
              ),
              const SizedBox(height: Insets.medium),
              Text(
                l10n.welcomeTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              AuthFormField(
                textDirection: TextDirection.ltr,
                controller: _emailController,
                hintText: l10n.emailHint,
                rules: [EmailRule(l10n.emailRuleMessage)],
              ),
              const SizedBox(height: 12),
              PasswordFormField(
                textDirection: TextDirection.ltr,
                controller: _passwordController,
                hintText: l10n.passwordHint,
                rules: [RequiredRule(l10n.requiredRuleMessage)],
              ),
              const SizedBox(height: Insets.extraLarge),
              FilledLoadingButton(
                isLoading: ref.watch(loginProvider).isLoading,
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    final result = await ref
                        .read(loginProvider.notifier)
                        .run(
                          LoginRequestModel(
                            email: _emailController.text,
                            password: _passwordController.text,
                            deviceId: ref.read(uniqueIdProvider),
                          ),
                        );
                    result.whenDataOrError(
                      data: (data) {
                        context.go(RoutesDocument.roadmap);
                      },
                      error: (e, t) {},
                    );
                  }
                },
                child: isLoading ? const CircularProgressIndicator() : Text(l10n.login),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ChangeLanguageButton(), const SwitchThemeModeButton()],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
