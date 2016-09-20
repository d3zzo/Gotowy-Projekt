using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SuperStrona
{
    public partial class MainPage : System.Web.UI.Page
    {
        CookBookEntities baza = new CookBookEntities();
        private List<string> dodani = new List<string>();

        protected void wybierzPotrawe(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;

            ListBox1.Items.Clear();
            ListBox2.Items.Clear();
            var lista = baza.Przepis.ToList();
            lista.OrderBy(x => x.Nazwa);
            foreach (var item in lista)
            {
                ListBox1.Items.Add(item.Nazwa);
            }
        }

        protected void dodajPrzepis(object sender, EventArgs e)
        {
           
            MultiView1.ActiveViewIndex = 1;

            CheckBoxList1.Items.Clear();
            var wyswietl = baza.Skladnik.GroupBy(x => x.Nazwa).Select(g => g.FirstOrDefault());
            foreach (var item in wyswietl)
            {
                CheckBoxList1.Items.Add(item.Nazwa);
            }
        }

        protected void Button3_Click(object sender, EventArgs e) 
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Button4_Click(object sender, EventArgs e) // Wyswietl skladniki danej potrawy 
        {
            ListBox2.Items.Clear();
            if (ListBox1.SelectedIndex >= 0)
            {
                var wybrany = ListBox1.SelectedValue;
                var obiekt = baza.Przepis.First(x => x.Nazwa == wybrany);

                foreach (var item in baza.Skladnik)
                {
                    if (item.PrzepisRefId == obiekt.Id)
                    {
                        ListBox2.Items.Add(item.Nazwa);
                    }
                }
            }                         
        }

        protected void Button5_Click(object sender, EventArgs e)  //Dodaj skladnik btn
        {
            if (TextBox2.Text != null)
            {

                string tekst = TextBox2.Text;
                CheckBoxList1.Items.Add(TextBox2.Text);
                //dodani = (List<string>)Session["listaDodanych"];
                dodani.Add(TextBox2.Text);
                dodani.Add(tekst);
                Session["listaDodanych"] = dodani;
            }        
        }

        protected void Button6_Click(object sender, EventArgs e)  //Dodaj przepis btn
        {

            var selected = CheckBoxList1.Items.Cast<ListItem>().Where(x => x.Selected);
            baza.Przepis.Add(new Przepis { Nazwa = TextBox1.Text });
            baza.SaveChanges();

            List<string> wybrani2 = (List<string>)Session["listaDodanych"];
            var idref = baza.Przepis.Where(x => x.Nazwa == TextBox1.Text).Select(y => y.Id).FirstOrDefault();
            foreach (var item in selected)
            {
                baza.Skladnik.Add(new Skladnik { Nazwa = item.Value, PrzepisRefId = idref });
            }
            baza.SaveChanges();
            MultiView1.ActiveViewIndex = 2;
        }


        protected void ValidateModuleList(object sender, ServerValidateEventArgs e)
        {
            int cnt = 0;

            for (int i = 0; i < CheckBoxList1.Items.Count; i++)
            {
                if (CheckBoxList1.Items[i].Selected)
                {
                    cnt++;
                }

                e.IsValid = (cnt == 0) ? false : true;
            }
        }
    }
}