# My Flutter Portfolio

![My Portfolio Desktop Screenshot](assets/readme_picture_desktop.png)
![My Portfolio Mobile Screenshot](assets/readme_picture_mobile.png)

## 🚀 About This Project

This is my personal portfolio, developed entirely with Flutter. The main goal of this project was to apply and deepen my knowledge in responsive web development using the technologies I work with daily. As a developer in career transition, this portfolio serves as a practical showcase of my current skills in creating modern and accessible interfaces.

The project is designed to be fully responsive, offering an optimized experience for both desktop and mobile devices.

---

## ✨ Features

- **Fully Responsive:** Adapts seamlessly to different screen sizes, from mobile to desktop.
- **Smooth Scrolling & Animations:** Implemented scroll-to-section navigation and subtle on-scroll animations for a better user experience.
- **Dynamic Content:** Includes sections for skills, projects, and a functional contact form.
- **Clean Architecture:** Components are separated into individual widgets for better organization and reusability.
- **Performance Optimized:** Throttled scroll listeners (83% reduction in checks)
  Smart animation state management
  RepaintBoundary isolation for smooth 60 FPS
- **Dynamic Sections:** Skills showcase with platform icons and technology badges
  Projects carousel with detailed cards
  Contact form with validation

---

## 🛠️ Technologies Used

This project was built using the following technologies:

- **Framework:** [Flutter](https://flutter.dev/) (version 3.32.8)
- **Language:** [Dart](https://dart.dev/)
- **Key Packages:**
  - `url_launcher` for opening external links.
  - `gap` for spacements

---

**📱 Sections**

1. **Home / About Me**
   Introduction with profile picture and career transition story.
2. **Skills**
   Visual showcase of:

Platforms: Android, Web, iOS, Desktop development
Technologies: Flutter, Dart, HTML5, CSS3, JavaScript, GitHub, Figma, and more

3. **Projects**
   Interactive carousel featuring:

Work projects
Hobby projects
Direct links to live demos and repositories

4. **Contact**
   Functional contact form with:

Name validation
Email format validation
Message requirement
Success/error feedback

## 🎨 Design Highlights

Color Scheme: Custom dark theme with accent colors
Typography: Clean, modern font hierarchy
Animations: Subtle fade-in and slide-up effects on scroll
Layout: Grid-based responsive design adapting to screen sizes
Icons: Custom platform and technology icons

## ⚡ Performance Optimizations

The portfolio implements several performance optimizations:

Throttled Scroll Detection (100ms intervals)

Reduces listener calls from ~60/s to ~10/s (83% improvement)

Smart Animation State Management

Skips checks for already-animated sections (75% fewer calculations)

Optimized Animation Layers

Reduced from 3 to 2 simultaneous animations
Shorter duration (500ms vs 600ms)

RepaintBoundary Isolation

Prevents unnecessary widget repaints during animations

Responsive Thresholds

Different visibility thresholds for mobile vs desktop
Ensures animations trigger at optimal scroll positions

## 📂 Project Structure

lib/
├── constants/
│ ├── colors.dart # Custom color palette
│ ├── size.dart # Responsive breakpoints
│ └── skill_items.dart # Skills and platforms data
├── utils/
│ └── project_utils.dart # Project data models
├── widgets/
│ ├── animated_sections.dart # Scroll animation wrapper
│ ├── contact_section.dart # Contact form
│ ├── drawer_mobile.dart # Mobile navigation
│ ├── header_desktop.dart # Desktop navigation
│ ├── header_mobile.dart # Mobile header
│ ├── main_desktop.dart # Desktop hero section
│ ├── main_mobile.dart # Mobile hero section
│ ├── project_card.dart # Project card component
│ ├── projects_section.dart # Projects showcase
│ └── skills_section.dart # Skills grid
└── pages/
└── home_page.dart # Main page with scroll detection

## Getting Started

This is a standard Flutter project. To get a local copy up and running, follow these simple steps.

### Prerequisites

- You need to have Flutter SDK installed. For instructions, see the [official documentation](https://docs.flutter.dev/get-started/install).

### Installation

1.  Clone the repo:
    ```sh
    git clone [https://github.com/MachadoJorgeH/flutter_portfolio.git](https://github.com/MachadoJorgeH/flutter_portfolio.git)
    ```
2.  Navigate to the project directory:
    ```sh
    cd flutter_portfolio
    ```
3.  Install dependencies:
    ```sh
    flutter pub get
    ```
4.  Run the app (e.g., on Chrome):
    ```sh
    flutter run -d chrome
    ```

---

## 🤝 Contributing

This is a personal portfolio project, but suggestions and feedback are always welcome! Feel free to:

Fork the project
Create a feature branch (git checkout -b feature/AmazingFeature)
Commit your changes (git commit -m 'feat: add some AmazingFeature')
Push to the branch (git push origin feature/AmazingFeature)
Open a Pull Request

## Contact

Jorge Henrique Machado - [jorgehenriqueq@gmail.com](mailto:jorgehenriqueq@gmail.com)

Project Link: [https://github.com/MachadoJorgeH/flutter_portfolio](https://github.com/MachadoJorgeH/flutter_portfolio)
