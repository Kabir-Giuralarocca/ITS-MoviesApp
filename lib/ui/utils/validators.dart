import 'package:form_validator/form_validator.dart';

final requiredValidator = ValidationBuilder(
  requiredMessage: "Campo obbligatorio!",
).build();

final emailValidator = ValidationBuilder(
  requiredMessage: "Campo obbligatorio!",
).email("Email non valida!").build();

final passwordValidator = ValidationBuilder(
  requiredMessage: "Campo obbligatorio!",
)
    .minLength(8, "La password deve avere almeno 8 caratteri!")
    .regExp(RegExp(r"[0-9]+"), "La password deve comprendere almeno un numero!")
    .regExp(RegExp(r"[a-z]+"),
        "La password deve comprendere almeno una lettera minuscola!")
    .regExp(RegExp(r"[A-Z]+"),
        "La password deve comprendere almeno una lettera maiuscola!")
    .regExp(RegExp(r"[@!$%&*-+]+"),
        "La password deve comprendere almeno un carattere speciale!")
    .build();
