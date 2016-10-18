using System.Collections.Generic;

namespace campusmvpAppInfoSVC.Models
{
    public class Tutor
    {
        public int TutorId { get; set; }
        public string Name { get; set; }
        public string Photo { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public string Twitter { get; set; }
        public string Blog { get; set; }

        /// <summary>
        /// "Mapea" la clase Category de acceso a datos 
        /// con la clase actual (DTO)
        /// </summary>
        /// <param name="tutor"></param>
        public static Tutor Map(DAL.Tutor tutor)
        {
            if (tutor == null)
                return new Tutor();
            else
                return new Tutor()
                {
                    TutorId = tutor.TutorId,
                    Name = tutor.Name,
                    Photo = tutor.Photo,
                    ShortDescription = tutor.ShortDescription,
                    Description = tutor.Description,
                    Twitter = tutor.Twitter,
                    Blog = tutor.Blog
                };
        }
    }
}
