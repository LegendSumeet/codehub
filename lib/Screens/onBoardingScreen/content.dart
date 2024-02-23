class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Stay Informed about Tech Events",
    image: "assets/images/image1.png",
    desc: "Explore and stay updated on upcoming tech events in your industry.",
  ),
  OnboardingContents(
    title: "Receive Real-time Event Notifications",
    image: "assets/images/image3.png",
    desc:
    "Get instant notifications for new events and updates to never miss out.",
  ),
];
