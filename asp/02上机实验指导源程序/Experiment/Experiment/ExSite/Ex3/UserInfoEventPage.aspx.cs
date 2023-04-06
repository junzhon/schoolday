using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ex3_UserInfoEventPage : System.Web.UI.Page
{
  protected void BtnSubmit_Click(object sender, EventArgs e)
  {
    string birthday = txtBirthday.Text;
    UserInfoEvent userInfoEvent = new UserInfoEvent("王明", DateTime.ParseExact(birthday, "yyyyMMdd", null));
    userInfoEvent.ValidateBirthday += new EventHandler(UserInfoEvent_ValidateBirthday);
    Response.Write(userInfoEvent.DecideAge());
  }

  void UserInfoEvent_ValidateBirthday(object sender, EventArgs e)
  {
    Response.Write("请输入1900-1-1到" + DateTime.Now.ToShortDateString() + "之间的日期！");
  }
}