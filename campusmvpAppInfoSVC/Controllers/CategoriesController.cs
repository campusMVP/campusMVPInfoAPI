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
    public class CategoriesController : ApiController
    {
        private campusmvpAppInfoSVC.DAL.Entities db = new campusmvpAppInfoSVC.DAL.Entities();

        // GET: Categories
        public IEnumerable<Category> GetCategories()
        {
            //Se obtienen las categorías ordenadas por el capo "Position" 8que nos permite controlar en qué orden aparecen)
            var categoriesDAL = db.Categories.OrderBy(c => c.Position).ToList<DAL.Category>();
            //Se convierten en objetos del modelo para intercambio de datos (DTOs).
            var res = categoriesDAL.Select(categ => Category.Map(categ));
            return res;
        }

        // GET: Categories/{id}
        [ResponseType(typeof(Category))]
        public IHttpActionResult GetCategory(int id)
        {
            Category category = Category.Map(db.Categories.Find(id));
            if (category == null)
            {
                return NotFound();
            }

            return Ok(category);
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