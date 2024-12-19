import 'legal_notice_model.dart';

class LegalSectionModel {
  final String sectionTitle;
  final List<LegalNoticeModel> notices;

  LegalSectionModel({
    required this.sectionTitle,
    required this.notices,
  });
} 