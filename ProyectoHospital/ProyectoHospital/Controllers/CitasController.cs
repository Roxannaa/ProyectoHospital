using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProyectoHospital.Models;

namespace ProyectoHospital.Controllers
{
    public class CitasController : Controller
    {
        private Model1Container db = new Model1Container();

        // GET: Citas
        public ActionResult Index(string consulta)
        {
            /*var citas = db.Citas.Include(c => c.Paciente).Include(c => c.Medico);
            return View(citas.ToList());*/
            try {
                var busqueda = DateTime.Parse(consulta);
                if (consulta != null)
                {
                    return View(db.Citas.Where(x => x.Fecha == busqueda | x.Medico.Nombre.Contains(consulta) | x.Paciente.Nombre.Contains(consulta)));
                }
            }
            catch
            {
                return View(db.Citas.ToList());
            }
            return View(db.Citas.ToList());
            
        }

        // GET: Citas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Citas citas = db.Citas.Find(id);
            if (citas == null)
            {
                return HttpNotFound();
            }
            return View(citas);
        }

        // GET: Citas/Create
        public ActionResult Create()
        {
            ViewBag.PacientesId = new SelectList(db.Pacientes, "Id", "Nombre");
            ViewBag.MedicosId = new SelectList(db.Medicos, "Id", "Nombre");
            return View();
        }

        // POST: Citas/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Fecha,Hora,PacientesId,MedicosId")] Citas citas)
        {
            if (ModelState.IsValid)
            {
                db.Citas.Add(citas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PacientesId = new SelectList(db.Pacientes, "Id", "Nombre", citas.PacientesId);
            ViewBag.MedicosId = new SelectList(db.Medicos, "Id", "Nombre", citas.MedicosId);
            return View(citas);
        }

        // GET: Citas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Citas citas = db.Citas.Find(id);
            if (citas == null)
            {
                return HttpNotFound();
            }
            ViewBag.PacientesId = new SelectList(db.Pacientes, "Id", "Cedula", citas.PacientesId);
            ViewBag.MedicosId = new SelectList(db.Medicos, "Id", "Nombre", citas.MedicosId);
            return View(citas);
        }

        // POST: Citas/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Fecha,Hora,PacientesId,MedicosId")] Citas citas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(citas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PacientesId = new SelectList(db.Pacientes, "Id", "Cedula", citas.PacientesId);
            ViewBag.MedicosId = new SelectList(db.Medicos, "Id", "Nombre", citas.MedicosId);
            return View(citas);
        }

        // GET: Citas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Citas citas = db.Citas.Find(id);
            if (citas == null)
            {
                return HttpNotFound();
            }
            return View(citas);
        }

        // POST: Citas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Citas citas = db.Citas.Find(id);
            db.Citas.Remove(citas);
            db.SaveChanges();
            return RedirectToAction("Index");
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
