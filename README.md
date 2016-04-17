PRIMERA APLICACION RUBY
========

Descripcion
-----------

Bienvenido a mi primera aplicacion ruby.

Esta aplicacion ofrece la posibilidad de interactuar con una interfaz visual de nivel consola.
Dando la funcionalidad basica de un menu de cualquier aplicacion web, tales como iniciar/cerrar sesion,
registrarse y saber el estado del usuario.
Tiene cargado un usuario por defecto para su testeo:
-> usuario: "Andres"  -> contraseña: "Pass36"  ->Contraseña encriptada con metodo BCrypt.
permite el uso de contraseñas alfanumericas es decir combinar lestras mayusculas/minusculas con numeros.

Normalizado casi al maximo segun rubocop
------------------------------------
```Rubocop
  ver:
    https://github.com/bbatsov/rubocop
```

Documentacion
-------------
```RDoc
  Clases documentadas con RDoc
```
```
Acceso: una vez clonado el proyecto a su equipo acceda por medio de la terminal con:

    $ cd entrega1/doc
    $ google-chrome index.html
```
```
  ver:
    https://github.com/rdoc/rdoc
```

Requerimientos
------------
```ruby
  Version ruby + gemset  

    Using ruby-2.0.0-p598 with gemset entrega1
```
```ruby
  Version de git

    git version 1.9.1
```

   Testeo
------------
```
    Comportamiento testeado con rspec.
```
```
  Una vez clonado el proyecto a su equipo acceda por medio de la terminal con

    $ cd entrega1
    $ rspec -fd
```
```
  O para ver una interfaz grafica de la cobertura de test:

    $ cd entrega1/coverage
    $ google-chrome index.html
```
```
    ver: https://github.com/rspec/rspec-rails
```

Acceso al proyecto
-----

```ruby
  #Dentro de la terminal acceda a un directorio de proyectos
    -> $ git clone git@github.com:pmNiko/entrega1.git


  #luego para utilizar la gema del proyecto
    -> $ rvm gemset use entrega1

  #Finalmente para acceder a la aplicacion.
    -> $ ruby cmd.rb
```

```ruby
      # VISUAL
        Bienvenido a la Aplicacion
        ____ Elija una opcion: ____
        1. Iniciar_Sesion
        2. Registrarse
        3. Estado
        4. Salir
```
```ruby
      # USO BASICO
            Bienvenido a la Aplicacion
        ____ Elija una opcion: ____
        1. Iniciar_Sesion
        2. Registrarse
        3. Estado
        4. Salir
        ?  3
        >>Usted esta " Deslogueado " por favor inicie sesion o registrese.
```
-----
      USUARIO: "Andres"   CONTRASEÑA: "Pass36"
-----

-----
```ruby
      # Iniciar_Sesion
        ____ Elija una opcion: ____
        1. Iniciar_Sesion
        2. Registrarse
        3. Estado
        4. Salir
        ?  1
        >>ingrese su usuario:  Andres
        >>>Ingrese su contraseña:  ******             

        >>>Gracias por iniciar sesion **Andres***

        ____ Elija una opcion: ____
        1. Cerrar_Sesion
        2. Cambiar_Encriptacion
        3. Estado
        4. Salir
        ?  3
        >>>Usted esta logueado como ~> Andres <~
```
-----

-----
```ruby  
      # Usuario_Incorrecto
        Bienvenido a la Aplicacion
        ____ Elija una opcion: ____
        1. Iniciar_Sesion
        2. Registrarse
        3. Estado
        4. Salir
        ?  1
        >>ingrese su usuario:  Pepe

        El usuario Pepe no existe vuelva a intentar o registrese.
        ____ Elija una opcion: ____
        1. Iniciar_Sesion
        2. Registrarse
        3. Estado
        4. Salir
        ?  3
        >>Usted esta " Deslogueado " por favor inicie sesion o registrese.
```
-----

-----
```ruby
      # Cerrar_Sesion
        Bienvenido a la Aplicacion
        ____ Elija una opcion: ____
        1. Iniciar_Sesion
        2. Registrarse
        3. Estado
        4. Salir
        ?  1
        >>ingrese su usuario:  Andres
        >>>Ingrese su contraseña:  ******

        >>>Gracias por iniciar sesion **Andres***

        ____ Elija una opcion: ____
        1. Cerrar_Sesion
        2. Cambiar_Encriptacion
        3. Estado
        4. Salir
        ?  1
        >>**Andres** Usted se ha deslogueado

```
-----

Detalles:
-----
```
* Se utilizo la arquitectura MVC
* El modelo se relaciona con la vista mediante un controlador
* El estado del usuario se modelo a través un objeto desacoplado "Sesion"
* En la vista el unico objeto del modelo que se maneja es instacia de Sesion
* El usuario puede elegir con que metodo de encriptacion registararse
* Un usuario logueado puede elegir cambiar el metodo de encriptacion previa autentificacion
* Multiples usuarios pueden tener distintos metodos de encriptacion y cambiarlos en tiempo de ejecucion
* Pueden registrarse multiples usuario y quedar almacenados en tiempo de ejecucion
* La opcion iniciar/cerrar sesion aparecera dependiendo del estado del usuario.
* La contraseña del usuario puede registar caracteres alfanumericos, no admite caracteres especiales
* No se admiten dos usuarios con el mismo nick de usuario
* Metodos de encriptacion disponibles: ->"Texto Plano" ->"Caesar Cipher" ->"BCrypt"
```
-----

Pie de pagina
-----
* [Martin Nicolas Paneblanco](https://github.com/pmNiko) - Autor
* [Andres Fortier](https://github.com/andres-fortier) - Profesor

_Mail de contacto: nikolas090189@gmail.com_
-----
