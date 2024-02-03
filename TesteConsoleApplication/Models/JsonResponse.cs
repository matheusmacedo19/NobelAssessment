﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TesteConsoleApplication.Models
{
    public class JsonResponse
    {
        public int id { get; set; }
        public string description { get; set; }
        public string url { get; set; }
        public List<string> topics { get; set; }
        public List<string> levels { get; set; }
        public List<string> types { get; set; }

    }
}
