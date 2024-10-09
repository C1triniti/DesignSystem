import 'package:flutter/material.dart';
import 'package:flutter_application_1/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:flutter_application_1/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:flutter_application_1/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:flutter_application_1/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter_application_1/views/login/login.dart';

import '../../DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import '../../DesignSystem/Components/InputField/input_text.dart';

class RegisterScreen extends StatefulWidget {


  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _termsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela de Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            const SizedBox(height: 20,),

            Image.asset(
              'lib/images/placeholder.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              ),

            const SizedBox(height: 50,),

            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: emailController, 
                placeholder: "E-mail", 
                password: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Esse campo é obrigatório';
                  } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                    return 'Somente letras são permitidas!';
                  }
                  return null;
                  }
                ),
              ),
        
            const SizedBox(height: 20,),
        
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController,
                placeholder: 'Senha',
                password: true,
                suffixIcon: const Icon(Icons.remove_red_eye),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Esse campo é obrigatório';
                  }
                  return null;
                }
              ),
            ),
        
            const SizedBox(height: 20,),
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Checkbox(
                  value: _termsChecked,
                 onChanged: (bool? value) {
                    setState(() {
                      _termsChecked = value!;
                    });
                  },
                 ),
                LinkedLabel.instantiate(
                  viewModel: LinkedLabelViewModel(
                    fullText: "Li e aceito os Termos de Serviço",   
                    linkedText: "Termos de Serviço", 
                    onLinkTap: () {}
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20,),
        
            ActionButton.instantiate(viewModel: 
            ActionButtonViewModel(
              size: ActionButtonSize.large, 
              style: ActionButtonStyle.primary, 
              text: "Registrar", 
              onPressed: () {}
              ),
            ),

            const SizedBox(height: 20,),

            const Text('Já tem uma conta?'),

            const SizedBox(height: 20,),

            ActionButton.instantiate(viewModel: 
            ActionButtonViewModel(
              size: ActionButtonSize.small, 
              style: ActionButtonStyle.primary, 
              text: "Login", 
              onPressed: () {
                Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
          }
              ),
            ),

          ],
        ),
      ),
    );
  }
}