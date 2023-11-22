using BookingAP.Models.DBM;

namespace BookingAP.Models.UserInfo
{
    public interface IUserInfoService
    {
        Task<bool> CheckUserExist(UserExistRequest userExistRequest);

        Task<bool> UserInsert(UserInsertRequest userInsertRequest);
    }
}
