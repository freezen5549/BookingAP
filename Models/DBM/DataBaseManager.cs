using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;

namespace BookingAP.Models.DBM
{
    public class DataBaseManager
    {
        public class ApplicationDbContext : DbContext
        {
            private readonly string _connectionString;
            public ApplicationDbContext(IConfiguration configuration)
            {
                _connectionString = configuration.GetConnectionString("APContext");
            }
            public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
            {
                app.UseCors("AllowAllOrigins");
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

            protected override void OnModelCreating(ModelBuilder modelBuilder)
            {
                modelBuilder.Entity<UserExistResponse>().HasNoKey();
            }

            public IEnumerable<UserExistResponse> uspUserExist(UserExistRequest userExist)
            {
                const string sql = "EXEC uspUserExist @Para1, @Para2";

                SqlParameter[] parameters = new SqlParameter[2];
                parameters[0] = new SqlParameter("@Para1", userExist.UserAccount);
                parameters[1] = new SqlParameter("@Para2", userExist.UserPassword); 

               return Set<UserExistResponse>().FromSqlRaw(sql, parameters).ToList();
            }

        }
    }
}
