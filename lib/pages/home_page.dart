import 'package:flutter/material.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/constants/size.dart';
import 'package:my_portifolio/widgets/animated_skills_section.dart';
import 'package:my_portifolio/widgets/drawer_mobile.dart';
import 'package:my_portifolio/widgets/header_desktop.dart';
import 'package:my_portifolio/widgets/header_mobile.dart';
import 'package:my_portifolio/widgets/main_desktop.dart';
import 'package:my_portifolio/widgets/main_mobile.dart';
import 'package:my_portifolio/widgets/skills_desktop.dart';
import 'package:my_portifolio/widgets/skills_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final skillsSectionKey = GlobalKey();

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= kMinDesktopWidth;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: isDesktop ? null : const DrawerMobile(),
          body: ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              // Header
              if (isDesktop)
                HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),

              // Main
              if (isDesktop) MainDesktop() else MainMobile(),

              // Skills
              AnimatedSkillsSection(
                key: skillsSectionKey,
                isVisible: showSkillsAnimation,
                child: isDesktop ? const SkillsDesktop() : const SkillsMobile(),
              ),

              // Projects
              Container(
                height: 500,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: const Text('Projects'),
              ),

              // Contacts
              Container(
                height: 500,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CustomColor.bgLight1,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text('Contacts'),
              ),

              // Footer
              Container(
                height: 500,
                width: double.maxFinite,
                color: CustomColor.bgLight2,
                alignment: Alignment.center,
                child: const Text('Footer'),
              ),
            ],
          ),
        );
      },
    );
  }
}
