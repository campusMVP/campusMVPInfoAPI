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
    
    public partial class Opinion
    {
        public int OpinionId { get; set; }
        public int CourseId { get; set; }
        public string Description { get; set; }
        public string Author { get; set; }
    
        public virtual Course Course { get; set; }
    }
}