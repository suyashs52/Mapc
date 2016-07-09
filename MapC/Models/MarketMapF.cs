using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MapC.Models
{
    public class MarketMapF
    {
        public int ID { get; set; }
        public string Country { get; set; }
        public string AccountName { get; set; }
        public string CustomerType { get; set; }
        public string BrandName { get; set; }
        public string EnzymesUsed { get; set; }

    }
    public class TechMapF
    {
        public int ID { get; set; }
        public string Country { get; set; }
        public string AccountName { get; set; }
        public string BrandName { get; set; }
        public string Tier { get; set; }

    }
}