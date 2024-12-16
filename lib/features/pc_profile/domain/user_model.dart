class UserProfile {
  final String userName;
  final String userDevice;
  final String userRole;
  final String userImageUrl;
  final String? currentProjects;
  final String? hoursWorked;
  final String? upgradeStage;
  final String? upgradesCost;

  UserProfile({
    required this.userName,
    required this.userDevice,
    required this.userRole,
    required this.userImageUrl,
    this.currentProjects,
    this.hoursWorked,
    this.upgradeStage,
    this.upgradesCost,
  });
}
