using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Iot_Angular_Back.Models
{
    public class ApplicationContext : DbContext
    {
        public DbSet<Users> users { get; set; }
        public object Users { get; internal set; }
    }

}
