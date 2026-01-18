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

  bool _isChecking = false;
  DateTime _lastCheck = DateTime.now();

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
    final now = DateTime.now();
    if (_isChecking || now.difference(_lastCheck).inMilliseconds < 100) {
      return;
    }

    _isChecking = true;
    _lastCheck = now;

    _checkAllPositions();

    _isChecking = false;
  }

  void _checkAllPositions() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < kMinDesktopWidth;

    for (int i = 0; i < sectionKeys.length; i++) {
      final key = sectionKeys[i];
      final context = key.currentContext;
      if (context == null) continue;

      try {
        final box = context.findRenderObject() as RenderBox?;
        if (box == null || !box.hasSize) continue;

        final position = box.localToGlobal(Offset.zero);
        final screenHeight = MediaQuery.of(this.context).size.height;
        final sectionHeight = box.size.height;

        final threshold =
            i == 2 ? (isMobile ? 0.2 : 0.4) : (isMobile ? 0.1 : 0.15);

        final topVisible = position.dy < 0 ? 0.0 : position.dy;
        final bottomVisible =
            (position.dy + sectionHeight) > screenHeight
                ? screenHeight
                : (position.dy + sectionHeight);

        final visibleHeight = (bottomVisible - topVisible).clamp(
          0.0,
          sectionHeight,
        );

        final visibilityRatio =
            sectionHeight > 0 ? visibleHeight / sectionHeight : 0.0;

        final bool isInViewport =
            position.dy < screenHeight && (position.dy + sectionHeight) > 0;
        final bool meetsThreshold = visibilityRatio >= threshold;
        final bool isInView = isInViewport && meetsThreshold;

        if (isInView != _animationStates[key]) {
          if (mounted) {
            setState(() {
              _animationStates[key] = isInView;
            });
          }
        }

        // Debug apenas para projects quando solicitado
        // if (i == 2 && false) {
        //   // Mude para true para debug
        //   debugPrint('Projects (${isMobile ? 'Mobile' : 'Desktop'})');
        //   debugPrint('Position.dy: ${position.dy.toStringAsFixed(1)}');
        //   debugPrint('Section height: ${sectionHeight.toStringAsFixed(1)}');
        //   debugPrint('Screen height: ${screenHeight.toStringAsFixed(1)}');
        //   debugPrint('Visible height: ${visibleHeight.toStringAsFixed(1)}');
        //   debugPrint(
        //     'Visibility: ${(visibilityRatio * 100).toStringAsFixed(1)}%',
        //   );
        //   debugPrint('Required: ${(threshold * 100).toStringAsFixed(1)}%');
        //   debugPrint('InView: $isInView\n');
        // }
      } catch (e) {
        debugPrint('Erro ao checar posição da seção $i: $e');
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

    int keyIndex = navIndex > 2 ? navIndex - 1 : navIndex;

    if (keyIndex < 0 || keyIndex >= sectionKeys.length) return;

    final key = sectionKeys[keyIndex];
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.1,
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
          endDrawer:
              isDesktop ? null : DrawerMobile(onNavItemTap: scrollToSection),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(isDesktop ? 70 : 60),
            child:
                isDesktop
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
                // Main (Home)
                AnimatedSection(
                  key: sectionKeys[0],
                  isVisible: _animationStates[sectionKeys[0]] ?? false,
                  child:
                      isDesktop
                          ? MainDesktop(
                            onGetInTouchTap: () => scrollToSection(4),
                          )
                          : MainMobile(
                            onGetInTouchTap: () => scrollToSection(4),
                          ),
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
                  duration: const Duration(milliseconds: 500),
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
