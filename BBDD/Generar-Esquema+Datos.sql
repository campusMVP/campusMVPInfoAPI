USE [master]
GO
/****** Object:  Database [campusMVPAppInfo]    Script Date: 09/02/2017 12:28:15 ******/
CREATE DATABASE [campusMVPAppInfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CampusmvpAppInfo', FILENAME = N'F:\Codigo\campusMVPInfoAPI\campusmvpAppInfoSVC\App_Data\CampusmvpAppInfo.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CampusmvpAppInfo_log', FILENAME = N'F:\Codigo\campusMVPInfoAPI\campusmvpAppInfoSVC\App_Data\CampusmvpAppInfo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [campusMVPAppInfo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [campusMVPAppInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [campusMVPAppInfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [campusMVPAppInfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [campusMVPAppInfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [campusMVPAppInfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [campusMVPAppInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [campusMVPAppInfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [campusMVPAppInfo] SET  MULTI_USER 
GO
ALTER DATABASE [campusMVPAppInfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [campusMVPAppInfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [campusMVPAppInfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [campusMVPAppInfo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [campusMVPAppInfo]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Icon] [nvarchar](100) NULL,
	[Color] [nchar](6) NULL,
	[Description] [nvarchar](500) NULL,
	[Position] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courses]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Image] [nvarchar](150) NULL,
	[ShortDescription] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[Requirements] [nvarchar](500) NULL,
	[InfoUrl] [nvarchar](250) NOT NULL,
	[DateAdded] [datetime] NOT NULL CONSTRAINT [DF_Courses_DateAdded]  DEFAULT (getdate()),
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoursesCategories]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesCategories](
	[CourseId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CoursesCategories] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Features]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[FeatureId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Feature] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[FeatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Opinions]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opinions](
	[OpinionId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Opinions] PRIMARY KEY CLUSTERED 
(
	[OpinionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tutors]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutors](
	[TutorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Photo] [nvarchar](150) NULL,
	[ShortDescription] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Twitter] [nvarchar](25) NULL,
	[Blog] [nvarchar](250) NULL,
 CONSTRAINT [PK_Tutors] PRIMARY KEY CLUSTERED 
(
	[TutorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TutorsCourses]    Script Date: 09/02/2017 12:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TutorsCourses](
	[TutorId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_TutorsCourses] PRIMARY KEY CLUSTERED 
(
	[TutorId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [Name], [Icon], [Color], [Description], [Position]) VALUES (1, N'Programación Web', N'web.png', N'008B00', N'HTML5, CSS3, JavaScrit, ECMAScript, ASP.NET, ASP.NET Core, Angular, jQuery, APIs de HTML5...', 1)
INSERT [dbo].[Categories] ([CategoryId], [Name], [Icon], [Color], [Description], [Position]) VALUES (2, N'Programación para Móviles y Tablets', N'movil.png', N'005670', N'Programación nativa para iOS, multiplataforma con Xamarin, Responsive Web Design para la Web.', 2)
INSERT [dbo].[Categories] ([CategoryId], [Name], [Icon], [Color], [Description], [Position]) VALUES (3, N'Acceso a Datos', N'datos.png', N'ff9900', N'Lenguaje SQL, SQL Server, ADO.NET, Entity Framework, MySQL...', 3)
INSERT [dbo].[Categories] ([CategoryId], [Name], [Icon], [Color], [Description], [Position]) VALUES (4, N'Plataformas y Lenguajes', N'net.png', N'0080C5', N'Todo lo relacionado con la plataforma .NET y el lenguaje C# ', 4)
INSERT [dbo].[Categories] ([CategoryId], [Name], [Icon], [Color], [Description], [Position]) VALUES (5, N'Preparación de Certificaciones de Desarrollo', N'certificaciones.png', N'FF4C00', N'Preparación a fondo de los conoceimientos necesarios para preparar certificaciones oficiales, aprendiendo de verdad al mismo tiempo.', 5)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (1, N'Desarrollo de aplicaciones móviles nativas multiplataforma con C# y Xamarin', N'xamarin.png', N'Si conoces la plataforma .NET y el lenguaje C#, ya puedes aprender a crear aplicaciones nativas para todas las plataformas móviles, con los conocimientos que ya tienes y usando herramientas gratuitas. Con este curso también aprenderás buenas prácticas, arquitecturas escalables y procedimientos para asegurar la calidad. ¿Alguien da más? Pues la verdad es que no… Solo campusMVP ;-)', N'Si te planteas crear una aplicación móvil exitosa, hoy en día debes disponer como mínimo de versiones para Android y para iOS. Y, en determinados entornos empresariales, también para Windows 10 y Windows Mobile.
El problema es que cada uno de estos sistemas utiliza tecnologías, lenguajes y herramientas totalmente distintos. Esto implica que tienes que crear al menos dos aplicaciones independientes, con el doble de trabajo, además de dominar Java, Android Studio y las peculiaridades de Android por un lado, y Swift/Objective-C, XCode y los detalles propios de iOS, por otro. Demasiado trabajo, y demasiado coste.
Por suerte existe una opción mucho mejor: Xamarin.
Xamarin es una plataforma de desarrollo gratuita de Microsoft que permite crear nuestras aplicaciones móviles una sola vez y que funcionen en Android, iOS y Windows Phone entre otros sistemas (Windows 10, Mac, wearables…). Todo ello sin tener que duplicar código o aprender nuevas herramientas. Las apps que creamos con Xamarin son aplicaciones nativas, es decir, no tienen diferencias con las que podríamos crear usando las herramientas propias de cada plataforma. Xamarin se encarga de todo por nosotros. Esta completa formación está dirigida a programadores que ya conocen C# y la plataforma .NET y que quieren extender sus capacidades al desarrollo móvil nativo. 
El curso te enseña todo lo que necesitas para crear completas aplicaciones para Android, iPhone, iPad y Windows Phone, al mismo tiempo que aprendes buenas prácticas y arquitectura para conseguir la mejor calidad y ser mejor profesional.', N'Este curso da por supuestos buenos conocimientos de la plataforma .NET y el lenguaje C#. Es una ventaja tener conocimientos de XAML, pero no es indispensable.', N'http://www.campusmvp.es/catalogo/Product-Desarrollo-de-aplicaciones-m%C3%B3viles-nativas-multiplataforma-con-C-y-Xamarin_160.aspx', CAST(N'2016-10-07 14:58:09.327' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (2, N'Desarrollo Web con ASP.NET Core MVC', N'coremvc.png', N'.NET Core es el futuro del desarrollo con tecnología Microsoft. Y lo ha cambiado todo. Tanto si ya conoces MVC 5 como si partes de cero, este curso tiene todo lo que necesitas para dominar el desarrollo de aplicaciones web con ASP.NET Core y ASP.NET Core MVC. Y de la mano de uno de los principales expertos en la materia. Empieza a crear las aplicaciones .NET del futuro, hoy.', N'.NET Core es el origen de una nueva generación de plataformas de desarrollo Microsoft. Está escrita desde cero y es completamente nueva por dentro, para hacerla multi-plataforma, ofrecer un rendimiento y escalabilidad sin precedentes, facilitar su trabajo en la nube... Y además es de código abierto (Open Source). Supone el mayor cambio en las tecnologías de desarrollo web de Microsoft desde sus inicios, y es el futuro a medio plazo.
Por encima de .NET Core se construyen otras bibliotecas de más alto nivel, especializadas en tareas concretas de desarrollo. Así, disponemos de ASP.NET Core y ASP.NET Core MVC. 
Tanto si ya conoces MVC 5, como si empiezas con esta tecnología, este curso es para ti. Parte de lo más básico y te va explicando paso a paso, con dificultad progresiva, todo lo que necesitas saber hasta llegar a las cuestiones más complejas
Al terminar esta formación obtendrás un nivel profesional de trabajo con ASP.NET Core MVC y estarás en condiciones de crear aplicaciones web reales basadas en este framework.
Este curso de ASP.NET Core MVC cuenta con abundante material escrito (que podrás descargar al terminar para referencia y consulta futuras) y varias horas de vídeos con demostraciones prácticas. Además, dispone de multitud de ejemplos descargables, explicaciones claras de conceptos, recursos relacionados, prácticas propuestas para reforzar conocimientos y auto-evaluaciones intermedias.
Como en todos nuestros cursos, el propio autor del contenido, José María Aguilar, uno de los principales expertos en la materia en España (ver lateral), será también tu tutor y estará disponible para contestar tus dudas sobre el contenido mientras dure la formación.', N'Para poder sacarle partido a la formación necesitas conocer el lenguaje C# y la plataforma .NET "tradicional". No es indispensable, pero sí recomendable, conocer algún ORM para acceso a datos, como por ejemplo Entity Framework. 
Por supuesto, al ser desarrollo web, se da por hecho que conoces HTML, CSS y JavaScript. 
Aunque .NET Core es multiplataforma, por facilidad de uso, la mayor parte de las prácticas del curso se realizan con Visual Studio sobre Windows.', N'http://www.campusmvp.es/catalogo/Product-Desarrollo-Web-con-ASP.NET-Core-MVC_227.aspx', CAST(N'2016-10-07 14:59:14.170' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (3, N'Desarrollador profesional de aplicaciones móviles iOS para iPhone/iPad con Swift y Objective-C', N'iosS.jpg', N'Dirigido a programadores, este completo curso parte de cero en desarrollo iOS para enseñarte a crear, con Xcode y Cocoa Touch, aplicaciones móviles profesionales para el sistema operativo de smartphones y tablets de Apple. Incluye formación específica sobre los lenguajes Swift y Objective-C. A lo largo del curso crearás una aplicación completa real.', N'Apple domina el segmento alto del mercado de móviles y tablets con sus conocidos iPhone y iPad. Sus dispositivos marcan el camino a seguir a todos los demás. La mayor parte de las marcas crean sus apps primero para el sistema operativo iOS de la marca de la manzana, que es el que llevan los iPhone y iPad. Si quieres que tu app triunfe debe estar en iOS, sí o sí.
Este curso está pensado para programadores que desean aprender a crear aplicaciones nativas para iOS con un nivel profesional, partiendo de cero. Al final del curso conocerás el entorno Xcode, los lenguajes (Swift y Objective-C), Cocoa Touch… y tendrás capacidad para crear los tipos de aplicación más comunes, válidas tanto para iPhone como para iPad, incluyendo las nuevas aplicaciones de "pantalla partida" para iPad.
Tradicionalmente los programas para iOS se creaban con el lenguaje Objective-C. En Junio de 2014 Apple lo sustituyó por un nuevo lenguaje de programación: Swift, más fácil, más moderno y con mejores capacidades que el anterior. La tendencia actual es programar con Swift, sin embargo todavía se necesita conocer Objective-C porque muchas de las bibliotecas usadas en iOS están escritas (¡y pensadas!) en este lenguaje, así como muchas aplicaciones existentes que quizás te toque mantener y ampliar.
Por eso, este ambicioso curso incluye formación específica sobre los dos lenguajes de programación, además de enseñar toda la parte de desarrollo que ambos tienen en común.
Al final del curso conocerás los lenguajes Swift y Objective-C con sus particularidades, y serás capaz de crear aplicaciones para iPhone y iPad usando el SDK para iOS y el entorno de desarrollo Xcode de Apple.
A lo largo del curso además irás desarrollando por etapas una aplicación completa, usando los dos lenguajes.
Intercalados a lo largo del temario principal encontrarás módulos que te van presentando poco a poco los lenguajes Swift y Objective-C, con sus particularidades. La aplicación de ejemplo completa y todos sus pasos intermedios se crean y se entregan en los dos lenguajes. Tú decides cuál quieres utilizar (¡mejor aprender ambos!).
Este completo curso cuenta con más de 200 lecciones divididas entre explicaciones teóricas, vídeos prácticos de demostración, laboratorios paso a paso para reforzar conocimientos, multitud de pequeños ejemplos (más de 140 descargas con código de ejemplo), y la creación de una aplicación real completa.', N'Conocimientos de algún lenguaje de programación (Java, C#, JavaScript, Visual Basic, C++…) ya que los conceptos básicos de programación se dan por sabidos. Se parte de cero en desarrollo iOS, pero no en desarrollo en general.', N'http://www.campusmvp.es/catalogo/Product-Desarrollador-profesional-de-aplicaciones-m%C3%B3viles-iOS-para-iPhone-iPad-con-Swift-y-Objective-C_221.aspx', CAST(N'2016-10-07 15:00:00.487' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (4, N'Fundamentos de Programación con C# y la plataforma .NET', N'csharp.png', N'¿Debes aprender .NET y, con lo grande que es, no sabes por dónde empezar? ¿Has programado en C, C++, Visual Basic 6.0 o algún lenguaje "de antaño" (¡qué tiempos!) y ahora te encuentras con .NET por primera vez?. Entonces este curso es para ti.', N'La plataforma .NET es muy grande. Posee literalmente miles de clases especializadas. Además es posible desarrollar con ella todo tipo de aplicaciones: escritorio, web, móviles, cloud, servicios… Por eso cuando se aborda su estudio lo más complicado es responder a la pregunta: ¿por dónde empiezo y en qué me enfoco?
El objetivo de esta formación es proporcionarte la mejor base posible sobre el lenguaje C# y la plataforma .NET, llegando a alcanzar un nivel medio de conocimientos.
Al terminar el curso dispondrás de conocimientos sólidos sobre todo lo que es importante en el lenguaje y en la plataforma, independientemente del tipo de aplicaciones que quieras desarrollar luego. Este curso te permitirá iniciarte y obtener un buen nivel con el lenguaje C# y la plataforma .NET.
Este completo curso cuenta con abundante material teórico, explicaciones claras de conceptos, ejemplos descargables, multitud de prácticas propuestas para reforzar conocimientos, y más de 10 horas de demostraciones prácticas en vídeo.', N'Lo único que se necesita es ser un usuario avanzado del sistema operativo Windows.
No se presuponen conocimientos previos de ningún otro lenguaje, pero siempre es útil poseerlos.', N'http://www.campusmvp.es/catalogo/Product-Fundamentos-de-Programaci%C3%B3n-con-C-y-la-plataforma-.NET_204.aspx', CAST(N'2016-10-07 15:00:27.147' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (5, N'Certificación oficial 70-483: Programación en C# y la Plataforma .NET', N'70-483.jpg', N'El objetivo de este completísimo curso es profundizar en la plataforma .NET y en el lenguaje C#, y al mismo tiempo preparar el examen 70-483 de Microsoft, que te especializa en la creación de aplicaciones con estas tecnologías. Al aprobar este examen obtendrás el certificado oficial de Technology Specialist en Programación con C#.', N'Tanto si deseas preparar el examen oficial como si necesitas dar un impulso a tus conocimientos actuales de la plataforma .NET y de C# para tu trabajo, ¡este es tu curso!
Al terminar esta formación dominarás entre otras cosas las siguientes tecnologías:
· Plataforma .NET
· Lenguaje de programación C#
· Programación Orientada a Objetos
· LINQ y acceso a datos
· Programación multi-hilo y asíncrona
· Criptografía
y además estarás en condiciones de sobra de presentarte al examen 70-483 de Microsoft para obtener la certificación oficial.
Este examen 70-483 es uno de los pocos que te permite obtener directamente una Certificación Oficial de Microsoft (la mayoría requieren más de un examen). Además, es una doble certificación porque si apruebas nuestras evaluaciones obtendrás también un diploma verificado de campusMVP que acredita tu aprendizaje ante terceros.
Este examen además es obligatorio para obtener la certificación Microsoft Certified Sofware Developer (MCSD) Windows Store Apps using C# y opcional para Microsoft Certified Software Developer (MCSD) Web Applications (ver “opciones adicionales”).
El objetivo principal del curso, más allá de preparar el examen, es que aprendas a fondo la plataforma .NET y C#, pudiendo acceder a puestos de programador .NET o, si ya lo eres, realizar mejor tu trabajo diario.
En la parte final del curso te ofrecemos algunos consejos prácticos a la hora de presentarte al examen de certificación, sacados de nuestra experiencia de muchos años haciéndolos. Además te entregamos gratis un simulador del examen valorado en más de 89€. Con éste podrás preparar con calma el examen en un entorno muy parecido al real e ir con mucha más confianza al examen.', N'No son necesarios conocimientos previos de programación, aunque sí es recomendable haber tenido contacto con cualquier lenguaje de programación previamente. Si ya conoces y trabajas con C# y .NET podrás sacarle partido igualmente al curso y profundizarás en tus conocimientos, pero pasarás más rápido por los módulos iniciales.', N'http://www.campusmvp.es/catalogo/Product-Certificaci%C3%B3n-oficial-70-483-Programaci%C3%B3n-en-C-y-la-Plataforma-.NET_222.aspx', CAST(N'2016-10-07 15:00:41.977' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (6, N'Certificación Oficial 70-480: Programación en HTML5 con JavaScript y CSS3', N'70-480.jpg', N'El objetivo de este completísimo curso es la preparación del examen 70-480 de Microsoft, que te especializa en la creación de aplicaciones Web con HTML5. Al aprobar este examen obtendrás el título oficial de Technology Specialist en Programación en HTML5 con JavaScript y CSS3.', N'Tanto si deseas preparar el examen oficial como si necesitas dar un impulso a tus conocimientos actuales de HTML, CSS y JavaScript para tu trabajo, ¡este es tu curso!
Al terminar esta formación tendrás un conocimiento mucho más profundo y profesional de las siguientes tecnologías:
· HTML5
· CSS3
· JavaScript avanzado
· jQuery
· APIs de HTML5
Y estarás en condiciones de sobra de presentarte al examen 70-480 de Microsoft para obtener la certificación oficial. Este examen 70-480 es uno de los pocos que te permite obtener directamente una Certificación Oficial de Microsoft (la mayoría requieren más de un examen). Además es una doble certificación porque si apruebas nuestras evaluaciones obtendrás también un certificado verificable de campusMVP que acredita tu aprendizaje ante terceros.
Este examen es, además, obligatorio para tres rutas de certificación de Microsoft.
En la parte final del curso te ofrecemos algunos consejos prácticos a la hora de presentarte al examen de certificación, sacados de nuestra experiencia de muchos años haciéndolos. Además te entregamos gratis un simulador del examen valorado en 89€. Con éste podrás preparar con calma el examen en un entorno muy parecido al real e ir con mucha más confianza al examen.', N'Para seguir este curso con garantías los alumnos deberán disponer de conocimientos previos intermedios de HTML, CSS y JavaScript. No se parte de cero.', N'http://www.campusmvp.es/catalogo/Product-Certificaci%C3%B3n-Oficial-70-480-Programaci%C3%B3n-en-HTML5-con-JavaScript-y-CSS3_220.aspx', CAST(N'2016-10-07 15:02:01.837' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (7, N'Programación avanzada con JavaScript y ECMAScript', N'jsecma.png', N'Este curso está orientado a programadores que ya trabajan con JavaScript. Marca la diferencia en la calidad de tu trabajo al dominar las sutilezas de JavaScript. Descubre las nuevas y avanzadas características añadidas en ECMAScript 6 y 7, disponibles ya en la mayor parte de los navegadores y en NodeJS. ¡Conviértete en un mejor profesional del desarrollo web!', N'JavaScript es un lenguaje que engaña mucho. Lo básico es muy sencillo y se aprende rápido, pero después presenta gran cantidad de complicaciones. Hay quien llega a odiarlo y le parece un mal lenguaje, pero por regla general es porque no se conoce a fondo y no se entiende bien su funcionamiento.
Para programar a un nivel profesional con JavaScript es indispensable tener muy claros algunos conceptos clave, o acabaremos con programas llenos de problemas, difíciles de mantener, que interfieren con las bibliotecas de otros, y que no funcionan bien en todos los navegadores.
Además el lenguaje está en plena evolución. En verano de 2015 el organismo ECMA aprobó su versión 6, conocida como ECMAScript 2015, que añade multitud de nuevas características avanzadas a JavaScript. Y en 2016 salió la versión 7 con algunos cambios más. Todos los navegadores modernos (y NodeJS) pueden sacar partido ya a estas nuevas capacidades, que enriquecerán tu código y te facilitarán la vida. Y con los transpiladores, ¡también se pueden usar en navegadores antiguos!
En este completo curso (¡21 módulos con más de 300 lecciones!) dominarás hasta el último detalle de JavaScript , incluyendo las características más recientes del lenguaje.
Con él te convertirás sin duda en un mejor profesional de la web.
Este completísimo curso de JavaScript/EcmaScript cuenta con abundante material teórico (que podrás descargar al terminar para referencia y consulta futuras) y casi 20 horas de demostraciones prácticas en vídeo. Además dispone de ejemplos descargables, explicaciones claras de conceptos y prácticas propuestas para reforzar conocimientos.', N'Se dan por supuestos conocimientos fundamentales de HTML, CSS y JavaScript.', N'http://www.campusmvp.es/catalogo/Product-Programaci%C3%B3n-avanzada-con-JavaScript-y-ECMAScript_206.aspx', CAST(N'2016-10-07 15:02:44.037' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (8, N'Seminario: Optimización de consultas e índices en SQL Server', N'sqlconsultas.png', N'Este curso te dará la información necesaria para aprender a analizar tu base de datos y tus consultas para conseguir el máximo rendimiento en tus aplicaciones.', N'Los gestores de datos relacionales son herramientas poderosas a las que todo programador tarde o temprano tiene que recurrir. Su uso básico es bastante sencillo y enseguida aprendemos a crear consultas de lectura y actualización, vistas para informes, etc...
Cuando una aplicación crece comienzan los problemas. La base de datos empieza a tener muchos usuarios simultáneos, a manejar cantidades importantes de información o a necesitar operaciones muy diversas sobre la misma información, así que las consultas empiezan a fallar o el rendimiento baja entre otros muchos efectos negativos.
Para poder entender qué está pasando y cómo podemos optimizar el trabajo con los datos, es necesario conocer bien el funcionamiento interno de nuestras bases de datos y cómo trabaja el gestor, en este caso SQL Server.
Este curso está dirigido a programadores que ya trabajan con SQL Server, conocen T-SQL y la administración básica del motor de datos, y que necesitan mejorar el rendimiento de sus consultas y la escalabilidad de sus aplicaciones.
Todo lo explicado sirve para cualquier versión de SQL Server posterior a la 2005, incluyendo 2008, 2008 R2, 2012, 2014 y SQL Server 2016. Si en algún punto hay particularidades propias de alguna versión se indica en la explicación.', N'Este curso está dirigido a programadores que ya trabajan con SQL Server, conocen T-SQL y la administración básica del motor de datos.', N'http://www.campusmvp.es/catalogo/Product-Seminario-Optimizaci%C3%B3n-de-consultas-e-%C3%ADndices-en-SQL-Server_214.aspx', CAST(N'2016-10-07 15:03:03.403' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (9, N'Creación profesional de páginas web con HTML5 y CSS3', N'html5css3.png', N'Aprende de verdad a trabajar con HTML y CSS como primer paso para convertirte en un profesional de la Web. Comienza desde cero y domina hasta las últimas novedades en HTML5 y CSS3.', N'Si eres de los que piensa que el futuro del desarrollo es la Web y quieres formar parte él, entonces tu primer paso será dominar HTML y CSS. Todas las páginas web se construyen usando estos dos lenguajes. Más allá de recordar una larga lista de etiquetas, lo que necesitas para ser un profesional es dominar cómo funcionan en conjunto, de qué manera se comportan los elementos en cada circunstancia, qué herramientas puedes utilizar… y sobre todo practicar. Todo eso lo conseguirás siguiendo este curso creado y tutelado por uno de los más reconocidos expertos en la materia.
Al final de curso dominarás tanto HTML como CSS, incluyendo sus versiones más recientes, y en particular:
· Tendrás claro el funcionamiento básico de la Web y conocerás las herramientas más habituales de trabajo para crear páginas web.
· Sabrás maquetar cualquier tipo de texto para visualizarlo en un navegador.
· Aprenderás a estructurar los contenidos de los sitios web.
· Dominarás las hojas de estilo, su especificidad, sus selectores avanzados y pseudo-elementos…
· Comprenderás mejor la mecánica de los contenidos de una página dominando el modelo de cajas.
· Aprenderás a optimizar imágenes, a escoger siempre el formato apropiado y a crear efectos con ellas.
· Maquetarás estructuras de páginas web usando todo tipo de técnicas: floats, fija y fluida, semántica, con posicionamiento o con emulación de tablas en CSS3.
· Sabrás cómo codificar vídeos y añadir multimedia a las páginas web, que se verán en todos los navegadores.
· Dominarás la distribución de elementos y contenidos en las páginas para colocar cada cosa exactamente en donde debe estar.', N'El curso está orientado a los que comienzan desde cero (o casi) en el desarrollo web, pero interesará también a todos aquellos programadores que ya trabajan en la web (ASP.NET MVC, PHP…) pero que tienen muchos conocimientos “sujetos con alfileres”.', N'http://www.campusmvp.es/catalogo/Product-Creaci%C3%B3n-profesional-de-p%C3%A1ginas-web-con-HTML5-y-CSS3_185.aspx', CAST(N'2016-10-07 15:03:18.223' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (11, N'Responsive Web Design', N'responsive.png', N'Hoy en día es casi inconcebible crear un sitio o una aplicación web y no hacerla Responsive. Si diseñas páginas web o si creas aplicaciones basadas en HTML5 debes dominar las técnicas de Responsive Web Design. Con este curso aprenderás todo lo que debes saber para hacer RWD desde cero y de paso aprenderás también Pure.css y Bootstrap para crear interfaces atractivas y funcionales con menos esfuerzo.', N'El diseño web responsive (conocido como RWD por sus siglas en inglés) permite crear sitios y aplicaciones web que se adaptan automáticamente a los diversos tamaños de pantalla y factores de forma de los dispositivos. Eso nos permitirá desarrollos únicos que funcionarán en cualquier dispositivo, tamaño y resolución, sin tener que usar plantillas diferentes para móviles, tabletas, escritorio o grandes monitores 4K, por ejemplo.
Hoy en día RWD es la opción por defecto para crear cualquier tipo de diseño o aplicación web. Así que no te queda más remedio que dominarlo.
Algunos diseñadores y programadores aprenden un par de conceptos básicos sobre media-queries y creen que ya saben hacer diseño web responsivo. Sin embargo el RWD va bastante más allá de eso y es necesario tener en cuenta muchas otras cosas.
Este curso está dirigido a diseñadores y programadores Web que ya saben HTML y CSS y que necesitan dominar el diseño web responsivo desde cero, en poco tiempo y con garantías.
El curso también enseña los fundamentos del framework Bootstrap, orientado a la creación de aplicaciones web responsive atractivas, y que casi es de obligado conocimiento para programadores (y diseñadores web).', N'Para realizar este curso debes tener buenos conocimientos de HTML y CSS.', N'http://www.campusmvp.es/catalogo/Product-Responsive-Web-Design_212.aspx', CAST(N'2016-10-07 15:04:19.720' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (12, N'Fundamentos de desarrollo web con JavaScript', N'js.png', N'JavaScript está en todas partes. Si eres programador (¡o diseñador web!) tarde o temprano trabajarás con este lenguaje. Y entonces será mejor que lo conozcas bien, pues es más complicado de lo que parece. Si quieres aprender JavaScript desde cero y alcanzar un buen nivel, este es tu curso.', N'JavaScript es el pegamento de Internet. Gracias a este lenguaje son posibles aplicaciones como Google Docs, OneDrive, GMail, Facebook o Twitter. En la actualidad todos los ordenadores, tablets y móviles del mundo incorporan al menos un intérprete de JavaScript. Además su influencia se ha incrementado para alcanzar todo tipo de ámbitos: servidores, aplicaciones de escritorio, sistemas operativos...
Como programador simplemente no puedes permitirte el lujo de no conocer JavaScript.
Este curso está pensado para partir de cero e ir aumentando la dificultad poco a poco para llegar a dominar los aspectos más importantes de este lenguaje y alcanzar un nivel de competencia profesional.
Todo lo explicado, por supuesto, es válido para cualquier sistema operativo y navegador, por lo que podrás sacarle partido tanto si usas Windows, Linux o Mac. Lo único que necesitas para empezar a aprender es un editor de texto plano cualquiera y un navegador web.
Este completísimo curso de JavaScript cuenta con abundante material teórico (cerca de 400 páginas) que podrás descargar al terminar, explicaciones claras de conceptos, ejemplos descargables, prácticas propuestas para reforzar conocimientos y más de 11 horas de demostraciones prácticas en vídeo.', N'Se dan por supuestos conocimientos fundamentales de HTML y CSS.', N'http://www.campusmvp.es/catalogo/Product-Fundamentos-de-desarrollo-web-con-JavaScript_207.aspx', CAST(N'2016-10-07 15:04:37.193' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (13, N'SQL Server práctico para desarrolladores', N'sqlserver.jpg', N'Aprende a trabajar en la práctica con el motor de bases de datos de SQL Server. Partiendo casi de cero y avanzando hasta conocer técnicas de trabajo imprescindibles y también avanzadas. Si ya trabajas y conoces SQL Server, lleva al siguiente nivel tus conocimientos y habilidades. Si vienes de otro gestor de datos, domina el de Microsoft.', N'· ¿Necesitas adquirir conocimientos sólidos de trabajo con SQL Server en poco tiempo?
· ¿Trabajas ya con SQL Server pero intuyes (¡o sabes!) que no le estás sacando todo el partido que debieras?
· ¿Te limitas a almacenar y recuperar datos en tablas pero no usas disparadores, funciones o procedimientos almacenados?
· ¿Te preocupa la seguridad de tus datos?
· ¿Necesitas aprender a identificar cuellos de botella y a mejorar el rendimiento de tus bases de datos?
· ¿Vienes de Oracle o MySQL y debes trabajar con SQL Server?
Si la respuesta a alguna de estas preguntas es afirmativa, entonces este curso on-line es lo que buscabas. Está diseñado para que puedas dominar en poco tiempo las técnicas de programación más importantes con SQL Server, obteniendo un nivel apropiado para el trabajo del día a día con este gestor de datos. Está enfocado desde un punto de vista práctico y solamente con la teoría imprescindible para comprender bien los principales conceptos.
Ve más allá de las técnicas habituales y aprende a sacarle más rendimiento a la base de datos, crear vistas, procedimientos almacenados, disparadores y funciones, dominar los índices, las transacciones, evitar bloqueos, monitorizar y solucionar problemas en tus bases de datos… El curso parte de lo más básico y avanza hasta conocer técnicas avanzadas útiles en el trabajo diario.', N'Se asume que el alumno conoce los fundamentos generales de trabajo con bases de datos y que alguna vez ha trabajado con algún sistema de bases de datos relacionales como MySQL, Oracle o SQL Server', N'http://www.campusmvp.es/catalogo/Product-SQL-Server-pr%C3%A1ctico-para-desarrolladores_165.aspx', CAST(N'2016-10-07 15:04:52.993' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (14, N'Desarrollo Web con ASP.NET MVC 5', N'mvc5.jpg', N'Con este completísimo curso (uno de los mejor valorados por nuestros alumnos) aprenderás a dominar la última versión de ASP.NET MVC de manera sistemática y atractiva. El curso te ofrece la teoría necesaria, vídeos prácticos directos al grano, prácticas paso a paso y ejemplos de código descargables. Como colofón, al final del curso se entrega una aplicación de referencia completa para que puedas crear un proyecto real de principo a fin.', N'ASP.NET MVC es la plataforma de desarrollo web de Microsoft basada en el conocido patrón Modelo-Vista-Controlador. Es gratuita, Open Source, está incluida de serie en Visual Studio y aporta interesantes características a la colección de herramientas del programador Web.
Su arquitectura permite separar las responsabilidades de una aplicación Web en partes diferenciadas y ofrece diversos beneficios:
· Facilidad de mantenimiento
· Facilidad para realizar testeo unitario automatizado y desarrollo orientado a pruebas (TDD)
URLs limpias, fáciles de recordar y adecuadas para buscadores
· Control absoluto sobre el HTML resultante generado, con la posibilidad de crear webs "responsive" usando plantillas del framework Bootstrap de forma nativa.
· Potente integración con jQuery y otras bibliotecas JavaScript.
· Magnífico rendimiento y escalabilidad
· Gran extensibilidad y flexibilidad
Este curso ofrece todo lo necesario para llegar a dominar ASP.NET MVC (la última versión, aparecida en agosto de 2015).
Al terminar la formación obtendrás un nivel profesional en ASP.NET MVC; y estarás en condiciones realizar trabajo real con esta tecnología.
El material de estudio incluye: teoría, vídeos prácticos, laboratorios paso a paso, descargas de código.... El curso te marca hitos claros de estudio, para que no pierdas el ritmo. Además de la evaluación final (con certificado de aprovechamiento si la superas), se incluyen auto-evaluaciones intermedias para que puedas ir verificando tus avances a medida que estudias.', N'Para seguir este curso con éxito el alumno debería disponer de buenos conocimientos previos de los fundamentos de la plataforma .NET, así como, al menos, nociones de HTML y JavaScript. Es necesario conocer los fundamentos de acceso a datos con Entity Framework o algún otro ORM (Linq2SQL, NHibernate...). Es muy recomendable tener nociones de trabajo con alguna tecnología de desarrollo Web como PHP, ASP, ASP.NET Web Forms, etc… o al menos conocer los fundamentos del funcionamiento de Internet.', N'http://www.campusmvp.es/catalogo/Product-Desarrollo-Web-con-ASP.NET-MVC-5_92.aspx', CAST(N'2016-10-07 15:05:11.330' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (15, N'Desarrollo Web con ASP.NET 4.0 Web Forms', N'webforms.png', N'Este curso está pensado para que, partiendo de cero, llegues a alcanzar un nivel intermedio con ASP.NET 4.0 Web Forms. Al terminar el curso serás capaz de trabajar como desarrollador de aplicaciones web de gestión.', N'ASP.NET 4.0 Web Forms permite desarrollar para Internet utilizando el mismo paradigma que en las aplicaciones de escritorio, es decir, basándose en formularios y eventos.
Su altísima productividad, flexibilidad y gran madurez en el mercado la hacen ideal para aquellos programadores y empresas que deseen crear aplicaciones web orientadas a gestión de manera rápida y con una curva de aprendizaje pequeña.
Al contrario que otros frameworks más demandantes, como ASP.NET MVC, que obligan a dominar previamente muchas otras materias (HTML, CSS, JavaScript, jQuery, la plataforma .NET y Entity Framework para empezar a hablar), Web Forms nos permite ser productivos desde muy pronto. A cambio debemos ceder parte del control al framework. Gracias a los completos controles enlazados a datos y gestionando eventos en el servidor, es posible construir aplicaciones orientadas a datos con poco esfuerzo y rapidez, y sin necesidad de invertir muchos meses antes solo en conocimientos previos.
¿Necesitas una pequeña aplicación de gestión de stocks? Puedes tenerla creada en un par de horas. ¿Una web para dar soporte a tus clientes a través de Internet, con preguntas y respuestas? Cuestión de unas pocas horas también.
Es un contenido ideal para aquellos programadores con experiencia en desarrollo para Windows o en otras plataformas que quieran dar el salto al desarrollo Web con poco esfuerzo.', N'Es recomendable pero no indispensable que el alumno tenga nociones de HTML, JavaScript y lenguaje de consultas SQL.', N'http://www.campusmvp.es/catalogo/Product-Desarrollo-Web-con-ASP.NET-4.0-Web-Forms_101.aspx', CAST(N'2016-10-07 15:05:23.317' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (16, N'A FONDO: Fundamentos de acceso a datos con .NET (ADO.NET Clásico)', NULL, N'Si trabajas en programación es indispensable consultar y actualizar datos. Este curso parte de cero pero te lleva dominar la tecnología clásica y más universal de acceso a datos con la plataforma .NET. Lo aprendido podrás utilizarlo tanto en aplicaciones de escritorio y de negocio como aplicaciones web, y para conectarte a cualquier base de datos del mercado.', N'Todo programador tarde o temprano debe realizar operaciones con bases de datos. De hecho, en la mayoría de los casos es a lo que más tiempo se le dedica. En .NET existen diversas tecnologías para conseguirlo, pero la más extendida, universal y fácil de aprender es también la más clásica: ADO.NET.
Con ADO.NET puedes conectarte a cualquier fuente de datos relacional: SQL Server, Oracle, MySQL, Firebird, ODBC… o no relacional (archivos de texto, hojas de cálculo, XML…). De manera sencilla y muy ágil puedes realizar consultas, insertar o actualizar información, etc…
Además de esto, una de las características más interesantes de ADO.NET es que podrás manejar bases de datos directamente en memoria, totalmente desconectadas, sin necesidad de tener conexión con ninguna fuente de datos. Esto abre las puertas de desarrollos muy interesantes.
Este curso te pondrá al día en poco tiempo en acceso a datos con .NET, de manera sistemática y atractiva, ofreciendo la teoría necesaria así como vídeos con ejemplos de uso, y llegando a tratar cuestiones avanzadas que podrán marcar la diferencia en algunos desarrollos.
El contenido de este curso sirve para cualquier versión de .NET y Visual Studio.', N'Es necesario conocer el trabajo básico con la plataforma .NET y C#, así como disponer de nociones básicas sobre bases de datos relacionales, especialmente SQL Server, aunque el curso incluye una introducción a este gestor de datos.', N'http://www.campusmvp.es/catalogo/Product-A-FONDO-Fundamentos-de-acceso-a-datos-con-.NET-(ADO.NET-Cl%C3%A1sico)_192.aspx', CAST(N'2016-10-07 15:05:37.673' AS DateTime))
INSERT [dbo].[Courses] ([CourseId], [Name], [Image], [ShortDescription], [Description], [Requirements], [InfoUrl], [DateAdded]) VALUES (17, N'Desarrollo de aplicaciones web con AngularJS', N'angularjs.png', N'AngularJS es lo que HTML sería si se hubiese pensado para crear aplicaciones web. Desarrollada y mantenida por Google este framework gratuito se está convirtiendo a toda velocidad en el estándar para crear aplicaciones web modernas de tipo SPA.', N'En los últimos años, gracias a la gran potencia de los navegadores y la disponibilidad de conexión casi permanente, la tendencia en desarrollo web ha sido la de mover el código desde el servidor al cliente. Es decir, en lugar de escribir tanto código en el servidor (basado en PHP, ASP.NET, Java, etc…), las aplicaciones web cada vez utilizan más HTML, CSS y JavaScript en el navegador, dejando el servidor para intercambio, sincronización y almacenamiento de datos. Si has utilizado aplicaciones como GMail, Dropbox o SoundCloud ya sabes a qué nos referimos. Son las Aplicaciones de una Sola Página o Single Page Applications.
AngularJS es un framework de desarrollo para HTML, gratuito, Open Source y mantenido por Google. En muy poco tiempo se ha convertido en la tecnología de referencia para la construcción de este tipo de aplicaciones web modernas. Algunos lo han definido como "lo que HTML debería ser si se hubiese diseñado para crear aplicaciones ".
El objetivo de AngularJS es extender HTML para facilitar la creación de aplicaciones basadas en el patrón MVC (Modelo-Vista-Controlador) y con inyección de dependencias, de modo que podamos escribir código ordenado, mantenible y testeable.
Actualmente lo utilizan Google, YouTube, la NASA, iStockphoto.com, Doubleclick, JSFiddle… y miles de empresas y desarrolladores en todo el mundo.
La curva de aprendizaje de AngularJS se parece a un palo de hockey: es sencillo comenzar con el framework, pero una vez que te metes y construyes aplicaciones más grandes, es necesario entender muy bien su funcionamiento interno, y el aprendizaje se hace mucho más costoso.
Por eso, este curso está diseñado para guiarte con detalle por cada uno de los conceptos clave de AngularJS, aumentando la dificultad poco a poco para llegar a dominar sin problema los aspectos más importantes de esta tecnología.
A lo largo del curso de AngularJS se van desarrollando ejemplos prácticos que muestran cómo solucionar los distintos problemas habituales de las aplicaciones a medida que se va incrementando su complejidad, con dos objetivos: facilitar la comprensión primero, y la reproducción en cualquier entorno de desarrollo después.
Todo lo explicado es válido para cualquier sistema operativo y navegador, por lo que podrás sacarle partido tanto si usas Windows, Linux o Mac. Aunque el tutor hace uso de diversos editores (Visual Studio, Sublime Text o Aptana Studio), lo único que necesitas es un editor de texto plano cualquiera.
El material cubre AngularJS 1.x hasta la versión 1.4.', N'Conocimientos de HTML y CSS
Conocimientos de JavaScript, en especial los fundamentos de la programación orientada a objetos en este lenguaje, así como el manejo de eventos del DOM.', N'http://www.campusmvp.es/catalogo/Product-Desarrollo-de-aplicaciones-web-con-AngularJS_200.aspx', CAST(N'2016-10-07 15:05:57.463' AS DateTime))
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
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (1, 2)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (1, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (2, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (2, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (3, 2)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (4, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (5, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (5, 5)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (6, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (6, 5)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (7, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (8, 3)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (9, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (11, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (11, 2)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (12, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (13, 3)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (14, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (15, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (15, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (16, 3)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (16, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (17, 1)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (22, 4)
INSERT [dbo].[CoursesCategories] ([CourseId], [CategoryId]) VALUES (24, 1)
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (1, 1, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (2, 1, N'Dedicación estimada: 5-6 h/semana (70h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (3, 1, N'Nivel: Intermedio-Avanzado')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (4, 2, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (6, 2, N'Dedicación estimada: 7-8 h/semana (90h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (7, 2, N'Nivel: Intermedio-Avanzado')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (8, 3, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (9, 3, N'Dedicación estimada: 6-7 h/semana (70-80h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (10, 3, N'Nivel: Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (11, 4, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (12, 4, N'Dedicación estimada: 4-5 h/semana (50h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (13, 4, N'Nivel: Iniciación')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (14, 5, N'Duración: 16 semanas (4 meses)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (15, 5, N'Dedicación estimada: 6-7 h/semana (105h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (16, 5, N'Nivel: Iniciación-Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (17, 6, N'Duración: 16 semanas (4 meses)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (18, 6, N'Dedicación estimada: 8-9 h/semana (135h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (19, 6, N'Nivel: Intermedio-Avanzado')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (20, 7, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (21, 7, N'Dedicación estimada: 5-6 h/semana (65-70h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (22, 7, N'Nivel: Avanzado')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (23, 8, N'Acceso durante 1 mes')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (24, 8, N'Dedicación estimada: Entre 6 y 10 h en total')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (25, 8, N'Nivel: Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (26, 8, N'Seminario grabado en directo y editado. Sin tutorías.')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (27, 9, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (28, 9, N'Dedicación estimada: 4-5 h/semana (50-60h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (29, 9, N'Nivel: Iniciación-Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (30, 11, N'Duración: 10 semanas (2 meses y medio)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (31, 11, N'Dedicación estimada: 3-4 h/semana (30h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (32, 11, N'Nivel: Iniciación-Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (33, 12, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (34, 12, N'Dedicación estimada: 4-5 h/semana (40-45h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (35, 12, N'Nivel: Iniciación')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (36, 13, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (37, 13, N'Dedicación estimada: 4-5 h/semana (50-60h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (38, 13, N'Nivel: Iniciación hasta avanzado')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (39, 14, N'Duración: 12 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (40, 14, N'Dedicación estimada: 6-7 h/semana (80h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (41, 14, N'Nivel: Intermedio-Avanzado')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (42, 15, N'Duración: 14 semanas (3 meses y medio)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (43, 15, N'Dedicación estimada: 5-6 h/semana (75h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (44, 15, N'Nivel: Iniciación-Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (45, 16, N'Duración: 8 semanas')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (46, 16, N'Dedicación estimada: 3-4 h/semana (25-30h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (47, 16, N'Nivel: Iniciación')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (48, 17, N'Duración: 10 semanas (2 meses y medio)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (49, 17, N'Dedicación estimada: 4-5 h/semana (40-50h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (50, 17, N'Nivel: Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (51, 22, N'Nivel: Iniciación-Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (52, 22, N'Duración: 12 semanas (3 meses)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (53, 22, N'Dedicación estimada: 6-7 h/semana (70-80h en total)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (54, 24, N'Nivel: Intermedio')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (55, 24, N'Duración: 10 semanas (2 meses y medio)')
INSERT [dbo].[Features] ([FeatureId], [CourseId], [Feature]) VALUES (56, 22, N'Dedicación estimada: 4-5 h/semana (40-50h en total)')
SET IDENTITY_INSERT [dbo].[Features] OFF
SET IDENTITY_INSERT [dbo].[Opinions] ON 

INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (1, 1, N'La verdad es que creo que sois la mejor empresa de formación técnica online de habla hispana que uno puede encontrar.. ', N'Miguel Ángel Cabrero (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (2, 1, N'He hecho dos cursos en CampusMVP y son, con mucha diferencia, los mejores cursos online de todos en los que he estado. La teoría está muy bien explicada, con muchos ejemplos y vídeos que enseñan a aplicar lo aprendido, un tutor disponible para resolver cualquier duda sobre el contenido y la plataforma es muy sencilla de usar y de hecho ayuda a concentrarse en lo que de verdad importa. En cuanto a las gestiones previas a comprar un curso, debo decir que la atención por parte de secretaría es inmejorable. En mi opinión, un 10 en todos los aspectos.. ', N'David Lledó (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (3, 1, N'He hecho formación on-line con campusMVP y también con otras empresas. He de decir que la formación con campusMVP ha sido con diferencia la mejor, tanto a nivel de contenidos, como de tutores, usabilidad de la plataforma, enfoque del temario y de las prácticas, etc.... ', N'Eva Higueras (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (4, 2, N'La verdad es que creo que sois la mejor empresa de formación técnica online de habla hispana que uno puede encontrar.. ', N'Miguel Ángel Cabrero (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (5, 2, N'Son cursos muy completos, con las comodidades de hacerlos online pero sin sus hándicaps, ya que disponen de vídeos muy aclaratorios y profesores expertos resolutivos.', N'Olga Rodríguez Estrada, (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (6, 2, N'Repuestas rápidas y añadiendo valor a las mismas. Plataforma responsive y eficiente que ayuda a realizar el curso en cualquier lugar. Genial!, ;).', N'David Bernal López, (Tarragona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (7, 3, N'Un curso muy completo y práctico, con muchos ejemplos reales que ya me ha abierto la posibilidad de llevar a cabo un proyecto en iO', N'José López Fernández (Murcia)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (8, 3, N'Es el tercer curso que hago con vosotros, y, como siempre, la documentación y el tutor son muy buenos. Ambos ayudan mucho a la hora de asimilar correctamente los contenidos.', N'Emilio Parrilla Coronado (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (9, 3, N'El curso está muy bien estructurado y se hace muy llevadero al intercalar teoría con ejercicios prácticos. Me han gustado mucho los vídeos explicativos.', N'Manuel Martínez Gómez (Vigo)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (10, 4, N'Excelente en todos los aspectos, pretendía aprender C # con .NET y lo he conseguido. El material y la comunicación con el profesor es de 10. Muy satisfecho con todo el equipo.', N'Matías Moreno Cárdenas, (Madrid) ')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (11, 4, N'Tenía ligeros conocimientos de programación en la plataforma .NET, y gracias a este curso he podido desarrollarlos, afianzarlos y, lo más importante, ponerlos en práctica', N'Ricardo García Lobo (Madrid) ')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (12, 4, N'Tenía ligeros conocimientos de programación en la plataforma .NET, y gracias a este curso he podido desarrollarlos, afianzarlos y, lo más importante, ponerlos en práctica.', N'Ángel Felipe Maenza Valencia (Guipúzcoa) ')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (14, 4, N'Muy recomendable, el curso es fácil de seguir y se le puede sacar mucho partido con un poco de dedicación. El tutor ha estado muy atento a responder cualquier consulta. ¡Repetiré! ', N'Alfredo Gaspar García (Valencia)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (15, 5, N'Un curso muy completo y recomendable.', N'Jesús Jaráiz Rodríguez (Mutilva, Navarra)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (17, 5, N'Excelente curso. El valor es proporcional a la calidad de éste.', N'Maria Natalia (Colombia)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (20, 6, N'Estoy cursando un grado superior de programación, [...] ojalá vuestros cursos estuvieran en la escuela, se aprendería muchísimo más que ahora. Gracias. ', N'Enric Ripoll (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (22, 6, N'Me parece muy buena vuestra formación, seriedad y atención al alumno. En los cursos a distancia es muy importante esa dedicación personal al seguimiento de cada alumno y la constancia en el seguimiento a cada persona.', N'Ricardo Sales Calpe, (Castellón)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (24, 7, N'Este curso me ha dado las bases que siempre busqué para poder entender temas más avanzados como el uso de un framework como AngularJS o entender la arquitectura general de una SPA.', N'Javier Alexandre Guerrero Pacheco (Buenos Aires)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (25, 7, N'Me ha gustado mucho el curso y aunque ya tenía conocimientos de JavaScript, he podido aprender muchas cosas nuevas y clarificar conocimientos que ya tenía.', N'Samuel Gómez Martín (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (26, 7, N'Ahora tengo una mejor base de JavaScript, y lo conozco con más profundidad.', N'Fabián Andrés Allel Gallardo (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (27, 7, N'Considero que es un curso que te permite afianzar conocimientos y aclarar conceptos sobre javascript, así como descubrir algunos aspectos del lenguaje que muchas veces quedan ocultos . ', N'Raúl Mateos Ferré (Tarragona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (28, 8, N'Un curso increíble. Rubén sabe transmitir muy bien los conceptos, y los ejemplos usados se ajustan perfectamente a los temas tratados. Sin duda 100% recomendable.', N'David Lledó Maestra, (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (29, 8, N'Los felicito de nuevo, cursos y seminarios de este nivel no existen en español. ', N'César Llanes Medina, (México)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (30, 9, N'No tengo nada más que buenas palabras sobre este curso [...] es 100% recomendable para todo aquel que desee introducirse en el mundo del diseño web, así como para aquellos que ya poseen ciertos conocimientos de html y necesitan perfeccionar y ponerse al día.', N'Alberto M. Fernández Sánchez (Badajoz)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (31, 9, N'Los contenidos están muy bien cuidados, y muestran técnicas que se usan en el mundo real [...] Es el segundo curso que hago con vosotros y lo recomendaría a cualquiera.', N'Xurxo Fresco Barbeito (Vigo)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (32, 9, N'Es el tercer curso que realizo con vosotros y ya estoy pensando en el cuarto. No os digo mas ', N'Raimon Bielsa
(Sant Cugat del Vallés - BCN)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (33, 9, N'Las explicaciones tan minuciosas y detallistas, no te dejan casi lugar a dudas (…) lo hace apto para cualquiera que tenga la ilusión y voluntad de aprender algo desde el principio (…). La experiencia ha sido muy satisfactoria. ', N'Mónica Rodríguez Barcia (Vigo)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (34, 9, N'Mi valoración es inmejorable, de hecho jamás he salido tan satisfecho de una formación. ', N'Ignasi Conesa (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (35, 11, N'Una estructura impecable, una teoría clara, concisa e incremental y unas prácticas propuestas que te permiten obtener el máximo rendimiento posible del curso.', N'Enric Dolcet, (Lleida)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (36, 11, N'¿Quereis aprender Responsive Web Design de forma clara y ordenada?, pues no lo dudéis, el curso de CampusMVP es el que estáis buscando. ', N'Jesús Velasco Sanz, (Vizcaya)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (37, 11, N'El curso está muy bien tanto en su contenido como en la estructuración del mismo y la plataforma web es muy intuitiva y fácil de utilizar. En términos generales, estoy muy contento de haber elegido este curso. ', N'Jorge Ángel Martín-maestro Hermida (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (38, 12, N'El curso es espectacular. Está muy bien estructurado y desarrollado para que puedas aprender desde cero, asentar y/o ampliar los conocimientos que ya tenías.', N'Jesús López Vico (Murcia)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (39, 12, N'Este es el segundo curso que hago con vosotros y en ambos he salido muy satisfecho. Tienen buenos contenidos y explicados con claridad además de la incomparable ayuda de los vídeos que aportan un plus de calidad al temario.', N'Xavier Navarro Barrios (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (40, 12, N'En una palabra: espectacular. Tengo que reconocer y felicitar a José por su continua predisposición para responder a las distintas dudas planteadas, además de resaltar su habilidad para explicar de manera sencilla los distintos conceptos vertidos en el curso. ', N'Alexandre Guerrero Pacheco, (Buenos Aires)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (41, 12, N'Muy interesante el curso, con mucho contenido que sorprende por lo extenso y por su diversidad a los que nos acercamos por primera vez a JavaScript.', N'José Luis Portillo Lorenzo (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (42, 13, N'Este curso me ha sorprendido e incluso ilusionado en algunos momentos, ya que hay cosas que no sabía ni que existían y que han abierto ante mí un mundo de posibilidades [...] lo recomiendo 100 % para todos aquellos que estén comenzando con SQL Server.', N'Eduardo Fernández (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (43, 13, N'Me ha parecido un curso muy interesante [...]. Creo que cumple dos objetivos: por una parte ser un punto de inicio para aquellos que desconocen SQL Server y por otro lado ampliar conocimientos para aquellos que ya conocen la herramienta. [...] Mis más sinceras felicitaciones.', N'Santiago Moreno, (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (44, 13, N'Me parece muy buena vuestra formación, seriedad y atención al alumno. En los cursos a distancia es muy importante esa dedicación personal al seguimiento de cada alumno y la constancia en el seguimiento a cada persona. ', N'Ricardo Sales Calpe (Castellón)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (45, 13, N'Un curso muy recomendable, hasta ahora me dedicaba a crear consultas sin pensar y el saber lo que he aprendido aquí me ayudará a crear consultas mucho más precisas y rápidas. ¡Para mí ha sido un acierto! :)', N'César González Alonso, (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (46, 14, N'Un curso muy completo, imposible terminar sin dominar MVC con la cantidad de supuestos, vídeos y la aplicación final. Muy recomendable. El profesor, de lujo.', N'Alfonso Cuesta Largo (Toledo)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (47, 14, N'El curso está genial, es muy riguroso. Una de las cosas que más me gustaron es que te explican muy bien el porqué de las cosas, es decir, cómo trabajan los componentes internamente.', N'José Martínez Torres, (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (48, 14, N'Estoy muy satisfecho con la calidad del curso. Ha cubierto de sobra las expectativas que tenía depositadas en él. Tanto el tutor como la plataforma se merecen un 10. .', N'Juan Carlos Iglesias Doval, (La Coruña)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (49, 14, N'Agradeceros el buen temario del curso y la multitud de recursos y comentar que el curso tiene una parte que considero fundamental en la formación de esta materia. Contiene ejemplos y referencias a situaciones cotidianas en el desarrollo de programas que se dan habitualmente en el mundo laboral. ', N'Fernando Pérez Marcos, (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (50, 14, N'El curso me ha parecido genial, contenidos claros y muy bien explicados y el tutor ha resuelto todas mis dudas en un tiempo increíble. Si vuelvo a hacer un curso será con vosotros. ', N'Raúl Corchero Calvo , (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (51, 15, N'Durante el curso he aprendido trucos y detalles que no están en los manuales formales. Me he dado cuenta que, cosas que yo resolvía con algunas rutinas y técnicas, se hacen con trucos sencillos que desconocía.', N'Iván Ramírez (Chile)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (52, 15, N'Mi impresión es que he aprendido bastantes cosas que desconocía de aspnet, el tema de ajax había hecho algunas cosas pero básicas y he descubierto que se pueden hacer auténticas virguerías, me ha encantado hacer este curso (...)', N'Desposorio Vizcaino León (Córdoba)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (53, 15, N'El curso en general me ha gustado mucho, se da una visión bastante completa de lo que significa trabajar con asp.net (...) Me ha gustado la mezcla de teoría, videos y descarga de ejemplos de código. Estoy satisfecha con el curso.', N'Alicia Ranz Ramos (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (54, 16, N'La formación muy bien,el profesor lo mejor. Ha contestado mis preguntas rapidísimo.', N'Sigfrid Couto Fernández (Berlín)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (55, 16, N'Me ha resultado de gran interés y ha respondido perfectamente a las expectativas que tenía antes de comenzar el curso.', N'Alejandro Carbonero López (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (56, 16, N'Excelente curso, lo recomiendo.', N'Jesús Alberto Ortiz Romero (México)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (57, 17, N'Este curso me ha permitido arrancar eficazmente con AngularJS [...] Se lo recomendaría a cualquier desarrollador web que quiera iniciarse en esta tecnología.', N'Iván Gómez (Ponferrada)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (58, 17, N'El curso concreto y bien explicado que estaba buscando, 10/10.', N'Javier Ruiz Alcaraz (Murcia)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (59, 17, N'El curso me ha servido de mucho y en las últimas semanas me han llegado ofertas de trabajo para desarrollador de Front-End en AngularJS', N'Óscar Fortes Díaz (Barcelona)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (60, 17, N'Un curso excelente y muy completo, estoy muy satisfecho. ', N'Jesús Suero Avilés (Madrid)')
INSERT [dbo].[Opinions] ([OpinionId], [CourseId], [Description], [Author]) VALUES (61, 17, N'Un curso muy completo que cubre prácticamente todos los aspectos de AngularJS. ', N'Alberto de la Fuente (Madrid)')
SET IDENTITY_INSERT [dbo].[Opinions] OFF
SET IDENTITY_INSERT [dbo].[Tutors] ON 

INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (1, N'José María Aguilar', N'jmaguilar.jpg', N'Visual Studio & Development Technologies MVP', N'José María es ingeniero técnico informático, lleva más de veinte años trabajando en el mundo del desarrollo de software, principalmente con tecnologías Microsoft. Ha trabajado como programador, analista, responsable de informática en el sector de la consultoría estratégica, y director técnico de una empresa de desarrollo.
Es un reconocido experto en desarrollo web en todo el mundo, y es autor del libro de Microsoft Press "SignalR Programming in Microsoft ASP.NET" que ha sido publicado en 4 idiomas: inglés, español, chino y japonés.
Actualmente trabaja como consultor y desarrollador independiente, ofreciendo servicios tecnológicos a empresas e instituciones.', N'jmaguilar', N'http://www.variablenotfound.com/')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (2, N'José Manuel Alarcon', N'jmalarcon.jpg', N'Visual Studio & Development Technologies MVP', N'Director general de campusMVP, ha dedicado toda su vida profesional a la Web. Este bagaje le otorga un privilegiado punto de vista que sólo tiene alguien que conoce Internet desde su nacimiento y ha vivido todos sus cambios y evoluciones.
Es ingeniero industrial y especialista en consultoría de empresa. Desde 1997 ha escrito diversos libros sobre desarrollo Web, así como cientos de artículos en revistas como PC World, iWorld, o Windows Magazine.', N'jm_alarcon', N'http://www.jasoft.org')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (3, N'Alessandro Alpi', N'aalpi.jpg', N'SQL Server MVP', N'Alessandro works as Systems Engineer and .NET Developer since 2000. He has extensive experience working in web solutions, windows applications and services. He actually works full time as DBA/DBDeveloper with the latest SQL Server versions.', N'suxtellino', N'http://www.dotnethell.it/')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (5, N'Francisco Charte', N'fcharte.jpg', NULL, N'Francisco Charte lleva más de 30 años dedicado a la enseñanza en informática, tanto en centros privados y públicos como a través de sus libros y artículos. Autor de más de 120 libros y varios centenares de artículos en revistas nacionales e internacionales, Charte es Ingeniero Informático por la Universidad de Jaén y Doctor en Tecnologías de la información y la comunicación por la Universidad de Granada.', N'fcharte', N'http://fcharte.com/')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (6, N'Rubén Rubio', N'rrubio.jpg', NULL, N'Rubén lleva más de 15 años trabajando como desarrollador de software con diversas tecnologías, y certificado por Microsoft desde el año 2003 en desarrollo con .NET. Ha trabajado como analista, desarrollador y responsable de TI en empresas de diferentes sectores. Actualmente trabaja como consultor y desarrollador independiente,ofreciendo sus servicios a empresas e instituciones, siendo también autor y docente en campusMVP.', NULL, NULL)
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (7, N'Javier Suárez', N'jsuarez.jpg', N'Visual Studio & Development Technologies y Windows MVP
Xamarin Certified Developer', N'Javier dispone de varios años de experiencia desarrollando en exclusiva para dispositivos móviles, y es uno de los expertos más conocidos en Xamarin de habla hispana. Ha creado tanto aplicaciones móviles empresariales grandes, como multitud de ellas para usuarios finales (alguna seguro que la conoces). Actualmente es Software Development Engineer en Plain Concepts. Es un gran apasionado de la comunidad, participando en múltiples eventos y charlas, y siendo uno de los administradores de los grupos de desarrolladores Xamarin y .NET de Sevilla.', N'jsuarezruiz', N'http://www.campusmvp.es/javiersuarezruiz.wordpress.com')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (8, N'Eduard Tomás', N'etomas.jpg', N'Visual Studio & Development Technologies MVP', N'Eduard Tomás es ingeniero informático y atesora más de 12 años de experiencia como desarrollador. Especializado en tecnologías Microsoft, actualmente está focalizado en el desarrollo de aplicaciones web y móviles. Mantiene un conocido blog sobre desarrollo en .NET en general y ASP.NET MVC en particular. Colabora con la comunidad impartiendo charlas en formato webcast y en eventos de distintos grupos de usuarios.', N'eximenis', N'http://geeks.ms/etomas/')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (9, N'Marino Posadas', NULL, N'Visual Studio and Development Technologies 
', N'Marino Posadas es consultor, formador y escritor independiente sobre tecnologías Web y herramientas de desarrollo Microsoft. Durante los últimos 12 años ha sido reconocido por Microsoft como Most Valuable Professional (MVP) en diversas tecnologías, y es formador certificado (MCT) desde 1996. Es autor de 14 libros sobre programación, y ha escrito más de 500 artículos técnicos. También ha participado como “speaker” en conferencias y eventos internacionales para programadores en EE.UU., Méjico, Costa Rica, Inglaterra, Suiza y Portugal.', N'marinoposadas', N'http://elavefenix.net/')
INSERT [dbo].[Tutors] ([TutorId], [Name], [Photo], [ShortDescription], [Description], [Twitter], [Blog]) VALUES (10, N'David García Valiñas', N'dgarcia.jpg', N'Ingeniero Informático', N'David García es ingeniero informático. Está especializado en desarrollo de interfaces de usuario, domina diferentes tecnologías, desde Unity hasta Angular, y posee una amplia experiencia tanto en desarrollo web como de videojuegos. Es un activo ponente en diferentes comunidades de JavaScript, PHP y tecnologías de desarrollo de Google.', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tutors] OFF
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (1, 2)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (1, 14)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (1, 16)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (2, 6)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (2, 7)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (2, 9)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (2, 12)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (2, 15)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (3, 13)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (5, 11)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (5, 22)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (6, 4)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (6, 5)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (6, 8)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (6, 13)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (7, 1)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (8, 3)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (8, 7)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (9, 17)
INSERT [dbo].[TutorsCourses] ([TutorId], [CourseId]) VALUES (10, 24)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Category_Name]    Script Date: 09/02/2017 12:28:15 ******/
ALTER TABLE [dbo].[Categories] ADD  CONSTRAINT [UK_Category_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Course_Name]    Script Date: 09/02/2017 12:28:15 ******/
ALTER TABLE [dbo].[Courses] ADD  CONSTRAINT [UK_Course_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Tutor_Name]    Script Date: 09/02/2017 12:28:15 ******/
ALTER TABLE [dbo].[Tutors] ADD  CONSTRAINT [UK_Tutor_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CoursesCategories]  WITH CHECK ADD  CONSTRAINT [FK_CoursesCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoursesCategories] CHECK CONSTRAINT [FK_CoursesCategories_Categories]
GO
ALTER TABLE [dbo].[CoursesCategories]  WITH CHECK ADD  CONSTRAINT [FK_CoursesCategories_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CoursesCategories] CHECK CONSTRAINT [FK_CoursesCategories_Courses]
GO
ALTER TABLE [dbo].[Features]  WITH CHECK ADD  CONSTRAINT [FK_Features_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Features] CHECK CONSTRAINT [FK_Features_Courses]
GO
ALTER TABLE [dbo].[Opinions]  WITH CHECK ADD  CONSTRAINT [FK_Opinions_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Opinions] CHECK CONSTRAINT [FK_Opinions_Courses]
GO
ALTER TABLE [dbo].[TutorsCourses]  WITH CHECK ADD  CONSTRAINT [FK_TutorsCourses_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TutorsCourses] CHECK CONSTRAINT [FK_TutorsCourses_Courses]
GO
ALTER TABLE [dbo].[TutorsCourses]  WITH CHECK ADD  CONSTRAINT [FK_TutorsCourses_Tutors] FOREIGN KEY([TutorId])
REFERENCES [dbo].[Tutors] ([TutorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TutorsCourses] CHECK CONSTRAINT [FK_TutorsCourses_Tutors]
GO
USE [master]
GO
ALTER DATABASE [campusMVPAppInfo] SET  READ_WRITE 
GO
