//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SuperStrona
{
    using System;
    using System.Collections.Generic;
    
    public partial class Skladnik
    {
        public int Id { get; set; }
        public string Nazwa { get; set; }
        public Nullable<int> Ilosc { get; set; }
        public Nullable<int> Cena { get; set; }
        public Nullable<int> PrzepisRefId { get; set; }
    
        public virtual Przepis Przepis { get; set; }
    }
}
