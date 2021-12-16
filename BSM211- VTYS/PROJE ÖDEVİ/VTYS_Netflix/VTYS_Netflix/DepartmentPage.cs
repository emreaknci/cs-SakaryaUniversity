using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VTYS_Netflix
{
    public partial class DepartmentPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;


        public void departmanGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Departments\"  where \"Id\">0";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataDepartman.DataSource = ds.Tables[0];
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
        }


        public DepartmentPage()
        {
            InitializeComponent();
        }

        private void DepartmentPage_Load(object sender, EventArgs e)
        {
            departmanGoster(connection);
        }


        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"Departments\" (\"Name\") values (@ad)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            departmanGoster(connection); 
            temizle();
        }
        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"Departments\" set \"Name\"=@ad where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            departmanGoster(connection);
        }
        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Departments\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            departmanGoster(connection);
        }


        private void dataDepartment_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataDepartman.CurrentRow.Cells["Id"].Value.ToString();
            secilenId =Convert.ToInt32(id);
            txtAd.Text = dataDepartman.CurrentRow.Cells["Name"].Value.ToString();
        }
    }
}
