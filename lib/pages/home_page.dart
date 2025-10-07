import 'package:flutter/material.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/size.dart';
import 'package:my_portifolio/widgets/animated_skills_section.dart';
import 'package:my_portifolio/widgets/contact_section.dart';
import 'package:my_portifolio/widgets/drawer_mobile.dart';
import 'package:my_portifolio/widgets/header_desktop.dart';
import 'package:my_portifolio/widgets/header_mobile.dart';
import 'package:my_portifolio/widgets/main_desktop.dart';
import 'package:my_portifolio/widgets/main_mobile.dart';
import 'package:my_portifolio/widgets/projects_section.dart';
// import 'package:my_portifolio/widgets/skills_desktop.dart';
// import 'package:my_portifolio/widgets/skills_mobile.dart';
import 'package:my_portifolio/widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final scrollController = ScrollController();
  final homeSectionKey = GlobalKey();
  final skillsSectionKey = GlobalKey();
  final projectsSectionKey = GlobalKey();
  final contactSectionKey = GlobalKey();

  bool showSkillsAnimation = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) _checkSkillsPosition();
      });
    });
  }

  void _onScroll() {
    _checkSkillsPosition();
  }

  void _checkSkillsPosition() {
    final context = skillsSectionKey.currentContext;
    if (context == null) return;

    try {
      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) return;

      final position = box.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(this.context).size.height;

      final bool isInView =
          position.dy < screenHeight * 0.8 &&
          position.dy > -box.size.height / 2;

      if (isInView != showSkillsAnimation) {
        if (mounted) {
          setState(() {
            showSkillsAnimation = isInView;
          });
        }
      }
    } catch (e) {
      debugPrint('Erro ao checar posição: $e');
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(int navIndex) {
    // Item blog - 3 is ignored for now
    if (navIndex == 3) return; 

    late GlobalKey key;
    switch (navIndex) {
      case 0: // Home
        key = homeSectionKey;
        break;
      case 1: // Skills
        key = skillsSectionKey;
        break;
      case 2: // Projects
        key = projectsSectionKey;
        break;
      case 4: // Contact 
        key = contactSectionKey;
        break;
      default:
        return;
    }

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= kMinDesktopWidth;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: isDesktop ? null : DrawerMobile(onNavItemTap: scrollToSection),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(isDesktop ? 70 : 60), 
            child: isDesktop
                ? HeaderDesktop(onNavMenuTap: scrollToSection)
                : HeaderMobile(
                    onLogoTap: () {
                      scrollToSection(0);
                    },
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Main
                Container(
                key: homeSectionKey,
                child: isDesktop
                    ? MainDesktop(onGetInTouchTap: () => scrollToSection(4))
                    : MainMobile(onGetInTouchTap: () => scrollToSection(4)),
              ),

                // Skills
                AnimatedSkillsSection(
                  key: skillsSectionKey,
                  isVisible: showSkillsAnimation,
                  child: const SkillsSection(),
                ),

                // Projects
                Container(
                    key: projectsSectionKey, 
                    child: const ProjectsSection()
                ),

                // Contacts
                Container(
                  key: contactSectionKey,
                  child: const ContactSection(),
                ),

                // Footer
                Container(
                  height: 50,
                  width: double.maxFinite,
                  color: CustomColor.bgLight2,
                  alignment: Alignment.center,
                  child: const Text(
                    'Made by Jorge Machado with Flutter 3.32.8 version',
                    style: TextStyle(
                      color: CustomColor.whiteSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
