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
    public partial class DirectorPage : Form
    {
        NpgsqlConnection connection = new NpgsqlConnection(@"server=localhost;port=5432;Database=NetflixDb;user Id=postgres;password=123456");
        NpgsqlCommand komut;
        string sorgu;
        int secilenId;
        public void yonetmenGoster(NpgsqlConnection con)
        {
            con.Open();
            sorgu = "select * from \"public\".\"Directors\"  where \"Id\">0";
            komut = new NpgsqlCommand(sorgu, connection);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataYonetmen.DataSource = ds.Tables[0];
            con.Close();
        }

        public void temizle()
        {
            txtAd.Clear();
            txtSoyad.Clear();
        }
        public DirectorPage()
        {
            InitializeComponent();
        }

        private void DirectorPage_Load(object sender, EventArgs e)
        {
            yonetmenGoster(connection);
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            sorgu = "insert into \"public\".\"Directors\" (\"FirstName\",\"LastName\") values (@ad,@soyad)";
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            yonetmenGoster(connection);
            temizle();
        }

        private void btnDuzenle_Click(object sender, EventArgs e)
        {
            sorgu = "update \"public\".\"Directors\" set \"FirstName\"=@ad,\"LastName\"=@soyad where \"Id\"=" + secilenId;
            connection.Open();
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@ad", txtAd.Text);
            komut.Parameters.AddWithValue("@soyad", txtSoyad.Text);
            komut.ExecuteNonQuery();
            connection.Close();
            yonetmenGoster(connection);
        }

        private void btnSil_Click(object sender, EventArgs e)
        {
            connection.Open();
            sorgu = "delete from \"public\".\"Directors\" where \"Id\"=@id";
            komut = new NpgsqlCommand(sorgu, connection);
            komut.Parameters.AddWithValue("@id", secilenId);
            komut.ExecuteNonQuery();
            connection.Close();
            yonetmenGoster(connection);
        }

        private void dataYonetmen_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataYonetmen.CurrentRow.Cells["Id"].Value.ToString();
            secilenId = Convert.ToInt32(id);
            txtAd.Text = dataYonetmen.CurrentRow.Cells["FirstName"].Value.ToString();
            txtSoyad.Text = dataYonetmen.CurrentRow.Cells["LastName"].Value.ToString();
        }


    }
}
