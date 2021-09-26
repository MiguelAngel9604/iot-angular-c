using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iot_Angular_Back.Models;
using Iot_Angular_Back.Models.Services;
using Microsoft.AspNetCore.Mvc;

namespace Iot_Angular_Back.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : Controller
    {
        private readonly UserService _userService;
        private readonly ApplicationDbContext _db;

        public UserController(UserService userService, ApplicationDbContext context)
        {
            _userService = userService;
            _db = context;
        }

        #region GetUsers
        [HttpGet("GetUsers")]
        public async Task<Users[]> GetUsers()
        {

            Users[] user = await _userService.GetUsers();
            return user;
        }
        #endregion

        #region GetUser
        [HttpGet("GetUser")]
        public async Task<Users> GetUser(int id)
        {
            
            Users user = await _userService.GetUser(id);
            return user;
        }
        #endregion

        #region PostUser
        [HttpGet("PostUser")]
        public async Task<Users> PostUser(int id)
        {

            Users user = await _userService.GetUser(id);
            return user;
        }
        #endregion

        #region DeleteUser
        [HttpGet("DeleteUser")]
        public async Task<Users> DeleteUser(int id)
        {

            Users user = await _userService.GetUser(id);
            return user;
        }
        #endregion

        #region PutUser
        [HttpGet("PutUser")]
        public async Task<Users> PutUser(int id)
        {

            Users user = await _userService.GetUser(id);
            return user;
        }
        #endregion

    }
}
