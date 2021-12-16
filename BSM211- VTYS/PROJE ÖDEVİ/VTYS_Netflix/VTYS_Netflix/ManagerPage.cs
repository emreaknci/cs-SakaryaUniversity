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
    public partial class ManagerPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        public void menajerGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Managers\" where \"Id\">0";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataManager.DataSource = ds.Tables[0];
            con.Close();
        }
        public void temizle()
        {
            txtAd.Clear();
            txtSoyad.Clear();
        }
        public ManagerPage()
        {
            InitializeComponent();
        }

        private void ManagerPage_Load(object sender, EventArgs e)
        {
            menajerGoster(connection);
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"Managers\" (\"FirstName\",\"LastName\") values (@ad,@soyad)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            menajerGoster(connection);
            temizle();
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Managers\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            menajerGoster(connection);
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"Managers\" set \"FirstName\"=@ad,\"LastName\"=@soyad where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            menajerGoster(connection);
        }

        private void dataManager_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataManager.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataManager.CurrentRow.Cells["FirstName"].Value.ToString();
            txtSoyad.Text = dataManager.CurrentRow.Cells["LastName"].Value.ToString();
        }

       
    }
}
