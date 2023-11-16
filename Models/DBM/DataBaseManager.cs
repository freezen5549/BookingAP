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
                _connectionString = configuration.GetConnectionString("Web_InterViewTestContext");
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

            class SpPara
            {
                public string Name { get; set; } = string.Empty;
                public object Value { get; set; } = string.Empty;
            }

            public virtual IEnumerable<UserExistResponse> uspUserExist(UserExistRequest userExist)
            {
                SqlParameter[] parameters = new SqlParameter[2];

                parameters[0] = new SqlParameter($"@Para1", userExist.UserAccount);
                parameters[1] = new SqlParameter($"@Para2", userExist.UserPassword);

                return Set<UserExistResponse>().FromSqlRaw($"EXEC uspUserExist", parameters).ToList();
            }

        }
    }
}
