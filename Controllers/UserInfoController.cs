using BookingAP.Models.DBM;
using BookingAP.Models.UserInfo;
using Microsoft.AspNetCore.Mvc;

namespace BookingAP.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UserInfoController : Controller
    {
        private readonly IUserInfoService _userInfoService;

        public UserInfoController(IUserInfoService userInfoService)
        {
            _userInfoService = userInfoService;
        }

        [HttpPost("UserExist")]
        public async Task<IActionResult> UserExist(UserExistRequest userExistRequest)
        {
            return Ok(await _userInfoService.CheckUserExist(userExistRequest));
        }

    }
}
