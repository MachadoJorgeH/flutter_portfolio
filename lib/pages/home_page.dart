import 'package:flutter/material.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/size.dart';
import 'package:my_portifolio/widgets/animated_sections.dart';
import 'package:my_portifolio/widgets/contact_section.dart';
import 'package:my_portifolio/widgets/drawer_mobile.dart';
import 'package:my_portifolio/widgets/header_desktop.dart';
import 'package:my_portifolio/widgets/header_mobile.dart';
import 'package:my_portifolio/widgets/main_desktop.dart';
import 'package:my_portifolio/widgets/main_mobile.dart';
import 'package:my_portifolio/widgets/projects_section.dart';
import 'package:my_portifolio/widgets/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  final List<GlobalKey> sectionKeys = [
    GlobalKey(), // 0: Home
    GlobalKey(), // 1: Skills
    GlobalKey(), // 2: Projects
    GlobalKey(), // 3: Contact
  ];
  
  final Map<GlobalKey, bool> _animationStates = {};

  @override
  void initState() {
    super.initState();
    
    for (var key in sectionKeys) {
      _animationStates[key] = false;
    }

    scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAllPositions();
    });
  }

  void _onScroll() {
    _checkAllPositions();
  }

  void _checkAllPositions() {
    for (var key in sectionKeys) {
      final context = key.currentContext;
      if (context == null) continue;

      try {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null || !box.hasSize) continue;

        final position = box.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(context).size.height;

        final bool isInView =
            position.dy < screenHeight * 0.8 &&
            position.dy > -box.size.height / 2;

        if (isInView != _animationStates[key]) {
          if (mounted) {
            setState(() {
              _animationStates[key] = isInView;
            });
          }
        }
      } catch (e) {
        debugPrint('Erro ao checar posição: $e');
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 3) return;

    // Home (índice 0) -> sectionKeys[0]
    // Skills (índice 1) -> sectionKeys[1]
    // Projects (índice 2) -> sectionKeys[2]
    // Contact (índice 4) -> sectionKeys[3]
    int keyIndex = navIndex > 2 ? navIndex - 1 : navIndex;

    if (keyIndex < 0 || keyIndex >= sectionKeys.length) return;

    final key = sectionKeys[keyIndex];
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
                AnimatedSection(
                  key: sectionKeys[0],
                  isVisible: _animationStates[sectionKeys[0]] ?? false,
                  child: isDesktop
                      ? MainDesktop(onGetInTouchTap: () => scrollToSection(4))
                      : MainMobile(onGetInTouchTap: () => scrollToSection(4)),
                ),

                // Skills
                AnimatedSection(
                  key: sectionKeys[1],
                  isVisible: _animationStates[sectionKeys[1]] ?? false,
                  child: const SkillsSection(),
                ),

                // Projects
                AnimatedSection(
                  key: sectionKeys[2],
                  isVisible: _animationStates[sectionKeys[2]] ?? false,
                  child: const ProjectsSection(),
                ),

                // Contacts
                AnimatedSection(
                  key: sectionKeys[3],
                  isVisible: _animationStates[sectionKeys[3]] ?? false,
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
