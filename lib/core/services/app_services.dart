import 'package:business_tools/core/public/custom_snak_bar.dart';
import 'package:business_tools/features/extract/data/datasources/loacal_data_source.dart';
import 'package:business_tools/features/extract/data/repositories/extract_repo_imp.dart';
import 'package:business_tools/features/extract/domain/repositories/extract_repo.dart';
import 'package:business_tools/features/extract/domain/usecases/ex_emails_uc.dart';
import 'package:business_tools/features/extract/domain/usecases/ex_numbers_uc.dart';
import 'package:business_tools/features/extract/domain/usecases/save_data_uc.dart';
import 'package:business_tools/features/extract/presentation/bloc/extract_bloc/extract_bloc.dart';
import 'package:business_tools/features/extract/presentation/bloc/save_data_bloc/save_data_bloc.dart';
import 'package:business_tools/features/onboarding/presentation/bloc/cubit/onboarding_cubit.dart';
import 'package:business_tools/features/spell_checker/data/datasources/spell_checker_remote_data.dart';
import 'package:business_tools/features/spell_checker/data/repositories/spell_checker_repo_imp.dart';
import 'package:business_tools/features/spell_checker/domain/repositories/spell_checker_repo.dart';
import 'package:business_tools/features/spell_checker/domain/usecases/save_text_spelled.dart';
import 'package:business_tools/features/spell_checker/domain/usecases/spell_text_checker_uc.dart';
import 'package:business_tools/features/spell_checker/presentation/bloc/cubit/spell_checker_cubit.dart';
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
import 'package:business_tools/features/video_translator/domain/usecases/vd_translate_uc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_download_bloc/vd_download_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_translate_bloc/vd_translate_bloc.dart';
import 'package:business_tools/features/video_translator/presentation/bloc/vd_view_cubit/vd_view_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
Future<void> init() async {
//features

//!extract
 sl.registerLazySingleton(() => CustomSnakBar()) ;
//?Bloc
  sl.registerFactory(() => ExtractBloc(exNumbersUc: sl(), exEmailsUc: sl(), saveDatasUc: sl()));
  sl.registerFactory(() => SaveDataBloc(saveDatasUc: sl()));
//?UseCases
  sl.registerLazySingleton(() => ExNumbersUc(extractRepo: sl()));
  sl.registerLazySingleton(() => ExEmailsUc(extractRepo: sl()));
  sl.registerLazySingleton(() => SaveDatasUc(extractRepo: sl()));
//?repo
  sl.registerLazySingleton<ExtractRepo>(() => ExtractRepoImp(localDataSource: sl()));
//?dataSource
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImp());
//!vdTranslate
//?Bloc
  sl.registerFactory(() => VdTranslateBloc(vdTranslateUc: sl()));
  sl.registerFactory(() => VdViewCubit());
  sl.registerFactory(() => VdDownloadBloc(downloadTransUc: sl()));
//?UseCases
  sl.registerLazySingleton(() => VdTranslateUc(vdTranslateRepo: sl()));
  sl.registerLazySingleton(() => DownloadTransUc(vdTranslateRepo: sl()));
//?repo
  sl.registerLazySingleton<VdTranslateRepo>(() => VdTranslateRepoImp(vdRemoteDataSource: sl()));
//?dataSource
  sl.registerLazySingleton<VdRemoteDaraSource>(() => VdRemoteDaraSourceImp(vdDbFunHelping: sl()));
  sl.registerLazySingleton(() => VdDbFunHelping());
//!TextTranslate
//?Bloc
  sl.registerFactory(() => TextTransCubit(saveTextUc: sl(), transTextUc: sl()));
//?UseCases
  sl.registerLazySingleton(() => SaveTextUc(textTransRepo: sl()));
  sl.registerLazySingleton(() => TransTextUc(textTransRepo: sl()));
//?repo
  sl.registerLazySingleton<TextTransRepo>(() => TextTransRepoImp(textTransRemoteDataSource: sl()));
//?dataSource
  sl.registerLazySingleton<TextTransRemoteDataSource>(() => TextTransRemoteDataSourceImp());
//!SpellChecker
//?Bloc
  sl.registerFactory(() => SpellCheckerCubit(saveTextSpelled: sl(), spellTextCheckerUc: sl()));
//?UseCases
  sl.registerLazySingleton(() => SaveTextSpelled(spellCheckerRepo: sl()));
  sl.registerLazySingleton(() => SpellTextCheckerUc(spellCheckerRepo: sl()));
//?repo
  sl.registerLazySingleton<SpellCheckerRepo>(() => SpellCheckerRepoImp(spellCheckerRemoteData: sl()));
//?dataSource
  sl.registerLazySingleton<SpellCheckerRemoteData>(() => SpellCheckerRemoteDataImp());
//!TextExtracr
//?Bloc
  sl.registerFactory(() => TextExtractBloc(cropImageUc: sl() , extractTextUc: sl() , pickImageUc: sl()));
//?UseCases
  sl.registerLazySingleton(() => CropImageUc(textExtractRepo: sl()));
  sl.registerLazySingleton(() => ExtractTextUc(textExtractRepo: sl())); 
  sl.registerLazySingleton(() => PickImageUc(textExtractRepo: sl())); 
//?repo
  sl.registerLazySingleton<TextExtractRepo>(() => TextExtractRepoImp(textExtractRemoteData: sl()));
//?dataSource
  sl.registerLazySingleton<TextExtractRemoteData>(() => TextExtractRemoteDataImp());
  //!OnBoarding
//?Bloc
  sl.registerFactory(() => OnboardingCubit());
}
