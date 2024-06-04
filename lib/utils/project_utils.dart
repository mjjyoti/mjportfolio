class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });
}


//work projects
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
      image: 'assets/projects/1.png',
      title: 'SlimFit Gym App',
      subtitle: 'This is a Gym App',
      androidLink: 'playstore'),
  ProjectUtils(
      image: 'assets/projects/2.png',
      title: 'astrogyata ',
      subtitle: 'atrology details app'),
  ProjectUtils(
      image: 'assets/projects/3.png',
      title: 'pis ',
      subtitle: 'tracking details app')
];
