import '../models/app_models.dart';

class RecommendationService {
  const RecommendationService();

  List<RecommendationModel> recommend({
    required UserModel student,
    required List<QuestionModel> questions,
    required List<AssessmentAnswerModel> answers,
    required List<MajorModel> majors,
  }) {
    final Map<String, int> values = <String, int>{
      for (final AssessmentAnswerModel answer in answers)
        answer.questionId: answer.value,
    };

    final List<RecommendationModel> results = majors.map(
          (MajorModel major) {
        double earned = 0;
        double possible = 0;

        for (final QuestionModel question in questions.where(
              (QuestionModel item) => item.relatedMajors.contains(major.id),
        )) {
          final int value = values[question.id] ?? 0;

          earned += (value * question.weight).toDouble();
          possible += (5 * question.weight).toDouble();
        }

        final List<String> matched = major.requiredSkills
            .where(student.skills.contains)
            .toList();

        final List<String> missing = major.requiredSkills
            .where(
              (String skill) => !student.skills.contains(skill),
        )
            .toList();

        final int interestCount = major.relatedInterests
            .where(student.interests.contains)
            .length;

        final double quiz =
        possible == 0 ? 0 : earned / possible * 65;

        final double skill = major.requiredSkills.isEmpty
            ? 0
            : matched.length.toDouble() /
            major.requiredSkills.length.toDouble() *
            20;

        final double interest = major.relatedInterests.isEmpty
            ? 0
            : interestCount.toDouble() /
            major.relatedInterests.length.toDouble() *
            12;

        final double gpa = student.gpa >= 4
            ? 3
            : student.gpa >= 3
            ? 2
            : 1;

        return RecommendationModel(
          major: major,
          score: (quiz + skill + interest + gpa)
              .clamp(0, 100)
              .toDouble(),
          reasons: <String>[
            'إجاباتك في محور ${major.category} تدعم هذا المسار.',
            if (matched.isNotEmpty)
              'لديك مهارات متوافقة: ${matched.join('، ')}.',
          ],
          matchedSkills: matched,
          missingSkills: missing,
        );
      },
    ).toList();

    results.sort(
          (RecommendationModel first, RecommendationModel second) =>
          second.score.compareTo(first.score),
    );

    return results;
  }
}