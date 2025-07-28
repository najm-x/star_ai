// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'STAR AI';

  @override
  String get home => 'ホーム';

  @override
  String get extract => '抽出';

  @override
  String get videoTranslator => 'YouTubeサマライザー';

  @override
  String get textTranslator => 'テキスト翻訳';

  @override
  String get spellChecker => 'スペルチェッカー';

  @override
  String get textextract => 'テキスト抽出';

  @override
  String get mailSender => 'メール送信';

  @override
  String get smsSender => 'SMS送信';

  @override
  String get descreption =>
      'STAR AIへようこそ！🎉\nあなたの日常生活を支援する無料のAIツールセットを提供します。🤩\n上部のドロワーアイコンをタップして、ニーズに合ったツールを選択してください。⬆️\nSTAR AIをお楽しみください！🚀';

  @override
  String get doneSaveFile => 'ファイルは正常にこのディレクトリに保存されました';

  @override
  String get genericError => '予期せぬエラーが発生しました。';

  @override
  String get unknownError => '不明なエラーです。';

  @override
  String get emptyFilePath => '有効なファイルパスを指定してください。';

  @override
  String get fileCreateFailed => 'ファイルの作成に失敗しました。もう一度お試しください。';

  @override
  String get fileSaveFailed => 'ファイルの保存に失敗しました。もう一度お試しください。';

  @override
  String get noVideoCaptions => 'この動画には字幕がありません。別の動画を選択してください。';

  @override
  String get videoTranslationFailed => '動画の翻訳中にエラーが発生しました。後ほどもう一度お試しください。';

  @override
  String get insufficientPermissions => 'アプリに必要な権限がありません。必要な権限を付与してください。';

  @override
  String get aIFailure => 'Gemini AIとの接続中にエラーが発生しました。後ほどもう一度お試しください';

  @override
  String get pasteUrlHere => 'ここにURLを貼り付けてください';

  @override
  String get vdurl => '動画のURL';

  @override
  String get translateFrom => '元言語';

  @override
  String get translateTo => '翻訳先言語';

  @override
  String get translateOption => '翻訳オプション';

  @override
  String get saveTranslation => '翻訳を保存';

  @override
  String get fontSize => 'フォントサイズ';

  @override
  String get backGround => '背景';

  @override
  String get textColor => 'テキストの色';

  @override
  String get bottomSpace => '下部スペース';

  @override
  String get textDirection => 'テキストの方向';

  @override
  String get subtitleDelay => '字幕の遅延';

  @override
  String get permissionRequiresA11 =>
      'Start Aiアプリケーションは、お使いのデバイスの指定されたパスにファイルを作成、参照、保存するために「すべてのファイルへのアクセス」権限を必要とします。これは、Android 11以降のバージョンにおけるセキュリティポリシーの変更によるものです。';

  @override
  String get permissionRequires =>
      'Start Aiアプリケーションは、お使いのデバイスの指定されたパスにファイルを作成、参照、保存するために「ストレージ」権限を必要とします。';

  @override
  String get ok => 'OK';

  @override
  String get cancel => 'キャンセル';

  @override
  String get accessRequired => 'アクセスが必要です';

  @override
  String get gO => '移動';

  @override
  String get doneCopy => 'コピー完了';

  @override
  String get editeDirection => 'テキスト方向の編集';

  @override
  String get save => '保存';

  @override
  String get doneTranslate => '翻訳完了';

  @override
  String get doneSaveTrans => '翻訳の保存完了';

  @override
  String get entertext => 'テキストを入力し、翻訳する言語を選択してください';

  @override
  String get pasteTextHere => 'ここにテキストを貼り付けてください';

  @override
  String get infoText => 'このテキストの詳細';

  @override
  String get info => '情報';

  @override
  String get uploadImage => '画像をアップロード';

  @override
  String get titleWelcomOnBoarding => '[STAR AI]へようこそ！';

  @override
  String get desWelcomOnBoarding =>
      '私たちのスマートツールが、あなたのタスクを簡単かつ効率的に完了させる方法をご覧ください。';

  @override
  String get titleYtTrans => 'YouTube動画翻訳';

  @override
  String get desYtTrans => 'YouTubeビデオ全体のキーポイントを視聴しなくてもすばやく要約できます。';

  @override
  String get titletextTrans => 'テキスト翻訳';

  @override
  String get destextTrans => 'AIを搭載したツールを使用して、テキストを複数の言語に迅速かつ正確に翻訳します。';

  @override
  String get titleSpellChecking => 'スペルチェック';

  @override
  String get desSpellChecking => 'AIの力を活用して、テキストにスペルミスがないことを簡単に確認できます。';

  @override
  String get titleTextExtract => '画像からのテキスト抽出';

  @override
  String get desTextExtract => '画像からテキストを正確に抽出して、簡単に編集や変更を行うことができます。';

  @override
  String get noInternet => 'インターネットに接続されていません';

  @override
  String get tryAgain => 'もう一度試してください';

  @override
  String get unableToConnect => '現在、サービスプロバイダに接続できません。';

  @override
  String get enterApiKey => 'この場合、アプリケーションの使用を継続するには、APIキーを入力してください。1分もかかりません。';

  @override
  String get firstStep => 'まず';

  @override
  String get visitWebsite => 'ウェブサイトにアクセスしてください';

  @override
  String get secondStep => '次に';

  @override
  String get obtainApiKey => '手順に従ってAPIキーを取得します';

  @override
  String get thirdStep => '最後に';

  @override
  String get pasteApiKey => '取得したAPIキーを貼り付けます';

  @override
  String get apiKey => 'APIキー';

  @override
  String get pasteApiKeyHere => 'ここにAPIキーを貼り付けてください';

  @override
  String get fromHere => 'ここから';

  @override
  String get chooseImage => '画像を選択してください';

  @override
  String get enterTheApiKey => 'APIキーを入力してください';

  @override
  String get apikeyDontWork => 'APIキーが機能しません。もう一度お試しください。';

  @override
  String get tools => 'ツール';

  @override
  String get showStart => 'ここから必要なツールを選択してください';

  @override
  String get lang => '言語';

  @override
  String get addText => 'テキストを入力してください';

  @override
  String get chooseImageShow => 'ここから画像を選択';

  @override
  String get clickTOExtract => 'ここをクリックしてテキストを抽出';

  @override
  String get addVideoUrl => 'コピーした YouTube 動画のリンクをここに入力してください';

  @override
  String get chooselangToTransVd => '動画の翻訳元と翻訳先の言語を選択してください';

  @override
  String get clickToStartTransVd => 'ここをクリックして翻訳を開始';

  @override
  String get addTextToSpellCheck => 'スペルチェックするテキストをここに入力してください';

  @override
  String get clickToStartSpell => 'ここをクリックしてスペルチェックを開始';

  @override
  String get enterTextToTransHere => '翻訳するテキストをここに入力してください';

  @override
  String get addmoreInfoText => 'より良い翻訳結果を得るために、テキストに関する情報を入力できます';

  @override
  String get chooselangToTransText => 'テキストを入力する際、翻訳元と翻訳先の言語を選択してください';

  @override
  String get clickToStartTransText => 'ここをクリックしてテキストの翻訳を開始';

  @override
  String get privacyPolicy => 'privacy policy';

  @override
  String get vdTransTypeOneTitle => 'ダウンロード付きのビデオ翻訳';

  @override
  String get vdTransTypeOneDes =>
      'ビデオの翻訳が完了するまで待つ必要があります。ビデオの長さによっては時間がかかる場合があります。';

  @override
  String get vdTransTypeTowTitle => 'ダイレクトビデオ翻訳';

  @override
  String get vdTransTypeTowDes => 'ビデオは直接かつ迅速に翻訳されますが、翻訳をダウンロードすることはできません。';

  @override
  String get vdTransTypeThreeTitle => '翻訳ファイルからのビデオ翻訳';

  @override
  String get vdTransTypeThreeDes => 'ビデオは、選択した翻訳ファイルに基づいて翻訳されます。';

  @override
  String get showToStart => '開始するには短い広告をご覧ください';

  @override
  String get translateLoadingInfoNoe => '翻訳時間はビデオの長さによって異なりますが、0.1分から7分です。';

  @override
  String get translateLoadingInfoTow => 'ビデオからのテキスト抽出が進行中です。1分以内にかかります。';

  @override
  String get translate => '翻訳する';

  @override
  String get errorShowAds => '広告の読み込み中にエラーが発生しました。ページをリロードしてください。';

  @override
  String get uploadFile => 'ファイルのアップロード';

  @override
  String get translateExtracted => 'ファイルから翻訳を抽出しています';

  @override
  String get setting => '設定';

  @override
  String get changeLang => '言語を変更';

  @override
  String get aboutApp => 'アプリについて';

  @override
  String get changTheme => 'テーマを変更';

  @override
  String get emptySummary => 'リストは現在空です';

  @override
  String get startAddSummary => 'まだビデオを要約していません。\n下の追加（+）ボタンを押して今すぐ始めましょう。';

  @override
  String get infoIntheAppBar => 'アプリの使い方について詳しくは、画面上部の情報（ⓘ）アイコンをタップしてください。';

  @override
  String get setup => 'セットアップ';

  @override
  String get summaryType => '要約タイプ';

  @override
  String get summarySize => '要約サイズ';

  @override
  String get short => '短い';

  @override
  String get tall => '長い';

  @override
  String get summarying => '要約を開始';

  @override
  String get enterVdUrl => 'ビデオのURLを入力';

  @override
  String get pdfExport => 'PDFファイルをエクスポート';

  @override
  String get txtExport => 'TXTファイルをエクスポート';

  @override
  String get trubleShotting => 'トラブルシューティング';

  @override
  String get note => '注意';

  @override
  String get appCrach =>
      'アプリケーションへの負荷のため、アプリケーションはこれ以上のリクエストを完了できません。設定ページからAPIキーを入力し、指示に従ってアプリケーションを無料で使い続けてください。';

  @override
  String get appWorkDone => 'アプリケーションは正常に動作しており、明らかな問題はありません';

  @override
  String get welcome => 'ようこそ...!';

  @override
  String get dark => 'ダークモード';

  @override
  String get light => 'ライトモード';

  @override
  String get howToUseTitle => '使い方';

  @override
  String get welcomeText => '「使い方」ページへようこそ！このガイドでは、ビデオの要約を開始する方法について説明します。';

  @override
  String get step1Title => '1：リンクをコピー';

  @override
  String get step1Instruction1 => '1. アプリまたはWebページのビデオの下にある「共有」ボタンをタップします。';

  @override
  String get step1Instruction2 => '2. 「リンクをコピー」を選択します。';

  @override
  String get step1Instruction3 => '3. 「追加」アイコンをタップして、新しい要約を追加します。';

  @override
  String get step1Instruction4 => '4. ビデオのリンクを貼り付け、要約のタイプとサイズ、および希望する言語を選択します。';

  @override
  String get appCreator =>
      'このアプリケーションはNajm Al-Dinによって開発されました。問題が発生した場合や、アプリケーションを改善するための提案がある場合は、以下までご連絡ください。';
}
