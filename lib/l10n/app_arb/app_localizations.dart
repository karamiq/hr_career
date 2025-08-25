import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'app_arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @invalidFieldValue.
  ///
  /// In en, this message translates to:
  /// **'Invalid field value'**
  String get invalidFieldValue;

  /// No description provided for @validationEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get validationEmail;

  /// No description provided for @validationMaxLength.
  ///
  /// In en, this message translates to:
  /// **'Please complete the required length'**
  String get validationMaxLength;

  /// No description provided for @validationPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validationPhoneNumber;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get validationRequired;

  /// No description provided for @validationUrl.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid URL'**
  String get validationUrl;

  /// No description provided for @validatorEmail.
  ///
  /// In en, this message translates to:
  /// **'The field is not a valid email address'**
  String get validatorEmail;

  /// No description provided for @validatorMaxLength.
  ///
  /// In en, this message translates to:
  /// **'The field must be at most {n} characters long'**
  String validatorMaxLength(Object n);

  /// No description provided for @validatorMinLength.
  ///
  /// In en, this message translates to:
  /// **'The field must be at least {n} characters long'**
  String validatorMinLength(Object n);

  /// No description provided for @validatorPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'The field is not a valid phone number'**
  String get validatorPhoneNumber;

  /// No description provided for @validatorRequired.
  ///
  /// In en, this message translates to:
  /// **'The field is required'**
  String get validatorRequired;

  /// No description provided for @validatorUrl.
  ///
  /// In en, this message translates to:
  /// **'The field is not a valid URL address'**
  String get validatorUrl;

  /// No description provided for @validatorUseArabicOrKurdishLetters.
  ///
  /// In en, this message translates to:
  /// **'Please use Arabic or Kurdish letters'**
  String get validatorUseArabicOrKurdishLetters;

  /// No description provided for @validatorUseEnglishLetters.
  ///
  /// In en, this message translates to:
  /// **'Please use English letters'**
  String get validatorUseEnglishLetters;

  /// No description provided for @requiredRuleMessage.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredRuleMessage;

  /// No description provided for @emailRuleMessage.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get emailRuleMessage;

  /// No description provided for @myCertifications.
  ///
  /// In en, this message translates to:
  /// **'My Certifications'**
  String get myCertifications;

  /// No description provided for @professionalAchievements.
  ///
  /// In en, this message translates to:
  /// **'Your professional achievements and earned certifications'**
  String get professionalAchievements;

  /// No description provided for @aboutThisCertification.
  ///
  /// In en, this message translates to:
  /// **'About this Certification'**
  String get aboutThisCertification;

  /// No description provided for @skillsCovered.
  ///
  /// In en, this message translates to:
  /// **'Skills Covered'**
  String get skillsCovered;

  /// No description provided for @certificationDetails.
  ///
  /// In en, this message translates to:
  /// **'Certification Details'**
  String get certificationDetails;

  /// No description provided for @organization.
  ///
  /// In en, this message translates to:
  /// **'Organization'**
  String get organization;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @completionDate.
  ///
  /// In en, this message translates to:
  /// **'Completion Date'**
  String get completionDate;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDate;

  /// No description provided for @requests.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get requests;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @roadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get roadmap;

  /// No description provided for @record.
  ///
  /// In en, this message translates to:
  /// **'Record'**
  String get record;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @others.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get others;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @uploadAttachment.
  ///
  /// In en, this message translates to:
  /// **'Upload Attachment'**
  String get uploadAttachment;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send Request'**
  String get sendRequest;

  /// No description provided for @sendRequestDescription.
  ///
  /// In en, this message translates to:
  /// **'Please fill out the form below to send your request. Make sure to provide all required information.'**
  String get sendRequestDescription;

  /// No description provided for @browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'HR Assistant'**
  String get appName;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @switchTheme.
  ///
  /// In en, this message translates to:
  /// **'Switch theme'**
  String get switchTheme;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @crop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get crop;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @pickDate.
  ///
  /// In en, this message translates to:
  /// **'Pick date'**
  String get pickDate;

  /// No description provided for @relocate.
  ///
  /// In en, this message translates to:
  /// **'Relocate'**
  String get relocate;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @currentPosition.
  ///
  /// In en, this message translates to:
  /// **'Current position'**
  String get currentPosition;

  /// No description provided for @targetPosition.
  ///
  /// In en, this message translates to:
  /// **'Target position'**
  String get targetPosition;

  /// No description provided for @earnedCertifications.
  ///
  /// In en, this message translates to:
  /// **'Earned\nCertifications'**
  String get earnedCertifications;

  /// No description provided for @totalCertifications.
  ///
  /// In en, this message translates to:
  /// **'Total\nCertifications'**
  String get totalCertifications;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @loginSuccess.
  ///
  /// In en, this message translates to:
  /// **'Logged in successfully'**
  String get loginSuccess;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @typeYourPasswordHere.
  ///
  /// In en, this message translates to:
  /// **'Type your password here'**
  String get typeYourPasswordHere;

  /// No description provided for @typeYourUsenameHere.
  ///
  /// In en, this message translates to:
  /// **'Type your username here'**
  String get typeYourUsenameHere;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @welcomeAgain.
  ///
  /// In en, this message translates to:
  /// **'Welcome again'**
  String get welcomeAgain;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Titanium\nLogin to continue'**
  String get welcomeTitle;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailHint;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordHint;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @accountDetails.
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get accountDetails;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get documents;

  /// No description provided for @certifications.
  ///
  /// In en, this message translates to:
  /// **'Certifications'**
  String get certifications;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @areYouSureLogout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get areYouSureLogout;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// No description provided for @enterCurrentPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password'**
  String get enterCurrentPassword;

  /// No description provided for @enterNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get enterNewPassword;

  /// No description provided for @confirmNewPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your new password'**
  String get confirmNewPasswordHint;

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password Requirements'**
  String get passwordRequirements;

  /// No description provided for @atLeast8Characters.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters long'**
  String get atLeast8Characters;

  /// No description provided for @differentFromCurrent.
  ///
  /// In en, this message translates to:
  /// **'Different from current password'**
  String get differentFromCurrent;

  /// No description provided for @mustMatchConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Must match confirmation password'**
  String get mustMatchConfirmation;

  /// No description provided for @passwordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get passwordChangedSuccessfully;

  /// No description provided for @failedToChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Failed to change password. Please try again.'**
  String get failedToChangePassword;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @newPasswordMustBeDifferent.
  ///
  /// In en, this message translates to:
  /// **'New password must be different from current password'**
  String get newPasswordMustBeDifferent;

  /// No description provided for @aboutDialogContent.
  ///
  /// In en, this message translates to:
  /// **'HR Career App\n\nVersion: 1.0.0\n\nWelcome to the HR Career App!\n\nFeatures:\n• Manage your personal and professional profile\n• Upload and track certifications\n• Add and update your skills\n• Secure account management\n• Multi-language support\n\nDeveloped by: Titanium Team\nContact: info@titaniumteam.com\nWebsite: www.titaniumteam.com\n\nAll data is securely stored and privacy is our top priority.\n\nThank you for using our app!'**
  String get aboutDialogContent;

  /// No description provided for @supportDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Need help or have questions?\n\n• Email: support@hrcareer.com\n• Phone: +964 123 456 7890\n• Live chat: Available in-app during business hours\n\nSupport Hours:\nSunday - Thursday: 9:00 AM - 5:00 PM (Iraq Time)\n\nResources:\n• FAQs: www.hrcareer.com/faq\n• Help Center: www.hrcareer.com/help\n\nWe value your feedback! Please let us know how we can improve your experience.'**
  String get supportDialogContent;

  /// No description provided for @expert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get expert;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @totalPoints.
  ///
  /// In en, this message translates to:
  /// **'Total Points'**
  String get totalPoints;

  /// No description provided for @average.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get average;

  /// No description provided for @seniorLevel.
  ///
  /// In en, this message translates to:
  /// **'Senior Level'**
  String get seniorLevel;

  /// No description provided for @professionalDevelopmentOverview.
  ///
  /// In en, this message translates to:
  /// **'Professional Development Overview'**
  String get professionalDevelopmentOverview;

  /// No description provided for @defaultErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later'**
  String get defaultErrorMessage;

  /// No description provided for @noItemsFoundError.
  ///
  /// In en, this message translates to:
  /// **'No items found'**
  String get noItemsFoundError;

  /// No description provided for @locationPermissionIsRequiredToContinue.
  ///
  /// In en, this message translates to:
  /// **'Location permission is required to continue'**
  String get locationPermissionIsRequiredToContinue;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
