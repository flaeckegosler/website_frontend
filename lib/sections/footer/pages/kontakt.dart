import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:website_frontend/components/section_title.dart';
import 'package:website_frontend/sections/footer/bottom_bar.dart';

class Kontakt extends StatelessWidget {
  final controllerFromName = TextEditingController();
  final controllerFromEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
    required BuildContext ctx,
  }) async {
    const serviceId = '*';
    const templateId = '*';
    const userId = '*';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http
        .post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(
            {
              'service_id': serviceId,
              'template_id': templateId,
              'user_id': userId,
              'template_params': {
                'user_name': name,
                'user_email': email,
                'user_subject': subject,
                'user_message': message,
              }
            },
          ),
        )
        .catchError(
          // ignore: invalid_return_type_for_catch_error
          (onError) => {
            showDialog(
              context: ctx,
              builder: (context) => AlertDialog(
                title: const Text("Fehler!"),
                content: const Text(
                  "Beim Versand ist ein Fehler aufgetreten. Bitte versuche es später nochmals!",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Schliessen',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          },
        );
    print(response.body);
    if (response.statusCode == 200) {
      controllerFromName.text = '';
      controllerFromEmail.text = '';
      controllerSubject.text = '';
      controllerMessage.text = '';
      showDialog(
        context: ctx,
        builder: (context) => AlertDialog(
          title: const Text("Kontaktanfrage versendet!"),
          content: const Text(
            "Überprüfe deinen Posteingang, du solltest eine Email erhalten haben!",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Schliessen',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: ctx,
        builder: (context) => AlertDialog(
          title: const Text("Fehler!"),
          content: const Text(
            "Beim Versand ist ein Fehler aufgetreten. Bitte versuchen sie es später nochmals!",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Schliessen',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    required BuildContext context,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            cursorColor: Theme.of(context).primaryColor,
            maxLines: maxLines,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.5,
                ),
              ),
              hoverColor: Colors.grey[300],
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: const Color.fromRGBO(147, 90, 161, 1),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      //  color: Colors.red,
                      width: 480,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, right: 10),
                            child: SectionTitle(
                              title: "Kontakt",
                              subTitle: "Tell me more!",
                              color: Color.fromRGBO(147, 90, 162, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildTextField(
                            title: 'Dein Name',
                            controller: controllerFromName,
                            context: context,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildTextField(
                            title: 'Deine Email',
                            controller: controllerFromEmail,
                            context: context,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildTextField(
                            title: 'Betreff',
                            controller: controllerSubject,
                            context: context,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          buildTextField(
                            title: 'Nachricht',
                            controller: controllerMessage,
                            context: context,
                            maxLines: 12,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 480,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                if (controllerFromName.text != '' &&
                                    controllerFromEmail.text != '' &&
                                    controllerSubject.text != '' &&
                                    controllerMessage.text != '') {
                                  sendEmail(
                                      name: controllerFromName.text,
                                      email: controllerFromEmail.text,
                                      subject: controllerSubject.text,
                                      message: controllerMessage.text,
                                      ctx: context);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text("Nice try!"),
                                      content: const Text(
                                        "Bitte fülle alle Felder aus!",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            'Schliessen',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                              child: const Text('Senden'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
