using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Iot_Angular_Back.Models;
using Iot_Angular_Back.Models.Services;
using Microsoft.AspNetCore.Mvc;

namespace Iot_Angular_Back.Controllers
{
    public class UserController : Controller
    {
        private readonly UserService _userService;
        private readonly ApplicationDbContext _db;

        public UserController(UserService userService, ApplicationDbContext context)
        {
            _userService = userService;
            _db = context;
        }

        #region GetUser
        [HttpGet("GetUser")]
        public async Task<Users> GetUser(int id)
        {
            
            Users user = await _userService.GetUser(id);
            return user;
        }
        #endregion

    }
}
