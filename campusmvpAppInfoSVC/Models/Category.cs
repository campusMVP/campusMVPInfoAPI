using System;
using campusmvpAppInfoSVC.DAL;

namespace campusmvpAppInfoSVC.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string Icon { get; set; }
        public string Color { get; set; }
        public string Description { get; set; }
        public int Courses { get; set; }    //Número de cursos que tiene la categoría

        /// <summary>
        /// "Mapea" la clase Category de acceso a datos 
        /// con la clase actual (DTO)
        /// </summary>
        /// <param name="categ"></param>
        public static Category Map(DAL.Category categ)
        {
            if (categ == null)
                return new Category();
            else
                return new Category()
                {
                    CategoryId = categ.CategoryId,
                    Name = categ.Name,
                    Icon = categ.Icon,
                    Color = categ.Color,
                    Description = categ.Description,
                    Courses = categ.Courses.Count
                };
        }
    }
}