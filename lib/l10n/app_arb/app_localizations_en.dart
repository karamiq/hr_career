// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get invalidFieldValue => 'Invalid field value';

  @override
  String get validationEmail => 'Please enter a valid email';

  @override
  String get validationMaxLength => 'Please complete the required length';

  @override
  String get validationPhoneNumber => 'Please enter a valid phone number';

  @override
  String get validationRequired => 'This field is required';

  @override
  String get validationUrl => 'Please enter a valid URL';

  @override
  String get validatorEmail => 'The field is not a valid email address';

  @override
  String validatorMaxLength(Object n) {
    return 'The field must be at most $n characters long';
  }

  @override
  String validatorMinLength(Object n) {
    return 'The field must be at least $n characters long';
  }

  @override
  String get validatorPhoneNumber => 'The field is not a valid phone number';

  @override
  String get validatorRequired => 'The field is required';

  @override
  String get validatorUrl => 'The field is not a valid URL address';

  @override
  String get validatorUseArabicOrKurdishLetters =>
      'Please use Arabic or Kurdish letters';

  @override
  String get validatorUseEnglishLetters => 'Please use English letters';

  @override
  String get requiredRuleMessage => 'This field is required';

  @override
  String get emailRuleMessage => 'Please enter a valid email';

  @override
  String get myCertifications => 'My Certifications';

  @override
  String get professionalAchievements =>
      'Your professional achievements and earned certifications';

  @override
  String get aboutThisCertification => 'About this Certification';

  @override
  String get skillsCovered => 'Skills Covered';

  @override
  String get certificationDetails => 'Certification Details';

  @override
  String get organization => 'Organization';

  @override
  String get level => 'Level';

  @override
  String get completionDate => 'Completion Date';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get requests => 'Requests';

  @override
  String get profile => 'Profile';

  @override
  String get roadmap => 'Roadmap';

  @override
  String get record => 'Record';

  @override
  String get create => 'Create';

  @override
  String get pending => 'Pending';

  @override
  String get approved => 'Approved';

  @override
  String get rejected => 'Rejected';

  @override
  String get others => 'Others';

  @override
  String get title => 'Title';

  @override
  String get description => 'Description';

  @override
  String get type => 'Type';

  @override
  String get uploadAttachment => 'Upload Attachment';

  @override
  String get submit => 'Submit';

  @override
  String get sendRequest => 'Send Request';

  @override
  String get sendRequestDescription =>
      'Please fill out the form below to send your request. Make sure to provide all required information.';

  @override
  String get browse => 'Browse';

  @override
  String get settings => 'Settings';

  @override
  String get appName => 'HR Assistant';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get language => 'Language';

  @override
  String get switchTheme => 'Switch theme';

  @override
  String get theme => 'Theme';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get themeSystem => 'System';

  @override
  String get cancel => 'Cancel';

  @override
  String get crop => 'Crop';

  @override
  String get select => 'Select';

  @override
  String get pickDate => 'Pick date';

  @override
  String get relocate => 'Relocate';

  @override
  String get retry => 'Retry';

  @override
  String get search => 'Search';

  @override
  String get currentPosition => 'Current position';

  @override
  String get targetPosition => 'Target position';

  @override
  String get earnedCertifications => 'Earned\nCertifications';

  @override
  String get totalCertifications => 'Total\nCertifications';

  @override
  String get login => 'Login';

  @override
  String get loginSuccess => 'Logged in successfully';

  @override
  String get password => 'Password';

  @override
  String get typeYourPasswordHere => 'Type your password here';

  @override
  String get typeYourUsenameHere => 'Type your username here';

  @override
  String get username => 'Username';

  @override
  String get welcomeAgain => 'Welcome again';

  @override
  String get welcomeTitle => 'Welcome to Titanium\nLogin to continue';

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get logout => 'Logout';

  @override
  String get accountDetails => 'Account Details';

  @override
  String get changePassword => 'Change password';

  @override
  String get documents => 'Documents';

  @override
  String get certifications => 'Certifications';

  @override
  String get skills => 'Skills';

  @override
  String get about => 'About';

  @override
  String get support => 'Support';

  @override
  String get english => 'English';

  @override
  String get areYouSureLogout => 'Are you sure you want to log out?';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get enterCurrentPassword => 'Enter your current password';

  @override
  String get enterNewPassword => 'Enter your new password';

  @override
  String get confirmNewPasswordHint => 'Confirm your new password';

  @override
  String get passwordRequirements => 'Password Requirements';

  @override
  String get atLeast8Characters => 'At least 8 characters long';

  @override
  String get differentFromCurrent => 'Different from current password';

  @override
  String get mustMatchConfirmation => 'Must match confirmation password';

  @override
  String get passwordChangedSuccessfully => 'Password changed successfully!';

  @override
  String get failedToChangePassword =>
      'Failed to change password. Please try again.';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get newPasswordMustBeDifferent =>
      'New password must be different from current password';

  @override
  String get aboutDialogContent =>
      'HR Career App\n\nVersion: 1.0.0\n\nWelcome to the HR Career App!\n\nFeatures:\n• Manage your personal and professional profile\n• Upload and track certifications\n• Add and update your skills\n• Secure account management\n• Multi-language support\n\nDeveloped by: Titanium Team\nContact: info@titaniumteam.com\nWebsite: www.titaniumteam.com\n\nAll data is securely stored and privacy is our top priority.\n\nThank you for using our app!';

  @override
  String get supportDialogContent =>
      'Need help or have questions?\n\n• Email: support@hrcareer.com\n• Phone: +964 123 456 7890\n• Live chat: Available in-app during business hours\n\nSupport Hours:\nSunday - Thursday: 9:00 AM - 5:00 PM (Iraq Time)\n\nResources:\n• FAQs: www.hrcareer.com/faq\n• Help Center: www.hrcareer.com/help\n\nWe value your feedback! Please let us know how we can improve your experience.';

  @override
  String get expert => 'Expert';

  @override
  String get advanced => 'Advanced';

  @override
  String get intermediate => 'Intermediate';

  @override
  String get beginner => 'Beginner';

  @override
  String get totalPoints => 'Total Points';

  @override
  String get average => 'Average';

  @override
  String get seniorLevel => 'Senior Level';

  @override
  String get professionalDevelopmentOverview =>
      'Professional Development Overview';

  @override
  String get defaultErrorMessage => 'An error occurred, please try again later';

  @override
  String get noItemsFoundError => 'No items found';

  @override
  String get locationPermissionIsRequiredToContinue =>
      'Location permission is required to continue';
}
