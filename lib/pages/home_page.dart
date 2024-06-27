import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart' hide TextDirection;
import '../models/git_info.dart';
import '../models/project_to_find.dart';
import 'home_page_view_model.dart';
import '../themes/app_colors.dart';
import '../themes/text_styles.dart';
import '../widgets/animated/app_animated_icon/app_animated_icon.dart';
import '../widgets/app_link_icon.dart';
import '../widgets/painters/arrow_painter.dart';
import '../widgets/painters/separator_painter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String myEmail = 'bruno.coelho.contato@hotmail.com';
  // static const String sectionTitle = 'Projetos em destaque';

  @override
  void initState() {
    super.initState();

    final viewModel = Provider.of<HomePageViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getRepoInfo();
      viewModel.filterRepoInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // SliverPersistentHeader(
            //   pinned: true,
            //   delegate: CustomSliverAppBar(),
            // ),
          ];
        },
        body: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return ListView(
              children: [
                Container(
                  height: 650,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        const Color(0xff1B1C25),
                        Colors.black.withOpacity(.9)
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 487.0, bottom: 8),
                        child: Text(
                          'OI 👋 EU SOU O BRUNO',
                          style: TextStyles.title.copyWith(
                            color: AppColors.blackGrey,
                            fontSize: 24,
                            fontFamily: 'Scada',
                            fontWeight: FontWeight.w900,
                            letterSpacing: -.5,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 28,
                          ),
                          Text(
                            'FLUTTER',
                            textAlign: TextAlign.start,
                            style: TextStyles.title.copyWith(
                              height: .9,
                              letterSpacing: 4,
                              color: AppColors.white,
                              fontSize: 140,
                              fontFamily: 'Scada',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            width: 22.5,
                          ),
                          const AppAnimatedIcon(
                            icon: FontAwesomeIcons.linkedin,
                            url:
                                'https://www.linkedin.com/in/bruno-coelho-2337741b5/',
                          ),
                          const SizedBox(
                            width: 22.5,
                          ),
                          const AppAnimatedIcon(
                            icon: FontAwesomeIcons.github,
                            url: 'https://github.com/BrunoRabbit',
                          ),
                          const SizedBox(
                            width: 22.5,
                          ),
                          const AppAnimatedIcon(
                            icon: FontAwesomeIcons.solidFileLines,
                            url: '',
                          ),
                        ],
                      ),
                      Text(
                        'DEVELOPER',
                        textAlign: TextAlign.start,
                        style: TextStyles.title.copyWith(
                          letterSpacing: 4,
                          height: .9,
                          color: AppColors.white,
                          fontSize: 140,
                          fontFamily: 'Scada',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 500, right: 300),
                        child: Text(
                          '\t\t\t\t\tTENHO ${viewModel.findMyAge()} ANOS SOU UM DESENVOLVEDOR MOBILE COM 1 ANO DE EXPERIENCIA PROFISSIONAL E SOU FORMADO EM ANÁLISE E DESENVOLVIMENTO DE SISTEMAS PELA FATEC, GOSTO DE OFERECER SOLUÇÕES EFICIENTES, AUXILIAR NA SOLUÇÃO DE PROBLEMAS E TRABALHAR EM EQUIPE. COSTUMO SEMPRE APRENDER ASSUNTOS NOVOS E SOLIDIFICAR MEU CONHECIMENTO.',
                          style: TextStyles.title.copyWith(
                            color: AppColors.blackGrey,
                            fontSize: 15,
                            fontFamily: 'Scada',
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: SeparatorPainter(
                            color: Colors.black.withOpacity(.9)),
                        child: const SizedBox(
                          height: 120,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),

                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(),
                //       child: Stack(
                //         children: [
                //           Text(
                //             sectionTitle,
                //             style: TextStyle(
                //               fontSize: 30,
                //               fontFamily: 'Scala',
                //               fontWeight: FontWeight.w600,
                //               letterSpacing: 2,
                //               foreground: Paint()
                //                 ..style = PaintingStyle.stroke
                //                 ..strokeWidth = 3
                //                 ..color = Colors.black.withOpacity(.7),
                //             ),
                //           ),
                //           Text(
                //             sectionTitle,
                //             style: TextStyle(
                //               fontFamily: 'Scala',
                //               fontWeight: FontWeight.w600,
                //               letterSpacing: 2,
                //               color: Colors.white,
                //               fontSize: 30,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: viewModel.filteredGitInfos.length,
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 160),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    final item = viewModel.filteredGitInfos[index];

                    return HoverListItem(
                      index: index,
                      item: item!,
                    );
                  },
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: SeparatorPainter(
                          color: const Color(0xffCFBEE9),
                          drawAtBottom: true,
                        ),
                        child: const SizedBox(
                          height: 120,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 652,
                  decoration: const BoxDecoration(
                    gradient: AppColors.yellowCyanGradient,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * .35,
                            child: Column(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Scada',
                                      fontWeight: FontWeight.w100,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            '\t\t\t\t\tSou um desenvolvedor mobile com mais de 3 anos de experiência técnica em Flutter, onde solidifiquei meu conhecimento e habilidades. Anteriormente, já utilizei React Native. Sou formado em ',
                                      ),
                                      TextSpan(
                                        text:
                                            'Análise e Desenvolvimento de Sistemas pela FATEC ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'e possuo ',
                                      ),
                                      TextSpan(
                                        text:
                                            '1 ano e 1 mês de experiência profissional utilizando Flutter.\n\n',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            '\t\t\t\t\tOfereço soluções eficientes e colaboro na resolução de problemas, valorizando o trabalho em equipe e incentivando a prática de testes. ',
                                      ),
                                      TextSpan(
                                        text:
                                            'Tenho ampla experiência no consumo de APIs ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text:
                                            'e conhecimento em arquiteturas que proporcionam uma base sólida para a manutenção e escalabilidade de projetos.\n\n',
                                      ),
                                      TextSpan(
                                        text:
                                            '\t\t\t\t\tAlém disso, estou capacitado para ensinar e compartilhar meu conhecimento técnico quando necessário. ',
                                      ),
                                      TextSpan(
                                        text:
                                            'Atualmente, estou expandindo minhas habilidades estudando ',
                                      ),
                                      TextSpan(
                                        text: 'TypeScript.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppLinkIcon(
                                      url:
                                          'https://www.linkedin.com/in/bruno-coelho-2337741b5/',
                                      icon: FontAwesomeIcons.linkedin,
                                    ),
                                    SizedBox(
                                      width: 22.5,
                                    ),
                                    AppLinkIcon(
                                      icon: FontAwesomeIcons.github,
                                      url: 'https://github.com/BrunoRabbit',
                                    ),
                                    SizedBox(
                                      width: 22.5,
                                    ),
                                    AppLinkIcon(
                                      icon: FontAwesomeIcons.solidFileLines,
                                      url: '',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          viewModel.filteredGitInfos.isEmpty ||
                                  viewModel.filteredGitInfos[0]?.ownerInfo
                                          .avatarUrl ==
                                      null
                              ? const SizedBox()
                              : Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7.0, top: 7),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          viewModel.filteredGitInfos[0]!
                                              .ownerInfo.avatarUrl,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        viewModel.filteredGitInfos[0]!.ownerInfo
                                            .avatarUrl,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ! footer
                Container(
                  color: AppColors.extraLightYellow,
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: SeparatorPainter(
                            color: AppColors.blackGreyOpacity,
                            drawAtBottom: true,
                            isReversed: true),
                        child: const SizedBox(
                          height: 100,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 325,
                  color: AppColors.blackGrey.withOpacity(.9),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 550,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/mail_box.png',
                              color: Colors.black.withOpacity(.9),
                              height: 150,
                            ),
                            Text(
                              'Me mande um email',
                              style: TextStyles.title.copyWith(
                                letterSpacing: -1,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AnimatedButton(
                                    onChanges: (isHover) {
                                      viewModel.isUserCopiedEmail(isHover);
                                    },
                                    onPress: () async {
                                      viewModel.changeText();
                                      await Clipboard.setData(
                                          const ClipboardData(
                                        text: myEmail,
                                      ));
                                    },
                                    text: myEmail,
                                    selectedText: viewModel.selectedText,
                                    textStyle: TextStyles.title.copyWith(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    animationDuration:
                                        const Duration(milliseconds: 450),
                                    animatedOn: AnimatedOn.onHover,
                                    transitionType:
                                        TransitionType.LEFT_BOTTOM_ROUNDER,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HoverListItem extends StatefulWidget {
  const HoverListItem({required this.index, required this.item, super.key});

  final int index;
  final GitInfo item;

  @override
  State<HoverListItem> createState() => _HoverListItemState();
}

class _HoverListItemState extends State<HoverListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const int animationDuration = 140;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: animationDuration),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  isPngUrl(String url) {
    if (url.contains('.png')) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomePageViewModel>(context);

    final projectToFind = ProjectToFindExtension.fromString(
      widget.item.repositoryInfo.name,
    );

    return InkWell(
      onTap: () async {
        final Uri url = Uri.parse(widget.item.repositoryInfo.htmlUrl);
        final isFailed = await launchUrl(url);

        if (isFailed) {
          throw Exception('Could not launch $url');
        }
      },
      child: MouseRegion(
        onExit: (event) {
          viewModel.isMouseHover(false, widget.index);
          _controller.reverse();
        },
        onHover: (event) {
          // if (!event) return viewModel.posUpdateIconPadding(icon);
          viewModel.isMouseHover(true, widget.index);

          _controller.forward();
        },
        child: Container(
          decoration: BoxDecoration(
            color: viewModel.isMouseEnter[widget.index]
                ? Colors.grey.withOpacity(.06)
                : widget.index.isEven
                    ? Colors.grey.withOpacity(.03)
                    : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            textDirection:
                widget.index.isEven ? TextDirection.ltr : TextDirection.rtl,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 220,
                  color: Colors.grey.withOpacity(.4),
                  child: projectToFind.imagePath.isNotEmpty
                      ? isPngUrl(projectToFind.imagePath)
                          ? Image.asset(
                              projectToFind.imagePath,
                              fit: BoxFit.cover,
                            )
                          : Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: SvgPicture.asset(
                                projectToFind.imagePath,
                                width: 240,
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                            )
                      : const SizedBox(
                          height: 200,
                          width: 340,
                        ),
                ),
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        NumberFormat("00").format(widget.index + 1),
                        style: TextStyles.subtitle.copyWith(
                          color: !viewModel.isMouseEnter[widget.index]
                              ? AppColors.blackGrey
                              : AppColors.backgroundColor.withOpacity(.9),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AnimatedBuilder(
                          animation: _controller,
                          builder: (context, _) {
                            return AnimatedContainer(
                              duration: const Duration(
                                  milliseconds: animationDuration),
                              width: !viewModel.isMouseEnter[widget.index]
                                  ? 40
                                  : 48,
                              child: Divider(
                                color: !viewModel.isMouseEnter[widget.index]
                                    ? AppColors.blackGrey
                                    : AppColors.backgroundColor.withOpacity(.9),
                              ),
                            );
                          }),
                      CustomPaint(
                        painter: ArrowPainter(_controller),
                        child: Container(
                          width: 10,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        !viewModel.isMouseEnter[widget.index]
                            ? viewModel
                                .formatTitle(widget.item.repositoryInfo.name)
                            : 'Ver projeto',
                        style: TextStyles.subtitle.copyWith(
                          color: !viewModel.isMouseEnter[widget.index]
                              ? AppColors.blackGrey
                              : AppColors.backgroundColor.withOpacity(.9),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: Text(
                      widget.item.repositoryInfo.description == ""
                          ? "Sem descrição"
                          : viewModel.formatTitle(
                              widget.item.repositoryInfo.description!),
                      style: TextStyles.title.copyWith(
                        color: AppColors.black.withOpacity(.65),
                        fontSize: 15,
                        fontFamily: 'Scada',
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.lightBlue,
                    ),
                    child: Text(
                      widget.item.repositoryInfo.language ?? "Nao identificado",
                      style: TextStyles.body.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
