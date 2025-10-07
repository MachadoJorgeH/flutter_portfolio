import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portifolio/constants/colors.dart';
import 'package:my_portifolio/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: CustomColor.bgLight1,
      ),
      child: Column(
        children: [
          // title
          const Text(
            'Get in touch',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),

          Gap(50),

          // TextFields
          Form(
            key: _formKey,
            child: Column(
              children: [
                // TextFields
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Row(
                    children: [
                      // name
                      Flexible(
                        child: CustomTextField(
                          hintText: 'Your name:',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please, enter your name.';
                            }
                            return null;
                          },
                        ),
                      ),
                      const Gap(20),
                      // email
                      Flexible(
                        child: CustomTextField(
                          hintText: 'Your email:',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email.';
                            }
                            if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                // message
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: CustomTextField(
                    hintText: 'Your message:',
                    maxLine: 15,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please, enter your message.';
                      }
                      return null;
                    },
                  ),
                ),
                const Gap(40),
                // send button
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // TODO: Adicionar a lógica para enviar o email/mensagem
                        }
                      },
                      child: const Text('Get in touch'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(),
          ),
          Gap(20),
          // SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse('https://github.com/MachadoJorgeH'));
                },
                child: Image.asset('assets/github.png', width: 28),
              ),
              InkWell(
                onTap: () {
                  launchUrl(
                    Uri.parse(
                      'https://www.linkedin.com/in/jorge-henrique-machado/',
                    ),
                  );
                },
                child: Image.asset('assets/linkedin.png', width: 28),
              ),
              InkWell(
                onTap: () {
                  launchUrl(
                    Uri.parse(
                      'https://www.instagram.com/jorgehenrique_treinador',
                    ),
                  );
                },
                child: Image.asset('assets/instagram.png', width: 28),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
