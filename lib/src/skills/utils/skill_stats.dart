import '../../../data/models/skill_model.dart';

class SkillStats {
  static int calculateTotalPoints(List<Skill> skills) {
    return skills.fold(0, (sum, skill) => sum + skill.points);
  }

  static double calculateAveragePercentage(List<Skill> skills) {
    if (skills.isEmpty) return 0;
    final total = calculateTotalPoints(skills);
    return (total / (skills.length * 1000)) * 100;
  }

  static String formatPercentage(double percentage) {
    return '${percentage.round()}%';
  }
}
