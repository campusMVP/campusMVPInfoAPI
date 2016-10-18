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
    public class CoursesController : ApiController
    {

        private campusmvpAppInfoSVC.DAL.Entities db = new campusmvpAppInfoSVC.DAL.Entities();

        // GET: Courses/{id}
        [ResponseType(typeof(Course))]
        public IHttpActionResult GetCourse(int id)
        {
            Course course = Course.Map(db.Courses.Find(id));
            if (course == null)
            {
                return NotFound();
            }

            return Ok(course);
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

