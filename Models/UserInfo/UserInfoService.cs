using BookingAP.Models.DBM;
using Microsoft.EntityFrameworkCore;
using static BookingAP.Models.DBM.DataBaseManager;
using static BookingAP.Models.DBM.DataBaseManager.ApplicationDbContext;

namespace BookingAP.Models.UserInfo
{
    public class UserInfoService : IUserInfoService
    {
        private readonly ApplicationDbContext _dbContext;

        public UserInfoService(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<bool> CheckUserExist(UserExistRequest userExistRequest)
        {
            var userExistResponse = _dbContext.uspUserExist(userExistRequest);
            if (userExistResponse.Count() > 0)
            {
                return true;
            }
            else 
            { 
                return false; 
            }
        }
    }
}