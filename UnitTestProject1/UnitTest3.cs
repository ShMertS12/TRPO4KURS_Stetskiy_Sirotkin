using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using TRPO4KURS_Stetskiy_Sirotkin.Pages;

namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest3
    {
        [TestMethod]
        public void AuthTest1()
        {
            var page = new Avtoriz();
            Assert.IsTrue(page.Auth("test", "test"));
            Assert.IsFalse(page.Auth("user1", "12345"));
            Assert.IsFalse(page.Auth(" ", " "));
            Assert.IsFalse(page.Auth("", ""));
        }
    }
}
