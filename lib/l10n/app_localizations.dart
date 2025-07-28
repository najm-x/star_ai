import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bg.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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
    Locale('bg'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In ar, this message translates to:
  /// **'STAR AI'**
  String get appName;

  /// No description provided for @home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get home;

  /// No description provided for @extract.
  ///
  /// In ar, this message translates to:
  /// **'استخراج'**
  String get extract;

  /// No description provided for @videoTranslator.
  ///
  /// In ar, this message translates to:
  /// **'ملخص اليوتيوب'**
  String get videoTranslator;

  /// No description provided for @textTranslator.
  ///
  /// In ar, this message translates to:
  /// **'مترجم النص'**
  String get textTranslator;

  /// No description provided for @spellChecker.
  ///
  /// In ar, this message translates to:
  /// **'مدقق الإملاء'**
  String get spellChecker;

  /// No description provided for @textextract.
  ///
  /// In ar, this message translates to:
  /// **'استخراج النص'**
  String get textextract;

  /// No description provided for @mailSender.
  ///
  /// In ar, this message translates to:
  /// **'مُرسِل البريد'**
  String get mailSender;

  /// No description provided for @smsSender.
  ///
  /// In ar, this message translates to:
  /// **'مُرسِل الرسائل النصية'**
  String get smsSender;

  /// No description provided for @descreption.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في STAR AI! 🎉\nنقدم لك مجموعة أدوات ذكاء اصطناعي مجانية لمساعدتك في حياتك اليومية. 🤩\nاختر الأداة التي تناسب احتياجاتك من خلال الضغط على أيقونة الدرج في الأعلى. ⬆️\nاستمتع بتجربة STAR AI! 🚀'**
  String get descreption;

  /// No description provided for @doneSaveFile.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ الملف بنجاح في هذا الدليل'**
  String get doneSaveFile;

  /// No description provided for @genericError.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ غير متوقع.'**
  String get genericError;

  /// No description provided for @unknownError.
  ///
  /// In ar, this message translates to:
  /// **'خطأ غير معروف.'**
  String get unknownError;

  /// No description provided for @emptyFilePath.
  ///
  /// In ar, this message translates to:
  /// **'يرجى تحديد مسار ملف صالح.'**
  String get emptyFilePath;

  /// No description provided for @fileCreateFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل إنشاء الملف. يرجى المحاولة مرة أخرى.'**
  String get fileCreateFailed;

  /// No description provided for @fileSaveFailed.
  ///
  /// In ar, this message translates to:
  /// **'فشل حفظ الملف. يرجى المحاولة مرة أخرى.'**
  String get fileSaveFailed;

  /// No description provided for @noVideoCaptions.
  ///
  /// In ar, this message translates to:
  /// **'لا يحتوي هذا الفيديو على ترجمات. يرجى اختيار فيديو مختلف.'**
  String get noVideoCaptions;

  /// No description provided for @videoTranslationFailed.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء ترجمة الفيديو. يرجى المحاولة مرة أخرى لاحقًا.'**
  String get videoTranslationFailed;

  /// No description provided for @insufficientPermissions.
  ///
  /// In ar, this message translates to:
  /// **'لا يمتلك التطبيق الأذونات اللازمة. يرجى منح الأذونات المطلوبة.'**
  String get insufficientPermissions;

  /// No description provided for @aIFailure.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ عند الاتصال مع جيميني Ai. حاول مرة أخرى لاحقًا'**
  String get aIFailure;

  /// No description provided for @pasteUrlHere.
  ///
  /// In ar, this message translates to:
  /// **'الصق الرابط هنا'**
  String get pasteUrlHere;

  /// No description provided for @vdurl.
  ///
  /// In ar, this message translates to:
  /// **'رابط الفيديو'**
  String get vdurl;

  /// No description provided for @translateFrom.
  ///
  /// In ar, this message translates to:
  /// **'من'**
  String get translateFrom;

  /// No description provided for @translateTo.
  ///
  /// In ar, this message translates to:
  /// **'إلى'**
  String get translateTo;

  /// No description provided for @translateOption.
  ///
  /// In ar, this message translates to:
  /// **'خيارات الترجمة'**
  String get translateOption;

  /// No description provided for @saveTranslation.
  ///
  /// In ar, this message translates to:
  /// **'حفظ الترجمة'**
  String get saveTranslation;

  /// No description provided for @fontSize.
  ///
  /// In ar, this message translates to:
  /// **'حجم الخط'**
  String get fontSize;

  /// No description provided for @backGround.
  ///
  /// In ar, this message translates to:
  /// **'الخلفية'**
  String get backGround;

  /// No description provided for @textColor.
  ///
  /// In ar, this message translates to:
  /// **'لون النص'**
  String get textColor;

  /// No description provided for @bottomSpace.
  ///
  /// In ar, this message translates to:
  /// **'مساحة أسفل'**
  String get bottomSpace;

  /// No description provided for @textDirection.
  ///
  /// In ar, this message translates to:
  /// **'اتجاه النص'**
  String get textDirection;

  /// No description provided for @subtitleDelay.
  ///
  /// In ar, this message translates to:
  /// **'تأخير الترجمة'**
  String get subtitleDelay;

  /// No description provided for @permissionRequiresA11.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب تطبيق Start Ai  إذن \"الوصول إلى جميع الملفات\" لإنشاء وتصفح وحفظ الملفات في المسار المحدد على جهازك، وذلك بسبب التغييرات في سياسة الأمان في إصدارات Android 11 وما بعدها.'**
  String get permissionRequiresA11;

  /// No description provided for @permissionRequires.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب تطبيق Start Ai  إذن \"التخزين\" لإنشاء وتصفح وحفظ الملفات في المسار المحدد على جهاز'**
  String get permissionRequires;

  /// No description provided for @ok.
  ///
  /// In ar, this message translates to:
  /// **'موافق'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @accessRequired.
  ///
  /// In ar, this message translates to:
  /// **'الوصول مطلوب'**
  String get accessRequired;

  /// No description provided for @gO.
  ///
  /// In ar, this message translates to:
  /// **'انتقل'**
  String get gO;

  /// No description provided for @doneCopy.
  ///
  /// In ar, this message translates to:
  /// **'تم النسخ'**
  String get doneCopy;

  /// No description provided for @editeDirection.
  ///
  /// In ar, this message translates to:
  /// **'تعديل اتجاه النص'**
  String get editeDirection;

  /// No description provided for @save.
  ///
  /// In ar, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @doneTranslate.
  ///
  /// In ar, this message translates to:
  /// **'تمت الترجمة'**
  String get doneTranslate;

  /// No description provided for @doneSaveTrans.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ الترجمة'**
  String get doneSaveTrans;

  /// No description provided for @entertext.
  ///
  /// In ar, this message translates to:
  /// **'أدخل النص، وحدد لغات من وإلى للترجمة'**
  String get entertext;

  /// No description provided for @pasteTextHere.
  ///
  /// In ar, this message translates to:
  /// **'الصق النص هنا'**
  String get pasteTextHere;

  /// No description provided for @infoText.
  ///
  /// In ar, this message translates to:
  /// **'مزيد من المعلومات حول هذا النص'**
  String get infoText;

  /// No description provided for @info.
  ///
  /// In ar, this message translates to:
  /// **'معلومات'**
  String get info;

  /// No description provided for @uploadImage.
  ///
  /// In ar, this message translates to:
  /// **'رفع الصورة'**
  String get uploadImage;

  /// No description provided for @titleWelcomOnBoarding.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في [STAR AI]!'**
  String get titleWelcomOnBoarding;

  /// No description provided for @desWelcomOnBoarding.
  ///
  /// In ar, this message translates to:
  /// **'اكتشف كيف يمكن أن تساعدك أدواتنا الذكية في إنجاز مهامك بسهولة وكفاءة.'**
  String get desWelcomOnBoarding;

  /// No description provided for @titleYtTrans.
  ///
  /// In ar, this message translates to:
  /// **'تلخيص فيديوهات YouTube'**
  String get titleYtTrans;

  /// No description provided for @desYtTrans.
  ///
  /// In ar, this message translates to:
  /// **'احصل على ملخص سريع لأهم ما ورد في أي فيديو يوتيوب، دون الحاجة لمشاهدته بالكامل.'**
  String get desYtTrans;

  /// No description provided for @titletextTrans.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة النص'**
  String get titletextTrans;

  /// No description provided for @destextTrans.
  ///
  /// In ar, this message translates to:
  /// **'قم بترجمة نصوصك إلى لغات متعددة بسرعة ودقة باستخدام أدواتنا المدعومة بالذكاء الاصطناعي'**
  String get destextTrans;

  /// No description provided for @titleSpellChecking.
  ///
  /// In ar, this message translates to:
  /// **'مراجعة الإملاء'**
  String get titleSpellChecking;

  /// No description provided for @desSpellChecking.
  ///
  /// In ar, this message translates to:
  /// **'استفد من قوة الذكاء الاصطناعي لضمان خلو نصك من الأخطاء الإملائية بسهولة.'**
  String get desSpellChecking;

  /// No description provided for @titleTextExtract.
  ///
  /// In ar, this message translates to:
  /// **'استخراج النص من الصور'**
  String get titleTextExtract;

  /// No description provided for @desTextExtract.
  ///
  /// In ar, this message translates to:
  /// **'استخرج النص من الصور بدقة لتحريرها وتعديلها بسهولة.'**
  String get desTextExtract;

  /// No description provided for @noInternet.
  ///
  /// In ar, this message translates to:
  /// **'لا يوجد اتصال بالإنترنت'**
  String get noInternet;

  /// No description provided for @tryAgain.
  ///
  /// In ar, this message translates to:
  /// **'حاول مرة أخرى'**
  String get tryAgain;

  /// No description provided for @unableToConnect.
  ///
  /// In ar, this message translates to:
  /// **'لا يمكن الاتصال بمزود الخدمة حاليًا.'**
  String get unableToConnect;

  /// No description provided for @enterApiKey.
  ///
  /// In ar, this message translates to:
  /// **'في هذه الحالة، يرجى إدخال مفتاح API الخاص بك لمواصلة استخدام التطبيق. لن يستغرق الأمر أكثر من دقيقة.'**
  String get enterApiKey;

  /// No description provided for @firstStep.
  ///
  /// In ar, this message translates to:
  /// **'أولاً'**
  String get firstStep;

  /// No description provided for @visitWebsite.
  ///
  /// In ar, this message translates to:
  /// **'قم بزيارة الموقع'**
  String get visitWebsite;

  /// No description provided for @secondStep.
  ///
  /// In ar, this message translates to:
  /// **'ثانيًا'**
  String get secondStep;

  /// No description provided for @obtainApiKey.
  ///
  /// In ar, this message translates to:
  /// **'اتبع الخطوات للحصول على مفتاح API'**
  String get obtainApiKey;

  /// No description provided for @thirdStep.
  ///
  /// In ar, this message translates to:
  /// **'ثالثًا'**
  String get thirdStep;

  /// No description provided for @pasteApiKey.
  ///
  /// In ar, this message translates to:
  /// **'الصق مفتاح API الذي حصلت عليه'**
  String get pasteApiKey;

  /// No description provided for @apiKey.
  ///
  /// In ar, this message translates to:
  /// **'Api Key'**
  String get apiKey;

  /// No description provided for @pasteApiKeyHere.
  ///
  /// In ar, this message translates to:
  /// **'الصق ال  Api key هنا '**
  String get pasteApiKeyHere;

  /// No description provided for @fromHere.
  ///
  /// In ar, this message translates to:
  /// **'من هنا  '**
  String get fromHere;

  /// No description provided for @chooseImage.
  ///
  /// In ar, this message translates to:
  /// **'يرجى اختيار الصورة'**
  String get chooseImage;

  /// No description provided for @enterTheApiKey.
  ///
  /// In ar, this message translates to:
  /// **'أدخل ال api key '**
  String get enterTheApiKey;

  /// No description provided for @apikeyDontWork.
  ///
  /// In ar, this message translates to:
  /// **'api key لا يعمل حاول مرة أخرى'**
  String get apikeyDontWork;

  /// No description provided for @tools.
  ///
  /// In ar, this message translates to:
  /// **'الأدوات'**
  String get tools;

  /// No description provided for @showStart.
  ///
  /// In ar, this message translates to:
  /// **'اختر الأدوات التي تريدها من هنا '**
  String get showStart;

  /// No description provided for @lang.
  ///
  /// In ar, this message translates to:
  /// **'اللغة'**
  String get lang;

  /// No description provided for @addText.
  ///
  /// In ar, this message translates to:
  /// **'يرجى إدخال النص'**
  String get addText;

  /// No description provided for @chooseImageShow.
  ///
  /// In ar, this message translates to:
  /// **'اختر صورة من هنا'**
  String get chooseImageShow;

  /// No description provided for @clickTOExtract.
  ///
  /// In ar, this message translates to:
  /// **'انقر هنا لاستخراج النص'**
  String get clickTOExtract;

  /// No description provided for @addVideoUrl.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رابط فيديو YouTube الذي نسخته هنا'**
  String get addVideoUrl;

  /// No description provided for @chooselangToTransVd.
  ///
  /// In ar, this message translates to:
  /// **'اختر اللغة لترجمة الفيديو منها وإليها'**
  String get chooselangToTransVd;

  /// No description provided for @clickToStartTransVd.
  ///
  /// In ar, this message translates to:
  /// **'انقر هنا لبدء الترجمة'**
  String get clickToStartTransVd;

  /// No description provided for @addTextToSpellCheck.
  ///
  /// In ar, this message translates to:
  /// **'أدخل النص الذي تريد تدقيقه إملائياً هنا'**
  String get addTextToSpellCheck;

  /// No description provided for @clickToStartSpell.
  ///
  /// In ar, this message translates to:
  /// **'انقر هنا لبدء التدقيق الإملائي'**
  String get clickToStartSpell;

  /// No description provided for @enterTextToTransHere.
  ///
  /// In ar, this message translates to:
  /// **'أدخل النص الذي تريد ترجمته هنا'**
  String get enterTextToTransHere;

  /// No description provided for @addmoreInfoText.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك إدخال معلومات حول النص للحصول على ترجمة أفضل'**
  String get addmoreInfoText;

  /// No description provided for @chooselangToTransText.
  ///
  /// In ar, this message translates to:
  /// **'عند إدخال نص ، اختر اللغة لترجمة النص منها وإليها'**
  String get chooselangToTransText;

  /// No description provided for @clickToStartTransText.
  ///
  /// In ar, this message translates to:
  /// **'انقر هنا لبدء ترجمة النص'**
  String get clickToStartTransText;

  /// No description provided for @privacyPolicy.
  ///
  /// In ar, this message translates to:
  /// **'privacy policy'**
  String get privacyPolicy;

  /// No description provided for @vdTransTypeOneTitle.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة الفيديو مع التحميل'**
  String get vdTransTypeOneTitle;

  /// No description provided for @vdTransTypeOneDes.
  ///
  /// In ar, this message translates to:
  /// **'سيتعين عليك الانتظار حتى اكتمال ترجمة الفيديو قبل مشاهدته. قد يستغرق ذلك بعض الوقت اعتمادًا على طول الفيديو.'**
  String get vdTransTypeOneDes;

  /// No description provided for @vdTransTypeTowTitle.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة الفيديو المباشرة'**
  String get vdTransTypeTowTitle;

  /// No description provided for @vdTransTypeTowDes.
  ///
  /// In ar, this message translates to:
  /// **'سيتم ترجمة الفيديو مباشرة وبسرعة، لكن لن تتمكن من تنزيل الترجمة.'**
  String get vdTransTypeTowDes;

  /// No description provided for @vdTransTypeThreeTitle.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة الفيديو من ملف ترجمة'**
  String get vdTransTypeThreeTitle;

  /// No description provided for @vdTransTypeThreeDes.
  ///
  /// In ar, this message translates to:
  /// **'سيتم ترجمة الفيديو بناءً على ملف الترجمة الذي اخترته.'**
  String get vdTransTypeThreeDes;

  /// No description provided for @showToStart.
  ///
  /// In ar, this message translates to:
  /// **'شاهد إعلانًا قصيرًا للبدء'**
  String get showToStart;

  /// No description provided for @translateLoadingInfoNoe.
  ///
  /// In ar, this message translates to:
  /// **'يختلف وقت الترجمة من 0.1 إلى 7 دقائق، اعتمادًا على طول الفيديو.'**
  String get translateLoadingInfoNoe;

  /// No description provided for @translateLoadingInfoTow.
  ///
  /// In ar, this message translates to:
  /// **'جارٍ استخراج النص من الفيديو. لن يستغرق الأمر أكثر من دقيقة.'**
  String get translateLoadingInfoTow;

  /// No description provided for @translate.
  ///
  /// In ar, this message translates to:
  /// **'ترجمة'**
  String get translate;

  /// No description provided for @errorShowAds.
  ///
  /// In ar, this message translates to:
  /// **'حدث خطأ أثناء تحميل الإعلان. يرجى إعادة تحميل الصفحة.'**
  String get errorShowAds;

  /// No description provided for @uploadFile.
  ///
  /// In ar, this message translates to:
  /// **'رفع ملف'**
  String get uploadFile;

  /// No description provided for @translateExtracted.
  ///
  /// In ar, this message translates to:
  /// **'جار استخراج الترجمة من الملف'**
  String get translateExtracted;

  /// No description provided for @setting.
  ///
  /// In ar, this message translates to:
  /// **'اﻹعدادات'**
  String get setting;

  /// No description provided for @changeLang.
  ///
  /// In ar, this message translates to:
  /// **'تغيير اللغة'**
  String get changeLang;

  /// No description provided for @aboutApp.
  ///
  /// In ar, this message translates to:
  /// **'حول التطبيق'**
  String get aboutApp;

  /// No description provided for @changTheme.
  ///
  /// In ar, this message translates to:
  /// **'تغيير التنسيق'**
  String get changTheme;

  /// No description provided for @emptySummary.
  ///
  /// In ar, this message translates to:
  /// **'قائمتك فارغة حالياً'**
  String get emptySummary;

  /// No description provided for @startAddSummary.
  ///
  /// In ar, this message translates to:
  /// **'لم تقم بتلخيص أي فيديو بعد.\nابدأ الآن بالضغط على زر الإضافة (+) في الأسفل.'**
  String get startAddSummary;

  /// No description provided for @infoIntheAppBar.
  ///
  /// In ar, this message translates to:
  /// **'لمعرفة المزيد حول كيفية استخدام التطبيق، اضغط على أيقونة المعلومات (ⓘ) في أعلى الشاشة.'**
  String get infoIntheAppBar;

  /// No description provided for @setup.
  ///
  /// In ar, this message translates to:
  /// **'تجهيز'**
  String get setup;

  /// No description provided for @summaryType.
  ///
  /// In ar, this message translates to:
  /// **'نوع التلخيص '**
  String get summaryType;

  /// No description provided for @summarySize.
  ///
  /// In ar, this message translates to:
  /// **'حجم التلخيص'**
  String get summarySize;

  /// No description provided for @short.
  ///
  /// In ar, this message translates to:
  /// **'قصير'**
  String get short;

  /// No description provided for @tall.
  ///
  /// In ar, this message translates to:
  /// **'طويل'**
  String get tall;

  /// No description provided for @summarying.
  ///
  /// In ar, this message translates to:
  /// **'بدء التلخيص'**
  String get summarying;

  /// No description provided for @enterVdUrl.
  ///
  /// In ar, this message translates to:
  /// **'أدخل رابط الفيديو'**
  String get enterVdUrl;

  /// No description provided for @pdfExport.
  ///
  /// In ar, this message translates to:
  /// **'استخراج ملف PDF'**
  String get pdfExport;

  /// No description provided for @txtExport.
  ///
  /// In ar, this message translates to:
  /// **'استخراج ملف TXT'**
  String get txtExport;

  /// No description provided for @trubleShotting.
  ///
  /// In ar, this message translates to:
  /// **'استكشاف اﻷخطاء وإصلاحها'**
  String get trubleShotting;

  /// No description provided for @note.
  ///
  /// In ar, this message translates to:
  /// **'تنبيه'**
  String get note;

  /// No description provided for @appCrach.
  ///
  /// In ar, this message translates to:
  /// **'بسبب الضغط على التطبيق ,التطبيق غير قادر استكمال المزيد من الطلبات. يرجى إدخال مفتاح  API الخاص بك من صفحة الإعدادات  واتبع التعليمات لاستمرار استخدام التطبيق بشكل مجاني.'**
  String get appCrach;

  /// No description provided for @appWorkDone.
  ///
  /// In ar, this message translates to:
  /// **'التطبيق يعمل بشكل سليم لا توجد أي مشاكل ظاهرة'**
  String get appWorkDone;

  /// No description provided for @welcome.
  ///
  /// In ar, this message translates to:
  /// **'مرحبا...!'**
  String get welcome;

  /// No description provided for @dark.
  ///
  /// In ar, this message translates to:
  /// **'الوضع المظلم'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In ar, this message translates to:
  /// **'الوضع المشمس'**
  String get light;

  /// No description provided for @howToUseTitle.
  ///
  /// In ar, this message translates to:
  /// **'كيفية الاستخدام'**
  String get howToUseTitle;

  /// No description provided for @welcomeText.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في صفحة كيفية الاستخدام! هذا الدليل سيوضح لك كيفية البدء في تلخيص الفيديو.'**
  String get welcomeText;

  /// No description provided for @step1Title.
  ///
  /// In ar, this message translates to:
  /// **'1: نسخ الرابط'**
  String get step1Title;

  /// No description provided for @step1Instruction1.
  ///
  /// In ar, this message translates to:
  /// **'1. اضغط على زر \"مشاركة\" أسفل الفيديو في التطبيق أو صفحة الويب.'**
  String get step1Instruction1;

  /// No description provided for @step1Instruction2.
  ///
  /// In ar, this message translates to:
  /// **'2. اختر \"نسخ الرابط\".'**
  String get step1Instruction2;

  /// No description provided for @step1Instruction3.
  ///
  /// In ar, this message translates to:
  /// **'3. اضغط على أيقونة \"إضافة\" لإضافة تلخيص جديد.'**
  String get step1Instruction3;

  /// No description provided for @step1Instruction4.
  ///
  /// In ar, this message translates to:
  /// **'4. الصق رابط الفيديو، واختر نوع الملخص وحجمه واللغة التي تفضلها.'**
  String get step1Instruction4;

  /// No description provided for @appCreator.
  ///
  /// In ar, this message translates to:
  /// **'تم تطوير هذا التطبيق بواسطة نجم الدين. إذا واجهت أي مشكلة أو كانت لديك اقتراحات لتحسين التطبيق، يسعدنا تواصلك معنا عبر:'**
  String get appCreator;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bg',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'it',
        'ja',
        'pt',
        'ru',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bg':
      return AppLocalizationsBg();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
