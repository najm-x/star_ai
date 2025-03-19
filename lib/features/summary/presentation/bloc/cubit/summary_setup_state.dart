part of 'summary_setup_cubit.dart';

enum StateSetUp { init, loading, done, error, changeType, changSzie, changeLang }

class SummarySetupState extends Equatable {
  final String vdUrl;
  final String? summarylen;
  final String summaryType;
  final String lang;
  final StateSetUp state;
  const SummarySetupState(
      {this.vdUrl = "", this.summarylen , this.summaryType = "", this.lang = "ar", this.state = StateSetUp.init});
  SummarySetupState copyWith({StateSetUp? state, String? vdUrl, String? summarylen, String? summaryType, String? lang}) {
    return SummarySetupState(
        state: state ?? this.state,
        lang: lang ?? this.lang,
        summaryType: summaryType ?? this.summaryType,
        summarylen: summarylen ?? this.summarylen,
        vdUrl: vdUrl ?? this.vdUrl);
  }

  @override
  List<Object?> get props => [vdUrl, summaryType, summarylen, lang, state];
}
