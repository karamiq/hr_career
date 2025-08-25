// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get fieldRequired => 'هذا الحقل مطلوب';

  @override
  String get invalidFieldValue => 'قيمة حقل غير صالحة';

  @override
  String get validationEmail => 'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get validationMaxLength => 'الرجاء إكمال الطول المطلوب';

  @override
  String get validationPhoneNumber => 'الرجاء إدخال رقم هاتف صالح';

  @override
  String get validationRequired => 'هذا الحقل مطلوب';

  @override
  String get validationUrl => 'الرجاء إدخال عنوان URL صالح';

  @override
  String get validatorEmail => 'البريد الإلكتروني غير صحيح';

  @override
  String validatorMaxLength(Object n) {
    return 'رجاءً أدخل $n أحرف على الأكثر';
  }

  @override
  String validatorMinLength(Object n) {
    return 'الرجاء إدخال $n أحرف على الأقل';
  }

  @override
  String get validatorPhoneNumber => 'رقم الهاتف غير صحيح';

  @override
  String get validatorRequired => 'هذا الحقل مطلوب';

  @override
  String get validatorUrl => 'الرابط غير صحيح';

  @override
  String get validatorUseArabicOrKurdishLetters =>
      'رجاءً أدخل حروف عربية أو كردية';

  @override
  String get validatorUseEnglishLetters => 'رجاءً أدخل حروف إنجليزية';

  @override
  String get requiredRuleMessage => 'هذا الحقل مطلوب';

  @override
  String get emailRuleMessage => 'الرجاء إدخال بريد إلكتروني صالح';

  @override
  String get myCertifications => 'شهاداتي';

  @override
  String get professionalAchievements =>
      'إنجازاتك المهنية والشهادات التي حصلت عليها';

  @override
  String get aboutThisCertification => 'حول هذه الشهادة';

  @override
  String get skillsCovered => 'المهارات المشمولة';

  @override
  String get certificationDetails => 'تفاصيل الشهادة';

  @override
  String get organization => 'المنظمة';

  @override
  String get level => 'المستوى';

  @override
  String get completionDate => 'تاريخ الإنجاز';

  @override
  String get expiryDate => 'تاريخ انتهاء الصلاحية';

  @override
  String get requests => 'طلبات';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get roadmap => 'خارطة الطريق';

  @override
  String get record => 'السجل';

  @override
  String get create => 'إنشاء';

  @override
  String get pending => 'قيد الانتظار';

  @override
  String get approved => 'مقبول';

  @override
  String get rejected => 'مرفوض';

  @override
  String get others => 'أخرى';

  @override
  String get title => 'العنوان';

  @override
  String get description => 'الوصف';

  @override
  String get type => 'النوع';

  @override
  String get uploadAttachment => 'ارفع المرفق';

  @override
  String get submit => 'إرسال';

  @override
  String get sendRequest => 'إرسال الطلب';

  @override
  String get sendRequestDescription =>
      'يرجى ملء النموذج أدناه لإرسال طلبك. تأكد من تقديم جميع المعلومات المطلوبة.';

  @override
  String get browse => 'تصفح';

  @override
  String get settings => 'الإعدادات';

  @override
  String get appName => 'مساعد الموارد البشرية';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get lightMode => 'الوضع الصباحي';

  @override
  String get language => 'اللغة';

  @override
  String get switchTheme => 'تغيير اللون';

  @override
  String get theme => 'المظهر';

  @override
  String get themeDark => 'داكن';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeSystem => 'النظام';

  @override
  String get cancel => 'إلغاء';

  @override
  String get crop => 'قص الصورة';

  @override
  String get select => 'اختر';

  @override
  String get pickDate => 'اختر التاريخ';

  @override
  String get relocate => 'إعادة تحديد الموقع';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get search => 'بحث';

  @override
  String get currentPosition => 'المنصب الحالي';

  @override
  String get targetPosition => 'المنصب المستهدف';

  @override
  String get earnedCertifications => 'الشهادات\nالمكتسبة';

  @override
  String get totalCertifications => 'إجمالي\nالشهادات';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get password => 'كلمة المرور';

  @override
  String get typeYourPasswordHere => 'أدخل كلمة المرور هنا';

  @override
  String get typeYourUsenameHere => 'ادخل اسم المستخدم هنا';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get welcomeAgain => 'مرحباً بك مرة أخرى';

  @override
  String get welcomeTitle => 'مرحباً بك في Titanium\nسجل الدخول للمتابعة';

  @override
  String get emailHint => 'البريد الإلكتروني';

  @override
  String get passwordHint => 'كلمة المرور';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get accountDetails => 'تفاصيل الحساب';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get documents => 'المستندات';

  @override
  String get certifications => 'الشهادات';

  @override
  String get skills => 'المهارات';

  @override
  String get about => 'حول';

  @override
  String get support => 'الدعم';

  @override
  String get english => 'الإنجليزية';

  @override
  String get areYouSureLogout => 'هل أنت متأكد من أنك تريد تسجيل الخروج؟';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';

  @override
  String get enterCurrentPassword => 'أدخل كلمة المرور الحالية';

  @override
  String get enterNewPassword => 'أدخل كلمة المرور الجديدة';

  @override
  String get confirmNewPasswordHint => 'أكد كلمة المرور الجديدة';

  @override
  String get passwordRequirements => 'متطلبات كلمة المرور';

  @override
  String get atLeast8Characters => '8 أحرف على الأقل';

  @override
  String get differentFromCurrent => 'مختلفة عن كلمة المرور الحالية';

  @override
  String get mustMatchConfirmation => 'يجب أن تطابق كلمة المرور المؤكدة';

  @override
  String get passwordChangedSuccessfully => 'تم تغيير كلمة المرور بنجاح!';

  @override
  String get failedToChangePassword =>
      'فشل في تغيير كلمة المرور. يرجى المحاولة مرة أخرى.';

  @override
  String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';

  @override
  String get newPasswordMustBeDifferent =>
      'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور الحالية';

  @override
  String get aboutDialogContent =>
      'تطبيق HR Career\n\nالإصدار: 1.0.0\n\nمرحبًا بك في تطبيق HR Career!\n\nالميزات:\n• إدارة ملفك الشخصي والمهني\n• رفع وتتبع الشهادات\n• إضافة وتحديث المهارات\n• إدارة حساب آمنة\n• دعم متعدد اللغات\n\nتم التطوير بواسطة: فريق Titanium\nللتواصل: info@titaniumteam.com\nالموقع: www.titaniumteam.com\n\nجميع البيانات محفوظة بأمان وخصوصيتك هي أولويتنا.\n\nشكرًا لاستخدامك تطبيقنا!';

  @override
  String get supportDialogContent =>
      'تحتاج إلى مساعدة أو لديك أسئلة؟\n\n• البريد الإلكتروني: support@hrcareer.com\n• الهاتف: +964 123 456 7890\n• الدردشة المباشرة: متاحة داخل التطبيق خلال ساعات العمل\n\nساعات الدعم:\nالأحد - الخميس: 9:00 صباحًا - 5:00 مساءً (بتوقيت العراق)\n\nالموارد:\n• الأسئلة الشائعة: www.hrcareer.com/faq\n• مركز المساعدة: www.hrcareer.com/help\n\nنقدّر ملاحظاتك! يرجى إخبارنا كيف يمكننا تحسين تجربتك.';

  @override
  String get expert => 'خبير';

  @override
  String get advanced => 'متقدم';

  @override
  String get intermediate => 'متوسط';

  @override
  String get beginner => 'مبتدئ';

  @override
  String get totalPoints => 'إجمالي النقاط';

  @override
  String get average => 'المعدل';

  @override
  String get seniorLevel => 'مستوى متقدم';

  @override
  String get professionalDevelopmentOverview => 'نظرة عامة على التطوير المهني';

  @override
  String get defaultErrorMessage => 'حدث خطأ ما, يرجى المحاولة مرة أخرى';

  @override
  String get noItemsFoundError => 'لا يوجد عناصر';

  @override
  String get locationPermissionIsRequiredToContinue =>
      'يجب السماح بالوصول إلى الموقع للمتابعة';
}
