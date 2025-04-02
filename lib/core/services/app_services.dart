import 'package:business_tools/core/database/sq_lite_helper.dart';
import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/features/ads/data/datasources/ads_remote_data.dart';
import 'package:business_tools/features/ads/data/repositories/ads_repo_imp.dart';
import 'package:business_tools/features/ads/domain/repositories/ads_repo.dart';
import 'package:business_tools/features/ads/domain/usecases/ads_uc.dart';
import 'package:business_tools/features/ads/domain/usecases/lnterstitial_ad_uc.dart';
import 'package:business_tools/features/ads/domain/usecases/rewarded_ad_uc.dart';
import 'package:business_tools/features/ads/presentation/bloc/bloc/ads_bloc.dart';
import 'package:business_tools/features/check/presentation/bloc/check/check_cubit.dart';
import 'package:business_tools/features/extract/data/datasources/loacal_data_source.dart';
import 'package:business_tools/features/extract/data/repositories/extract_repo_imp.dart';
import 'package:business_tools/features/extract/domain/repositories/extract_repo.dart';
import 'package:business_tools/features/extract/domain/usecases/ex_emails_uc.dart';
import 'package:business_tools/features/extract/domain/usecases/ex_numbers_uc.dart';
import 'package:business_tools/features/extract/domain/usecases/save_data_uc.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:business_tools/features/home/presentation/bloc/cubit/home_cubit.dart';
import 'package:business_tools/features/onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:business_tools/features/spell_checker/data/datasources/spell_checker_remote_data.dart';
import 'package:business_tools/features/spell_checker/data/repositories/spell_checker_repo_imp.dart';
import 'package:business_tools/features/spell_checker/domain/repositories/spell_checker_repo.dart';
import 'package:business_tools/features/spell_checker/domain/usecases/save_text_spelled.dart';
import 'package:business_tools/features/spell_checker/domain/usecases/spell_text_checker_uc.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
import 'package:business_tools/features/summary/data/repositories/summary_repo_imp.dart';
import 'package:business_tools/features/summary/data/source/local/summary_local_source.dart';
import 'package:business_tools/features/summary/data/source/summary_remote_source.dart';
import 'package:business_tools/features/summary/domain/repositories/summary_repo.dart';
import 'package:business_tools/features/summary/domain/usecase/add_summary_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/delete_summaey_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/export_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/fetch_summaries_us.dart';
import 'package:business_tools/features/summary/domain/usecase/get_summary_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/summary_uc.dart';
import 'package:business_tools/features/summary/domain/usecase/vd_info_exctract_us.dart';
import 'package:business_tools/features/summary/presentation/bloc/cubit/summary_setup_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_home_cubit/summary_home_cubit.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_bloc/summary_view_bloc.dart';
import 'package:business_tools/features/summary/presentation/bloc/summary_view_cubit/cubit/summary_view_cubit.dart';
import 'package:business_tools/features/text_extract/data/datasources/text_extract_remote_data.dart';
import 'package:business_tools/features/text_extract/data/repositories/text_extract_repo_imp.dart';
import 'package:business_tools/features/text_extract/domain/repositories/text_extract_repo.dart';
import 'package:business_tools/features/text_extract/domain/usecases/crop_image_uc.dart';
import 'package:business_tools/features/text_extract/domain/usecases/extract_text_uc.dart';
import 'package:business_tools/features/text_extract/domain/usecases/pick_image_uc.dart';
import 'package:business_tools/features/text_extract/presentation/bloc/bloc/text_extract_bloc.dart';
import 'package:business_tools/features/text_translate/data/datasources/text_trans_remote_data_source.dart';
import 'package:business_tools/features/text_translate/data/repositories/text_trans_repo_imp.dart';
import 'package:business_tools/features/text_translate/domain/repositories/text_trans_repo.dart';
import 'package:business_tools/features/text_translate/domain/usecases/save_text_uc.dart';
import 'package:business_tools/features/text_translate/domain/usecases/trans_text_uc.dart';
import 'package:business_tools/features/text_translate/presentation/bloc/cubit/text_trans_cubit.dart';
import 'package:business_tools/features/video_translator/data/datasources/vd_db_fun.dart';
import 'package:business_tools/features/video_translator/data/datasources/vd_remote_dara_source.dart';
import 'package:business_tools/features/video_translator/data/repositories/vd_translate_imp.dart';
import 'package:business_tools/features/video_translator/domain/repositories/vd_translate_repo.dart';
import 'package:business_tools/features/video_translator/domain/usecases/download_trans_uc.dart';
import 'package:business_tools/features/video_translator/domain/usecases/get_trans_cript.dart';
import 'package:business_tools/features/video_translator/domain/usecases/get_trans_from_file_uc.dart';
import 'package:business_tools/features/video_translator/domain/usecases/vd_trans_real_time.dart';
import 'package:business_tools/features/video_translator/domain/usecases/vd_translate_uc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/pick_file_cubit/pick_file_cubit.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_download_bloc/vd_download_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
  // ** Core Dependencies **
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => CustomSnakBar());

  // ** Home Feature **
  sl.registerFactory(() => HomeCubit());

  // ** Extract Feature **
  _initExtractFeature();

  // ** Video Translation Feature **
  _initVdTranslateFeature();

  // ** Text Translation Feature **
  _initTextTranslateFeature();

  // ** Spell Checker Feature **
  _initSpellCheckerFeature();

  // ** Text Extraction Feature **
  _initTextExtractFeature();

  // ** Onboarding & Check **
  sl.registerFactory(() => OnboardingCubit());
  sl.registerFactory(() => CheckCubit());

  // ** Ads Feature **
  _initAdsFeature();

  // ** Summary Feature **
  _initSummaryFeature();
}

