// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get fieldRequired => 'この項目は必須です';

  @override
  String get invalidFieldValue => '無効な項目の値';

  @override
  String get validationEmail => '有効なメールアドレスを入力してください';

  @override
  String get validationMaxLength => '必要な長さを満たしてください';

  @override
  String get validationPhoneNumber => '有効な電話番号を入力してください';

  @override
  String get validationRequired => 'この項目は必須です';

  @override
  String get validationUrl => '有効なURLを入力してください';

  @override
  String get validatorEmail => 'この項目は有効なメールアドレスではありません';

  @override
  String validatorMaxLength(Object n) {
    return 'この項目は最大$n文字までです';
  }

  @override
  String validatorMinLength(Object n) {
    return 'この項目は最低$n文字以上である必要があります';
  }

  @override
  String get validatorPhoneNumber => 'この項目は有効な電話番号ではありません';

  @override
  String get validatorRequired => 'この項目は必須です';

  @override
  String get validatorUrl => 'この項目は有効なURLアドレスではありません';

  @override
  String get validatorUseArabicOrKurdishLetters => 'アラビア語またはクルド語の文字を使用してください';

  @override
  String get validatorUseEnglishLetters => '英語の文字を使用してください';

  @override
  String get requiredRuleMessage => 'この項目は必須です';

  @override
  String get emailRuleMessage => '有効なメールアドレスを入力してください';

  @override
  String get requests => 'リクエスト';

  @override
  String get profile => 'プロフィール';

  @override
  String get roadmap => 'ロードマップ';

  @override
  String get record => '記録';

  @override
  String get create => '作成';

  @override
  String get pending => '保留中';

  @override
  String get approved => '承認済み';

  @override
  String get rejected => '却下済み';

  @override
  String get others => 'その他';

  @override
  String get title => 'タイトル';

  @override
  String get description => '説明';

  @override
  String get type => '種類';

  @override
  String get uploadAttachment => 'ファイルをアップロード';

  @override
  String get submit => '送信';

  @override
  String get sendRequest => 'リクエスト送信';

  @override
  String get sendRequestDescription =>
      '以下のフォームに記入してリクエストを送信してください。必要な情報をすべて入力してください。';

  @override
  String get browse => '参照';

  @override
  String get settings => '設定';

  @override
  String get appName => 'HR アシスタント';

  @override
  String get changeLanguage => '言語変更';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get lightMode => 'ライトモード';

  @override
  String get language => '言語';

  @override
  String get switchTheme => 'テーマ切り替え';

  @override
  String get theme => 'テーマ';

  @override
  String get themeDark => 'ダーク';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeSystem => 'システム';

  @override
  String get cancel => 'キャンセル';

  @override
  String get crop => 'クロップ';

  @override
  String get select => '選択';

  @override
  String get pickDate => '日付選択';

  @override
  String get relocate => '移動';

  @override
  String get retry => '再試行';

  @override
  String get search => '検索';

  @override
  String get login => 'ログイン';

  @override
  String get loginSuccess => '正常にログインしました';

  @override
  String get password => 'パスワード';

  @override
  String get typeYourPasswordHere => 'パスワードを入力してください';

  @override
  String get typeYourUsenameHere => 'ユーザー名を入力してください';

  @override
  String get username => 'ユーザー名';

  @override
  String get welcomeAgain => 'お帰りなさい';

  @override
  String get welcomeTitle => 'Titaniumへようこそ\nログインして続行';

  @override
  String get emailHint => 'メールアドレス';

  @override
  String get passwordHint => 'パスワード';

  @override
  String get logout => 'ログアウト';

  @override
  String get accountDetails => 'アカウント詳細';

  @override
  String get changePassword => 'パスワード変更';

  @override
  String get documents => '書類';

  @override
  String get certifications => '資格証明書';

  @override
  String get skills => 'スキル';

  @override
  String get about => 'について';

  @override
  String get support => 'サポート';

  @override
  String get english => '英語';

  @override
  String get areYouSureLogout => '本当にログアウトしますか？';

  @override
  String get defaultErrorMessage => 'エラーが発生しました。後でもう一度お試しください';

  @override
  String get noItemsFoundError => 'アイテムが見つかりません';

  @override
  String get locationPermissionIsRequiredToContinue => '続行するには位置情報の許可が必要です';
}
