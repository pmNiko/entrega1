PRIMERA APLICACION RUBY
========

Descripción
-----------

Bienvenido a mi primera aplicación ruby.

Esta aplicación ofrece la posibilidad de interactuar con una interfaz visual de nivel consola.
Dando la funcionalidad básica de un menú de cualquier aplicación web, tales como iniciar/cerrar sesión,
registrarse y saber el estado del usuario.
Tiene cargado un usuario por defecto para su testeo:
-> usuario: "Andres"  -> contraseña: "Pass36"  ->Contraseña encriptada con metodo BCrypt.
permite el uso de contraseñas alfanuméricas, es decir, combinar letras mayúsculas/minúsculas con números.

Normalizado casi al máximo segun rubocop
------------------------------------
```Rubocop
  ver:
    https://github.com/bbatsov/rubocop
```

Documentación
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
  Versión ruby + gemset  

    Using ruby-2.0.0-p598 with gemset entrega1
```
```ruby
  Versión de git

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

  #Finalmente para acceder a la aplicación.
    -> $ ruby cmd.rb
```

```ruby
      # VISUAL
        Bienvenido a la Aplicación
        ____ Elija una opción: ____
        1. Iniciar_Sesión
        2. Registrarse
        3. Estado
        4. Salir
```
```ruby
      # USO BASICO
            Bienvenido a la Aplicación
        ____ Elija una opción: ____
        1. Iniciar_Sesión
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
      # Iniciar_Sesión
        ____ Elija una opción: ____
        1. Iniciar_Sesión
        2. Registrarse
        3. Estado
        4. Salir
        ?  1
        >>ingrese su usuario:  Andres
        >>>Ingrese su contraseña:  ******             

        >>>Gracias por iniciar sesión **Andres***

        ____ Elija una opción: ____
        1. Cerrar_Sesión
        2. Cambiar_Encriptación
        3. Estado
        4. Salir
        ?  3
        >>>Usted esta logueado como ~> Andres <~
```
-----

-----
```ruby  
      # Usuario_Incorrecto
        Bienvenido a la Aplicación
        ____ Elija una opción: ____
        1. Iniciar_Sesión
        2. Registrarse
        3. Estado
        4. Salir
        ?  1
        >>ingrese su usuario:  Pepe

        El usuario Pepe no existe vuelva a intentar o registrese.
        ____ Elija una opción: ____
        1. Iniciar_Sesión
        2. Registrarse
        3. Estado
        4. Salir
        ?  3
        >>Usted esta " Deslogueado " por favor inicie sesion o registrese.
```
-----

-----
```ruby
      # Cerrar_Sesión
        Bienvenido a la Aplicación
        ____ Elija una opción: ____
        1. Iniciar_Sesión
        2. Registrarse
        3. Estado
        4. Salir
        ?  1
        >>ingrese su usuario:  Andres
        >>>Ingrese su contraseña:  ******

        >>>Gracias por iniciar sesión **Andres***

        ____ Elija una opción: ____
        1. Cerrar_Sesión
        2. Cambiar_Encriptación
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
* El estado del usuario se modeló a través de un objeto desacoplado "Sesión"
* En la vista el único objeto del modelo que se maneja es instancia de Sesión
* El usuario puede elegir con que metodo de encriptación registrarse
* Un usuario logueado puede elegir cambiar el metodo de encriptación, previa autentificación
* Multiples usuarios pueden tener distintos metodos de encriptación y cambiarlos en tiempo de ejecución
* Pueden registrarse multiples usuario y quedar almacenados en tiempo de ejecución
* La opción iniciar/cerrar sesión aparecerá dependiendo del estado del usuario.
* La contraseña del usuario puede registrar caracteres alfanuméricos, no admite caracteres especiales
* No se admiten dos usuarios con el mismo nick de usuario
* Metodos de encriptación disponibles: ->"Texto Plano" ->"Caesar Cipher" ->"BCrypt"
```
-----

Pie de página
-----
* [Martin Nicolas Paneblanco](https://github.com/pmNiko) - Autor
* [Andres Fortier](https://github.com/andres-fortier) - Profesor

_Mail de contacto: nikolas090189@gmail.com_
-----
