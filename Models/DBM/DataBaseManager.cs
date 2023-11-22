using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Reflection;

namespace BookingAP.Models.DBM
{
    public partial class DataBaseManager
    {
        public partial class ApplicationDbContext : DbContext
        {
            private readonly string _connectionString;
            public ApplicationDbContext(IConfiguration configuration)
            {
                _connectionString = configuration.GetConnectionString("APContext");
            }

            protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            {
                if (!optionsBuilder.IsConfigured)
                {
                    optionsBuilder.UseSqlServer(_connectionString, options =>
                    {
                        options.EnableRetryOnFailure();
                    });
                }
            }

            private string SqlSpString(string SqlScript,int lenght) 
            {
                SqlScript = "EXEC " + SqlScript + " ";
                string paraString = "";
                for (int i = 0; i < lenght; i++) 
                {
                    if (paraString == "")
                    {
                        paraString += "@Para" + (i + 1);
                    }
                    else 
                    {
                        paraString += ", @Para" + (i + 1);
                    }
                }
                return SqlScript + paraString;
            }

            private SqlParameter[] GetSqlParameter<T>(T Request) 
            {
                PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
                SqlParameter[] sqlParaResult = new SqlParameter[Props.Length];
                int i = 0;
                foreach (PropertyInfo prop in Props)
                {
                    sqlParaResult[i] = new SqlParameter("@Para" + (i+1), prop.GetValue(Request));
                    i++;
                }
                return sqlParaResult;
            }

            protected override void OnModelCreating(ModelBuilder modelBuilder)
            {
                modelBuilder.Entity<UserExistResponse>().HasNoKey(); 
                modelBuilder.Entity<UserInsertResponse>().HasNoKey();
            }
        }
    }
}
