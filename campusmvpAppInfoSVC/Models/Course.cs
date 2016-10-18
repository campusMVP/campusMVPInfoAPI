using System.Collections.Generic;
using System.Linq;

namespace campusmvpAppInfoSVC.Models
{
    public class Course
    {
        public int CourseId { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public string Requirements { get; set; }
        public string InfoUrl { get; set; }
        //Propiedades complejas
        public List<string> Features { get; set; }
        public List<Opinion> Opinions { get; set; }
        public List<Tutor> Tutors { get; set; }

        /// <summary>
        /// "Mapea" la clase DAL.Course a una instancia de esta clase (DTO)
        /// </summary>
        /// <param name="course"></param>
        /// <returns></returns>
        public static Course Map(DAL.Course course)
        {
            if (course == null)
                return new Course();
            else
                return new Course()
                {
                    CourseId = course.CourseId,
                    Name = course.Name,
                    Image = course.Image,
                    ShortDescription = course.ShortDescription,
                    Description = course.Description,
                    Requirements = course.Requirements,
                    InfoUrl = course.InfoUrl,
                    Features = course.Features.Select(feat => feat.FeatureText).ToList(),
                    Opinions = course.Opinions.Select(opinion => Opinion.Map(opinion)).ToList(),
                    Tutors = course.Tutors.Select(tutor => Tutor.Map(tutor)).ToList()
                };
        }

    }
}