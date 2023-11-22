using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace BookingAP.Models.DBM
{
    public partial class DataBaseManager
    {
        public partial class ApplicationDbContext
        {
            public IEnumerable<UserExistResponse> uspUserExist(UserExistRequest userExist)
            {
                SqlParameter[] parameters = GetSqlParameter(userExist);
                string sql = SqlSpString("uspUserExist", parameters.Length);

                return Set<UserExistResponse>().FromSqlRaw(sql, parameters).ToList();
            }

            public IEnumerable<UserInsertResponse> uspUserInsert(UserInsertRequest userInsert)
            {
                SqlParameter[] parameters = GetSqlParameter(userInsert);
                string sql = SqlSpString("uspUserInsert", parameters.Length);

                return Set<UserInsertResponse>().FromSqlRaw(sql, parameters).ToList();
            }
        }
    }
}
