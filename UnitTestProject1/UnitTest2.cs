using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using TRPO4KURS_Stetskiy_Sirotkin.Pages;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest2
    {
        [TestMethod]
        public void TestMethod1()
        {
            var page = new Avtoriz();
            Assert.IsTrue(page.Auth("Bakus", "12345"));
            Assert.IsTrue(page.Auth("xXx_Killer_xXX", "qwerty12345"));
            Assert.IsTrue(page.Auth("Administrator", "1"));
            Assert.IsTrue(page.Auth("Margaret", "BruhCringe12"));
            Assert.IsTrue(page.Auth("Login", "pass12"));
            Assert.IsTrue(page.Auth("NewLogin", "somaly120402"));
            Assert.IsTrue(page.Auth("Enter", "Enter12"));
            Assert.IsTrue(page.Auth("Test1", "testpassword1"));
        }
    }
}
