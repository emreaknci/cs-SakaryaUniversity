using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYS_Netflix
{
    public partial class SubPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        string text;
        int plan;
        int sehir;
        public void aboneGoster(NpgsqlConnection con)
        {
            if (con.State != ConnectionState.Open)

                con.Open();
            sorgu = "select * from \"public\".\"Subscribers\"";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataSub.DataSource = ds.Tables[0];
            con.Close();
        }
        public void planGoster(NpgsqlConnection con)
        {
            if (con.State != ConnectionState.Open)
                con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from \"Plans\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbPlanAra.DisplayMember = "Name";
            cmbPlanAra.ValueMember = "Id";
            cmbPlanAra.DataSource = dt;
            con.Close();
        }
        public void sehirGoster(NpgsqlConnection con)
        {
            con.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter("select * from \"Cities\"", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            cmbSehirAra.DisplayMember = "Name";
            cmbSehirAra.ValueMember = "Id";
            cmbSehirAra.DataSource = dt;
            con.Close();
        }
        public void ara(int plan,int sehir,string ifade)
        {
            text = txtAranacak.Text;
            plan = Convert.ToInt32(cmbPlanAra.SelectedValue);
            sehir = Convert.ToInt32(cmbSehirAra.SelectedValue);
            if (text==""&&plan==0&&sehir==0)
                aboneGoster(connection);

            else if(text==""&&sehir==0&&plan!=0)
                sorgu = "select * from \"Subscribers\" where \"PlanId\"=" + plan;

            else if(text==""&&sehir!=0&&plan==0)
                sorgu = "select * from \"Subscribers\" where \"CityId\"=" + sehir;

            else if(text == "" && sehir != 0 && plan != 0)
                sorgu = "select * from \"Subscribers\" where \"PlanId\"=" + plan+" and \"CityId\"="+sehir;

            else if (text != "" && sehir == 0 && plan == 0)
                sorgu = "select * from \"Subscribers\" where \"FirstName\" || ' ' || \"LastName\" like '%" +
                               CultureInfo.CurrentCulture.TextInfo.ToTitleCase(text) + "%'";

            else if (text != "" && sehir == 0 && plan != 0)
                sorgu = "select * from \"Subscribers\" where \"PlanId\"=" + plan + " and \"FirstName\" || ' ' || \"LastName\" like '%" +
                              CultureInfo.CurrentCulture.TextInfo.ToTitleCase(text) + "%'";

            else if (text != "" && sehir != 0 && plan == 0)
                sorgu = "select * from \"Subscribers\" where \"CityId\"=" + sehir + " and \"FirstName\" || ' ' || \"LastName\" like '%" +
                              CultureInfo.CurrentCulture.TextInfo.ToTitleCase(text) + "%'";

            else if (text != "" && sehir != 0 && plan != 0)
                sorgu = "select * from \"Subscribers\" where \"CityId\"=" + sehir +" and \"PlanId\"="+plan+ " and \"FirstName\" || ' ' || \"LastName\" like '%" +
                              CultureInfo.CurrentCulture.TextInfo.ToTitleCase(text) + "%'";
        }

        public SubPage()
        {
            InitializeComponent();
        }

        private void SubPage_Load(object sender, EventArgs e)
        {
            planGoster(connection);
            sehirGoster(connection);
            aboneGoster(connection);

        }

        private void btnGoster_Click(object sender, EventArgs e)
        {
            aboneGoster(connection);
            txtAranacak.Clear();
            cmbPlanAra.SelectedIndex = 0;
            cmbSehirAra.SelectedIndex = 0;
        }

        private void txtAranacak_TextChanged(object sender, EventArgs e)
        {
            dataSub.Refresh();
            text=txtAranacak.Text;
            plan = Convert.ToInt32(cmbPlanAra.SelectedValue);
            sehir = Convert.ToInt32(cmbSehirAra.SelectedValue);
            ara(plan,sehir,text);            
            
            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataSub.DataSource = dt;
            dataSub.Refresh();
            connection.Close();
        }
        private void cmbPlanAra_SelectedIndexChanged(object sender, EventArgs e)
        {
            ara(plan, sehir, text);


            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            if (connection.State != ConnectionState.Open)
                connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataSub.DataSource = dt;
            dataSub.Refresh();
            connection.Close();
        }
        private void cmbSehirAra_SelectedIndexChanged(object sender, EventArgs e)
        {
            ara(plan, sehir, text);

            DataTable dt = new DataTable();
            komut = new NpgsqlCommand();
            komut.Connection = connection;
            komut.CommandText = sorgu;
            if (connection.State != ConnectionState.Open)
                connection.Open();
            NpgsqlDataAdapter da = new NpgsqlDataAdapter();
            da.SelectCommand = komut;
            da.Fill(dt);
            dataSub.DataSource = dt;
            dataSub.Refresh();
            connection.Close();
        }
    }
}
