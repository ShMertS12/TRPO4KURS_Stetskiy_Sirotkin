//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TRPO4KURS_Stetskiy_Sirotkin
{
    using System;
    using System.Collections.Generic;
    
    public partial class Users
    {
        public int ID { get; set; }
        public string FIO { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int RoleID { get; set; }
        public string Pictures { get; set; }
        public string Photo { get { return Pictures == null? "/Cartinki/def.jpg" : "/Cartinki/" + Pictures; } }
        public virtual Role Role { get; set; }
    }
}
