class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? githubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.githubLink,
  });
}

// ###############
// HOBBY PROJECTS
List<ProjectUtils> hobbyProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/MindFlow.png',
    title: 'Mind Flow',
    subtitle:
        'Habit Tracking and Personal Development App, built with Flutter + Firebase, focusing on productivity, well-being, and routine organization.',
    githubLink: 'https://github.com/MachadoJorgeH/mindflowproject',
  ),
  // ),
  ProjectUtils(
    image: 'assets/projects/Moovzdle.png',
    title: 'Moovzdle',
    subtitle: 'A funny game for employees entertainment',
    githubLink: 'https://github.com/MachadoJorgeH/moovzdle',
    webLink: 'https://moovzdle.vercel.app/',
  ),
  ProjectUtils(
    image: 'assets/projects/MovieApp.png',
    title: 'Movie App Flutter',
    subtitle:
        'Flutter application that lists popular movies using the TMDb API, with navigation to the details screen.',
    githubLink: 'https://github.com/MachadoJorgeH/movie_app_flutter',
  ),
  ProjectUtils(
    image: 'assets/projects/imcCalculator.png',
    title: 'IMC Calculator',
    subtitle:
        'app em Flutter para calcular o Índice de Massa Corporal',
    githubLink:
        'https://github.com/MachadoJorgeH/imc_calculator_flutter/',
  ),
];

// ###############
// WORK PROJECTS
List<ProjectUtils> workProjectUtils = [
  ProjectUtils(
    image: 'assets/projects/Moovz.png',
    title: 'Moovz App',
    subtitle:
        'Take your gym routine to the next level with Moovz, providing a personalized, engaging, and motivating workout experience.',
    androidLink:
        'https://play.google.com/store/apps/details?id=app.moovz.training&hl=pt_BR',
    iosLink: "https://apps.apple.com/br/app/moovz/id6503343516",
  ),

];
