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
  String get defaultErrorMessage => 'حدث خطأ ما, يرجى المحاولة مرة أخرى';

  @override
  String get noItemsFoundError => 'لا يوجد عناصر';

  @override
  String get locationPermissionIsRequiredToContinue =>
      'يجب السماح بالوصول إلى الموقع للمتابعة';
}
