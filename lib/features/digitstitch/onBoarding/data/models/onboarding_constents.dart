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
    title: "Discover Latest Products",
    image: "assets/images/secure_payment.jpg",
    desc: "Explore a wide range of products from various categories.",
  ),
  OnboardingContents(
    title: "Easy Shopping Experience",
    image: "assets/images/secure_payment.jpg",
    desc:
    "Enjoy a hassle-free shopping experience with our user-friendly interface.",
  ),
  OnboardingContents(
    title: "Secure Payment Options",
    image: "assets/images/secure_payment.jpg",
    desc:
    "Shop confidently with our secure payment options and encrypted transactions.",
  ),
];