void _initExtractFeature() {
  // Bloc
  sl.registerFactory(() => ExtractBloc(exNumbersUc: sl(), exEmailsUc: sl(), saveDatasUc: sl()));
  sl.registerFactory(() => SaveDataBloc(saveDatasUc: sl()));

  // Use Cases
  sl.registerLazySingleton(() => ExNumbersUc(extractRepo: sl()));
  sl.registerLazySingleton(() => ExEmailsUc(extractRepo: sl()));
  sl.registerLazySingleton(() => SaveDatasUc(extractRepo: sl()));

  // Repository
  sl.registerLazySingleton<ExtractRepo>(() => ExtractRepoImp(localDataSource: sl()));

  // Data Source
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp());
}

void _initVdTranslateFeature() {
  // Bloc
  sl.registerFactory(() => VdTranslateBloc(vdTranslateUc: sl(), getTransCriptUc: sl(), getTransFromFileUc: sl()));
  sl.registerFactory(() => VdViewCubit(vdTransRealTimeUc: sl()));
  sl.registerFactory(() => VdDownloadBloc(downloadTransUc: sl()));
  sl.registerFactory(() => PickFileCubit());

  // Use Cases
  sl.registerLazySingleton(() => VdTranslateUc(vdTranslateRepo: sl()));
  sl.registerLazySingleton(() => DownloadTransUc(vdTranslateRepo: sl()));
  sl.registerLazySingleton(() => GetTransCriptUc(vdTranslateRepo: sl()));
  sl.registerLazySingleton(() => VdTransRealTimeUc(vdTranslateRepo: sl()));
  sl.registerLazySingleton(() => GetTransFromFileUc(vdTranslateRepo: sl()));

  // Repository
  sl.registerLazySingleton<VdTranslateRepo>(() => VdTranslateRepoImp(vdRemoteDataSource: sl()));

  // Data Source
  sl.registerLazySingleton<VdRemoteDaraSource>(() => VdRemoteDaraSourceImp(vdDbFunHelping: sl()));
  sl.registerLazySingleton(() => VdDbFunHelping());
}

void _initTextTranslateFeature() {
  // Bloc
  sl.registerFactory(() => TextTransCubit(saveTextUc: sl(), transTextUc: sl()));

  // Use Cases
  sl.registerLazySingleton(() => SaveTextUc(textTransRepo: sl()));
  sl.registerLazySingleton(() => TransTextUc(textTransRepo: sl()));

  // Repository
  sl.registerLazySingleton<TextTransRepo>(() => TextTransRepoImp(textTransRemoteDataSource: sl()));

  // Data Source
  sl.registerLazySingleton<TextTransRemoteDataSource>(() => TextTransRemoteDataSourceImp());
}

