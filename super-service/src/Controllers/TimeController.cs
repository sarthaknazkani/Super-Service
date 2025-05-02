using System;
using Microsoft.AspNetCore.Mvc;

namespace SuperService.Controllers
{
    [ApiController]
    [Route("/[controller]")]
    public class TimeController : ControllerBase
    {
        private IClock clock;

        public TimeController(IClock clock)
        {
            this.clock = clock;
        }

        [HttpGet("utc")]
        public DateTime GetUtc()
        {
            return clock.GetNow();
        }

        [HttpGet("ist")]
        public DateTime GetIst()
        {
            var utcTime = clock.GetNow();
            var istTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(utcTime, "Asia/Kolkata");
            return istTime;
        }

        [HttpGet("cst")]
        public DateTime GetCst()
        {
            var utcTime = clock.GetNow();
            var cstTime = TimeZoneInfo.ConvertTimeBySystemTimeZoneId(utcTime, "America/Chicago");
            return cstTime;
        }
    }
}