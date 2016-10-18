using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using campusmvpAppInfoSVC.Models;

namespace campusmvpAppInfoSVC.Controllers
{
    public class CategoryCoursesController : ApiController
    {
        private campusmvpAppInfoSVC.DAL.Entities db = new campusmvpAppInfoSVC.DAL.Entities();

        /// <summary>
        /// Devuelve todos los cursos que pertenecen a una categoría dada
        /// </summary>
        /// <param name="id">El ID de la categoría cuyos cursos queremos obtener</param>
        /// <returns></returns>
        // GET: CategoryCourses/{id}
        public IEnumerable<Course> GetCategoryCourses(int id)
        {
            var cursosDAL = db.Categories.Find(id).Courses.OrderBy(c => c.DateAdded);
            var res = cursosDAL.Select(curso => Course.Map(curso));
            return res;
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}