void _initSpellCheckerFeature() {
  // Bloc
  sl.registerFactory(() => SpellCheckerCubit(saveTextSpelled: sl(), spellTextCheckerUc: sl()));

  // Use Cases
  sl.registerLazySingleton(() => SaveTextSpelled(spellCheckerRepo: sl()));
  sl.registerLazySingleton(() => SpellTextCheckerUc(spellCheckerRepo: sl()));

  // Repository
  sl.registerLazySingleton<SpellCheckerRepo>(() => SpellCheckerRepoImp(spellCheckerRemoteData: sl()));

  // Data Source
  sl.registerLazySingleton<SpellCheckerRemoteData>(() => SpellCheckerRemoteDataImp());
}

void _initTextExtractFeature() {
  // Bloc
  sl.registerFactory(() => TextExtractBloc(cropImageUc: sl(), extractTextUc: sl(), pickImageUc: sl()));

  // Use Cases
  sl.registerLazySingleton(() => CropImageUc(textExtractRepo: sl()));
  sl.registerLazySingleton(() => ExtractTextUc(textExtractRepo: sl()));
  sl.registerLazySingleton(() => PickImageUc(textExtractRepo: sl()));

  // Repository
  sl.registerLazySingleton<TextExtractRepo>(() => TextExtractRepoImp(textExtractRemoteData: sl()));

  // Data Source
  sl.registerLazySingleton<TextExtractRemoteData>(() => TextExtractRemoteDataImp());
}

void _initAdsFeature() {
  // Bloc
  sl.registerFactory(() => AdsBloc(adsUc: sl(), interstitialAdUc: sl(), rewardedAdUc: sl()));

  // Use Cases
  sl.registerLazySingleton(() => AdsUc(adsRepo: sl()));
  sl.registerLazySingleton(() => InterstitialAdUc(adsRepo: sl()));
  sl.registerLazySingleton(() => RewardedAdUc(adsRepo: sl()));

  // Repository
  sl.registerLazySingleton<AdsRepo>(() => AdsRepoImp(adsRemoteData: sl()));

  // Data Source
  sl.registerLazySingleton<AdsRemoteData>(() => AdsRemoteDataImp());
}

void _initSummaryFeature() {
  // Bloc
  sl.registerFactory(() => SummarySetupCubit());
  sl.registerFactory(() => SummaryViewCubit(exportUc: sl(), addSummaryUc: sl()));
  sl.registerFactory(() => SummaryViewBloc(summaryUc: sl(), vdInfoExctractUs: sl(), getSummaryUc: sl()));
  sl.registerFactory(() => SummaryHomeCubit(fetchSummariesUs: sl(), deleteSummaeyUc: sl()));

  // Use Cases
  sl.registerLazySingleton(() => SummaryUc(summaryRepo: sl()));
  sl.registerLazySingleton(() => VdInfoExctractUs(summaryRepo: sl()));
  sl.registerLazySingleton(() => ExportUc(summaryRepo: sl()));
  sl.registerLazySingleton(() => AddSummaryUc(summaryRepo: sl()));
  sl.registerLazySingleton(() => FetchSummariesUs(summaryRepo: sl()));
  sl.registerLazySingleton(() => DeleteSummaeyUc(summaryRepo: sl()));
  sl.registerLazySingleton(() => GetSummaryUc(summaryRepo: sl()));

  // Repository
  sl.registerLazySingleton<SummaryRepo>(() => SummaryRepoImp(remoteSource: sl(), localSource: sl()));

  // Data Source
  sl.registerLazySingleton<SummaryRemoteSource>(() => SummaryRemoteSourceImp());
  sl.registerLazySingleton<SummaryLocalSource>(() => SummaryLocalSourceImp(sqLiteHelper: sl()));
  //other
  sl.registerLazySingleton<SQLiteHelper>(() => SQLiteHelper());
}
