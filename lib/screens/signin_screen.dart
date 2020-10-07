import 'package:cooking_app/utilities/regex_validator.dart';
import 'package:cooking_app/widgets/app_auth_hyperlinkdart';
import 'package:cooking_app/widgets/app_co_footer.dart';
import 'package:cooking_app/widgets/app_raised_button.dart';
import 'package:cooking_app/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final FocusNode _screenFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _lastNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  bool _hasBeenValidated = false;

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _screenFocusNode.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_screenFocusNode),
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          color: Colors.white,
          child: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 250.0,
                              maxWidth: 350.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Form(
                                key: _formKey,
                                onChanged: () {
                                  if (_hasBeenValidated)
                                    _formKey.currentState.validate();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      'Registro',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'ReemKufi',
                                        fontSize: 22,
                                      ),
                                    ),
                                    AppTextFormField(
                                      controller:
                                          _firstNameTextEditingController,
                                      focusNode: _firstNameFocusNode,
                                      labelText: 'Nombres',
                                      prefixIconData: Icons.person,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      validator: (firstName) {
                                        if (firstName.isEmpty) {
                                          return 'Por favor ingrese un nombre';
                                        }
                                        return null;
                                      },
                                      onEditingComplete: () =>
                                          _lastNameFocusNode.requestFocus(),
                                    ),
                                    AppTextFormField(
                                      controller:
                                          _lastNameTextEditingController,
                                      focusNode: _lastNameFocusNode,
                                      labelText: 'Apellidos',
                                      prefixIconData: Icons.text_fields,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      validator: (lastName) {
                                        if (lastName.isEmpty) {
                                          return 'Por favor ingrese un apellido';
                                        }
                                        return null;
                                      },
                                      onEditingComplete: () =>
                                          _emailFocusNode.requestFocus(),
                                    ),
                                    AppTextFormField(
                                      controller: _emailTextEditingController,
                                      focusNode: _emailFocusNode,
                                      labelText: 'Correo Electrónico',
                                      prefixIconData: Icons.email,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      validator: (email) {
                                        if (email.isEmpty) {
                                          return 'Por favor ingrese un email';
                                        } else if (RegexValidation
                                            .isInvalidEmail(email)) {
                                          return 'Correo electrónico inválido';
                                        }
                                        return null;
                                      },
                                      onEditingComplete: () =>
                                          _passwordFocusNode.requestFocus(),
                                    ),
                                    AppTextFormField(
                                      controller: _passwordEditingController,
                                      focusNode: _passwordFocusNode,
                                      labelText: 'Contraseña',
                                      obscureText: true,
                                      prefixIconData: Icons.lock,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      validator: (password) {
                                        if (password.isEmpty) {
                                          return 'Por favor ingrese una contraseña';
                                        }
                                        return null;
                                      },
                                      onEditingComplete: () =>
                                          FocusScope.of(context)
                                              .requestFocus(_screenFocusNode),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Hero(
                            tag: 'app-in-button-tag',
                            child: AppRaisedButton(
                              text: 'Registrarse',
                              onPressed: () {
                                if (!_screenFocusNode.hasFocus) {
                                  FocusScope.of(context)
                                      .requestFocus(_screenFocusNode);
                                }
                                if (!_hasBeenValidated)
                                  _hasBeenValidated = true;
                                if (_formKey.currentState.validate()) {
                                  // TODO: Form Validated, call a signin service
                                }
                              },
                            ),
                          ),
                          AppAuthHyperlink(
                              padding: const EdgeInsets.only(top: 10.0),
                              questionText: '¿Ya posees una cuenta?',
                              hyperlinkText: 'Iniciar Sesión',
                              onTapHyperlink: () =>
                                  Navigator.pushReplacementNamed(
                                      context, '/login')
                              //Router.pushVoid(context, '/login'),
                              ),
                          AppCoFotter(
                            padding: const EdgeInsets.only(
                              bottom: 10.0,
                              top: 30.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black38,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
