//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace campusmvpAppInfoSVC.DAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tutor
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tutor()
        {
            this.Courses = new HashSet<Course>();
        }
    
        public int TutorId { get; set; }
        public string Name { get; set; }
        public string Photo { get; set; }
        public string ShortDescription { get; set; }
        public string Description { get; set; }
        public string Twitter { get; set; }
        public string Blog { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Course> Courses { get; set; }
    }
}