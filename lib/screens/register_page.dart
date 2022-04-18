import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pi/databases/perfil.dart';
import 'package:flutter_application_pi/services/auth_service.dart';
import 'package:provider/src/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final cpf = TextEditingController();
  final phone = TextEditingController();
  final cep = TextEditingController();
  final describe = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  Perfil p = Perfil();
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  Cadastro() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().Registrar(
          name.text, cpf.text, phone.text, cep.text, email.text, senha.text);
      Navigator.pop(context);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.Message)));
    }
    return "aprovado";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registrar",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome completo',
                    ),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório";
                      } else if (value.length < 6) {
                        return "Digite seu nome completo";
                      } else if (value.length > 40) {
                        return "Nome atingiu o limite de caracteres, retire um sobrenome";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: cpf,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'cpf',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório";
                      } else if (UtilBrasilFields.isCPFValido(value) == false) {
                        return "CPF invalido";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: cep,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter()
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'cep',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter()
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'telefone',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo Obrigatório";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite o Email corretamente";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Digite sua senha";
                      } else if (value.length < 6) {
                        return "Senha tem que ter no minimo 6 digitos";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Cadastro();
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (loading)
                            ? [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ]
                            : [
                                const Padding(
                                  padding: EdgeInsets.all(24),
                                  child: Text(
                                    "Registrar",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                      )),
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Já possui uma conta? Logue-se")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
