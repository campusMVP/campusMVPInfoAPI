SET IDENTITY_INSERT [dbo].[Courses] ON

INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (22, N'Desarrollo de aplicaciones con la plataforma Java', N'Java.jpg', N'Con este curso empezarás desde abajo hasta dominar todos los aspectos importantes de la plataforma de programación más popular del mundo: Java. Su lema es “Escribe una vez, ejecuta en todas partes”, y con Java podrás crear aplicaciones que funcionen en cualquier ordenador o servidor con Windows, Linux o Mac, y por supuesto en móviles. El curso parte de cero y llega a un nivel alto de conocimientos que incluso te permitirán certificarte.', N'Java es sin duda la plataforma de programación más popular del mundo desde hace muchos años. Basta hacer un par de búsquedas en cualquier portal de empleo para ver que las ofertas de trabajo para Java son siempre más numerosas que las de cualquier otro lenguaje. No en vano lleva más de 20 años en el mercado y se usa para todo: desde programar electrodomésticos inteligentes hasta servidores de alto rendimiento, y por supuesto aplicaciones de gestión, apps para móviles (es el lenguaje nativo de Android), juegos o páginas web. La mayor parte de la administración pública y las grandes empresas usan Java en sus sistemas.

El objetivo de este curso no es darte “recetas” para poder “ir tirando” con Java, sino que lo aprendas y, al terminar, verdaderamente lo comprendas, para tener una buena base y poder dedicarte a programar profesionalmente con la plataforma.

Además, aunque no es el objetivo principal, si lo deseas podrás presentarte con confianza a la certificación oficial Oracle Certified Associate, Java SE 8 Programmer.
Finalmente, es un curso de futuro ya que te enseña desde hoy también a trabajar con la próxima versión de la plataforma: Java 9, que aparecerá en verano de 2017. Tú la usarás desde el primer día.

Esta exhaustiva formación está dirigida a personas que quieran alcanzar un nivel intermedio en programación Java, hayan programado antes o no.
Al terminar el curso dominarás el lenguaje Java y los principales aspectos de base de la plataforma Java.

Aunque Java se puede usar para muchas cosas, el curso procura enseñar conocimientos transversales, que sirvan para cualquier entorno en el que luego te quieras especializar (web, móvil, servidor…). Las prácticas, no obstante, se realizan sobre escritorio, creando al final además tu primera aplicación de gestión con Java: campusConta. Esta aplicación sirve para repasar y reforzar la mayor parte de las técnicas y conceptos vistos en el resto del curso.', N'Lo único que se necesita para poder seguir el curso es ser un usuario avanzado de Windows, Linux o Mac. No se presuponen conocimientos previos de otro lenguaje de programación, aunque siempre es una ventaja poseerlos. Para la parte de base de datos se supone un conocimiento mínimo del lenguaje SQL. Se facilita una guía, anexa al curso, para adquirirlos si no se poseen. Es importante señalar que no es un curso de MySQL ni de otros gestores de datos, ni tampoco un curso de SQL.', N'https://www.campusmvp.es/catalogo/Product-Desarrollo-de-aplicaciones-con-la-plataforma-Java_231.aspx', CAST(N'2017-01-14 00:00:00.000' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (24, N'Desarrollo de aplicaciones web con Angular 
', N'Angular.jpg', N'Este curso práctico y directo al grano te enseña todo lo que necesitas saber para aprender en poco tiempo el framework JavaScript más utilizado del mundo en su última versión: Angular. Mientras aprendes, construirás desde cero una aplicación Web, Tweempus, un pequeño “clon” de Twitter con el que reforzar todo lo aprendido.', N'Angular es lo que debería haber sido HTML si se hubiese pensado desde el principio para crear aplicaciones web, y no documentos. Desarrollado y mantenido por Google, este framework gratuito se convirtió ya en su primera versión casi en un estándar para crear aplicaciones web modernas.

En septiembre de 2016 Google lanzó la versión definitiva de lo que llamó en su momento Angular 2, y que ahora es simplemente Angular. Este nuevo framework se ha construido sobre años de trabajo y feedback de los usuarios usando AngularJS (la versión 1.x del framework). Su desarrollo llevó más de 2 años. No se trata de una nueva versión o una evolución de AngularJS, sino que es un nuevo producto, con sus propios conceptos y técnicas. Por lo tanto necesita su propio aprendizaje, ya que no es un añadido a AngularJS sino algo totalmente nuevo.

Además, Angular utiliza como lenguaje de programación principal TypeScript, un súper-conjunto de JavaScript/ECMAScript que facilita mucho el desarrollo, y que también es necesario aprender.

Angular es especialmente útil para desarrollo empresarial ya que marca de manera muy clara la arquitectura de las aplicaciones, su organización, la forma de hacer las cosas... Gracias a ello, cualquier programador de Angular es capaz de retomar sin problemas el trabajo de otro programador de Angular. Este orden es una gran ventaja sobre todo en empresas, de ahí que tenga mucha demanda en este ámbito.

Este curso será de utilidad a programadores que ya sepan JavaScript/ECMAScript y que necesiten ponerse al día con Angular de forma ordenada, práctica y rápida.

La formación se ha concebido de una manera muy práctica. Se explica la teoría estrictamente necesaria y todo lo demás se aprende mientras creas una aplicación real.

A lo largo del curso irás creando poco a poco la aplicación Tweempus, un “clon” de  Twitter, que permitirá la definición de usuarios y su ficha pública, autenticación de éstos, publicación de “Twimps”, marcar Twimps como favoritos, etc… usando además un diseño moderno y responsivo, con animaciones y siendo una aplicación de tipo SPA.

Todo lo explicado es válido para cualquier sistema operativo y navegador, por lo que podrás sacarle partido tanto si usas Windows, Linux o Mac.', N'Este curso parte de la base de que conoces bien HTML5 y JavaScript/ECMAScript y da por sabidos los conceptos relativos a estos lenguajes.', N'https://www.campusmvp.es/catalogo/Product-Desarrollo-de-aplicaciones-web-con-Angular_232.aspx', CAST(N'2017-02-02 10:41:06.033' AS DateTime))

SET IDENTITY_INSERT [dbo].[Courses] OFF

INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (22, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (24, 1)

SET IDENTITY_INSERT [dbo].[Features] ON
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (51, 22, N'Nivel: Iniciación-Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (52, 22, N'Duración: 12 semanas (3 meses)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (53, 22, N'Dedicación estimada: 6-7 h/semana (70-80h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (54, 24, N'Nivel: Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (55, 24, N'Duración: 10 semanas (2 meses y medio)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (56, 22, N'Dedicación estimada: 4-5 h/semana (40-50h en total)')
SET IDENTITY_INSERT [dbo].[Features] OFF

SET IDENTITY_INSERT [dbo].[Tutors] ON
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (10, N'David García Valiñas', N'dgarcia.jpg', N'Ingeniero Informático', N'David García es ingeniero informático. Está especializado en desarrollo de interfaces de usuario, domina diferentes tecnologías, desde Unity hasta Angular, y posee una amplia experiencia tanto en desarrollo web como de videojuegos. Es un activo ponente en diferentes comunidades de JavaScript, PHP y tecnologías de desarrollo de Google.', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tutors] OFF

INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (5, 22)

INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (10, 24)